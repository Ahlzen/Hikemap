-- Tag transform script for hikemap OSM data imports
-- Based on the reference osm2pgsql script, but adds:
-- * Converts numeric tags (ele, width) to feet (ele_ft)
-- * Removes all tags with certain prefixes (massgis, gnis, ...)
-- * Tag unification (e.g. riverbank, trail, light rail)
-- * Basic (English) abbreviations for names
-- Logs errors and values that coudln't be converted.


require('string')
require('io')
require('os')

errlog = io.open('tagtransform.log', 'a+')
errlog:setvbuf('line')
errlog:write('\n', os.date(), '\n')


-- Unit conversions

metersToFt = 3.2787
conversions = {
	['m'] = metersToFt,
	['meter'] = metersToFt,
	['meters'] = metersToFt,
	['ft'] = 1,
	['feet'] = 1,
	['foot'] = 1,
	['\''] = 1,
	['cm'] = metersToFt / 100,
	['\'\''] = 1 / 12,
	['\"'] = 1 / 12
	}

function convert_to_feet(key, keyvalues)
   value = keyvalues[key]
   if (value == nil or value:lower() == 'unknown') then
      return nil
   end
   -- Test for plain numeric value (assume m)
   numericEle = tonumber(value)
   if (numericEle ~= nil) then
      return math.ceil(numericEle * metersToFt)
   end
   -- Test each pattern. Return first match.
   for unit,factor in pairs(conversions) do
      pattern = '^([%d%.]+)%s*' .. unit .. '$'
      match = string.match(value:lower(), pattern)
      if (match ~= nil) then
         numericEle = tonumber(match)
         if (numericEle ~= nil) then
            return math.ceil(numericEle * factor)
         end
      end
   end
   -- Not recognized. Log. (osm_id is not available :( )
   name = keyvalues['name']
   m = string.format('%s=\"%s\"  (\"%s\")\n', key, value, name)
   errlog:write(m)
   return nil   
end

function convert_all_to_feet(keyvalues)   
   for i,key in pairs({'ele','width'}) do
      if (keyvalues[key] ~= nil) then
      	 keyvalues[key .. '_ft'] = convert_to_feet(key, keyvalues)
      end
   end
end


-- Remove tags with specific prefixes

skip_key_prefixes = { 'massgis:', 'gnis:' }

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function remove_tags_by_prefix(keyvalues)
   for i,k in ipairs(delete_tags) do
   	  for j,prefix in ipairs(skip_key_prefixes) do
   	     if (string.starts(k,prefix)) then
             keyvalues[k] = nil
         end
      end
   end
end


-- Simplify/unify tagging

-- (replaces or adds tag values, so that we can simplify
-- filter expressions when querying and styling)

substitutes = {
	-- classify rail
	{'railway','rail', {rail_class='heavy'}},
	{'railway','light_rail', {rail_class='light'}},
	{'railway','subway', {rail_class='light'}},
	{'railway','funicular', {rail_class='light'}},
	{'railway','monorail', {rail_class='light'}},
	{'railway','tram', {rail_class='light'}},
	{'railway','preserved', {rail_class='light'}},
	-- classify ski lifts etc
	{'aerialway','cable_car', {aerialway_class='major'}},
	{'aerialway','gondola', {aerialway_class='major'}},
	{'aerialway','goods', {aerialway_class='major'}},
	{'aerialway','chair_lift', {aerialway_class='minor'}},
	{'aerialway','drag_lift', {aerialway_class='minor'}},
	{'aerialway','j-bar', {aerialway_class='minor'}},
	{'aerialway','magic_carpet', {aerialway_class='minor'}},
	{'aerialway','mixed_lift', {aerialway_class='minor'}},
	{'aerialway','platter', {aerialway_class='minor'}},
	{'aerialway','pylon', {aerialway_class='minor'}},
	{'aerialway','rope_tow', {aerialway_class='minor'}},
	{'aerialway','t-bar', {aerialway_class='minor'}},
	{'aerialway','zip_line', {aerialway_class='minor'}},
	-- rivers with area
	{'waterway','riverbank', {natural='water',water='river'}},
	-- footway/path (no real, consistent, distinction)
	{'highway','footway', {highway='path'}},
	-- these are used somewhat interchangeably (at least around here)
	{'landuse','conservation', {leisure='nature_reserve'}},
	{'boundary','protected_area', {leisure='nature_reserve'}},
	-- these are essentially equivalent
	{'amenty','graveyard', {landuse='cemetery'}}
}

function subtitute_tags(keyvalues)
	for i,v in ipairs(substitutes) do
		srckey = v[1]
		srcval = v[2]
		dest = v[3]
		if (keyvalues[srckey] == srcval) then
			for dk,dv in pairs(dest) do
				keyvalues[dk] = dv
			end
		end
	end
end


-- Common abbreviations

	-- NOTE:
	--  First element must be lowercase
	--  Order may be important; these are subtituted in-order.

abbreviations = {
	-- State names go first, since some contain words
	-- that would otherwise be abbreviated
	-- Use two-letter when no other suitable abbreviation exists:
	{'alabama','Alab.'},
	{'alaska','Alas.'},
	{'arizona','Ariz.'},
	{'arkansas','Ark.'},
	{'california','CA'},
	{'colorado','Colo.'},
	{'connecticut','Conn.'},
	{'delaware','Del.'},
	{'florida','Fl.'},
	{'georgia','GA'},
	{'hawaii','HI'},
	{'idaho','ID'},
	{'illinois','Ill.'},
	{'indiana','Ind.'},
	{'iowa','IA'},
	{'kansas','Kan.'},
	{'kentucky','KY'},
	{'louisiana','Lou.'},
	{'maine','ME'},
	{'maryland','MD'},
	{'massachusetts','Mass.'},
	{'michigan','Mich.'},
	{'minnesota','Minn.'},
	{'mississippi','Miss.'},
	{'missouri','MO'},
	{'montana','Mont.'},
	{'nebraska','Nebr.'},
	{'nevada','NV'},
	{'new hampshire','NH'},
	{'new jersey','NJ'},
	{'new mexico','NM'},
	{'new york','NY'},
	{'north carolina','NC'},
	{'north dakota','ND'},
	{'ohio','OH'},
	{'oklahoma','Okl.'},
	{'oregon','Or.'},
	{'pennsylvania','Penn.'},
	{'rhode island','RI'},
	{'south carolina','SC'},
	{'tennessee','Tenn.'},
	{'texas','TX'},
	{'utah','UT'},
	{'vermont','Ver.'},
	{'virginia','Virg.'},
	{'washington','Wash.'},
	{'west virginia','WV'},
	{'wisconsin','WI'},
	{'wyoming','WY'},
	{'district of columbia','DC'},
	-- Trail networks etc (add as needed)
	{'appalachian trail','AT'},
	{'long trail','LT'},
	-- Misc
	{'north','N.'},
	{'northwest','NW.'},
	{'northeast','NE.'},
	{'south','S.'},
	{'southwest','SW.'},
	{'southeast','SE.'},
	{'east','E.'},
	{'west','W.'},
	{'railroad','RR'},
	{'subdivision','Subdiv.'},
	{'street','St.'},
	{'road','Rd.'},
	{'avenue','Ave.'},
	{'highway','Hwy.'},
	{'way','Wy.'},
	{'turnpike','Tpk.'},
	{'extension','Ext.'},
	{'circle','Cir.'},
	{'terrace','Ter.'},
	{'drive','Dr.'},
	{'court','Ct.'},
	{'lane','Ln.'},
	{'trail','Tr.'},
	{'mount','Mt.'},
	{'mountain','Mtn.'},
	{'river','R.'},
	{'stream','Str.'},
	{'branch','Br.'},
	{'brook','Bk.'},
	{'swamp','Sw.'},
	{'pond','Pd.'},
	{'peak','Pk.'},
	{'saint','St.'}
}

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function abbreviate_name(keyvalues)
	name = keyvalues['name']
	if name ~= nil and keyvalues['short_name'] == nil then

		-- pad so we can easily match on whole words
		name = ' ' .. keyvalues['name'] .. ' '

		-- Lowercase version for searching
		lname = string.lower(name)

		-- NOTE: This assumes only one occurence per abbreviation and string
		-- (can't easily use gsub, since comparison must be case insensitive, so
		-- we use find instead and substitute manually)
		for i,k in ipairs(abbreviations) do
			long = ' ' .. k[1] .. ' '		
			startp,endp = string.find(lname,long)
			if startp ~= nil then
				-- found a match
				short = ' ' .. k[2] .. ' '
				name = string.sub(name,0,startp-1) .. short .. string.sub(name,endp+1)
				lname = string.sub(lname,0,startp-1) .. short .. string.sub(lname,endp+1)
			end
		end

		-- save and remove any whitespace padding
		keyvalues['short_name'] = trim(name)
	end
end



-- Standard functions

polygon_keys = { 'building', 'landuse', 'amenity', 'harbour', 'historic', 'leisure', 
      'man_made', 'military', 'natural', 'office', 'place', 'power',
      'public_transport', 'shop', 'sport', 'tourism', 'waterway',
      'wetland', 'water', 'aeroway' }

generic_keys = {'access','addr:housename','addr:housenumber','addr:interpolation','admin_level','aerialway','aeroway','amenity','area','barrier',
   'bicycle','brand','bridge','boundary','building','capital','construction','covered','culvert','cutting','denomination','disused','ele',
   'embarkment','foot','generation:source','harbour','highway','historic','hours','intermittent','junction','landuse','layer','leisure','lock',
   'man_made','military','motor_car','name','natural','office','oneway','operator','place','poi','population','power','power_source','public_transport',
   'railway','ref','religion','route','service','shop','sport','surface','toll','tourism','tower:type', 'tracktype','tunnel','water','waterway',
   'wetland','width','wood','type'}

function add_z_order(keyvalues)
   z_order = 0
   if (keyvalues["layer"] ~= nil and tonumber(keyvalues["layer"])) then
      z_order = 10*keyvalues["layer"]
   end

   zordering_tags = {{ 'railway', nil, 5, 1}, { 'boundary', 'administrative', 0, 1}, 
      { 'bridge', 'yes', 10, 0 }, { 'bridge', 'true', 10, 0 }, { 'bridge', 1, 10, 0 },
      { 'tunnel', 'yes', -10, 0}, { 'tunnel', 'true', -10, 0}, { 'tunnel', 1, -10, 0}, 
      { 'highway', 'minor', 3, 0}, { 'highway', 'road', 3, 0 }, { 'highway', 'unclassified', 3, 0 },
      { 'highway', 'residential', 3, 0 }, { 'highway', 'tertiary_link', 4, 0}, { 'highway', 'tertiary', 4, 0},
      { 'highway', 'secondary_link', 6, 1}, { 'highway', 'secondary', 6, 1},
      { 'highway', 'primary_link', 7, 1}, { 'highway', 'primary', 7, 1},
      { 'highway', 'trunk_link', 8, 1}, { 'highway', 'trunk', 8, 1},
      { 'highway', 'motorway_link', 9, 1}, { 'highway', 'motorway', 9, 1},
	}
   
   for i,k in ipairs(zordering_tags) do
      if ((k[2]  and keyvalues[k[1]] == k[2]) or (k[2] == nil and keyvalues[k[1]] ~= nil)) then
         if (k[4] == 1) then
            roads = 1
         end
         z_order = z_order + k[3]
      end
   end

   keyvalues["z_order"] = z_order

   return keyvalues, roads

end

function filter_tags_generic(keyvalues, nokeys)
   filter = 0
   tagcount = 0

   if nokeys == 0 then
      filter = 1
      return filter, keyvalues
   end

   delete_tags = { 'FIXME', 'note', 'source', 'attribution', 'source_url', 'created_by' }
   for i,k in ipairs(delete_tags) do
      keyvalues[k] = nil
   end
   
   remove_tags_by_prefix(keyvalues)
   subtitute_tags(keyvalues)
   abbreviate_name(keyvalues)
   convert_all_to_feet(keyvalues)

   for k,v in pairs(keyvalues) do
      for i, k2 in ipairs(generic_keys) do if k2 == k then tagcount = tagcount + 1; end end
   end
   if tagcount == 0 then
      filter = 1
   end

   return filter, keyvalues
end

function filter_tags_node (keyvalues, nokeys)
   return filter_tags_generic(keyvalues, nokeys)
end

function filter_basic_tags_rel (keyvalues, nokeys)

   filter, keyvalues = filter_tags_generic(keyvalues, nokeys)
   if filter == 1 then
      return filter, keyvalues
   end

   if ((keyvalues["type"] ~= "route") and (keyvalues["type"] ~= "multipolygon") and (keyvalues["type"] ~= "boundary")) then
      filter = 1
      return filter, keyvalues
   end

   return filter, keyvalues
end

function filter_tags_way (keyvalues, nokeys)
   filter = 0
   poly = 0
   tagcount = 0
   roads = 0

   filter, keyvalues = filter_tags_generic(keyvalues, nokeys)
   if filter == 1 then
      return filter, keyvalues, poly, roads
   end


   for i,k in ipairs(polygon_keys) do
      if keyvalues[k] then
         poly=1
         break
      end
   end
   

   if ((keyvalues["area"] == "yes") or (keyvalues["area"] == "1") or (keyvalues["area"] == "true")) then
      poly = 1;
   elseif ((keyvalues["area"] == "no") or (keyvalues["area"] == "0") or (keyvalues["area"] == "false")) then
      poly = 0;
   end

   keyvalues, roads = add_z_order(keyvalues)


   return filter, keyvalues, poly, roads
end

function filter_tags_relation_member (keyvalues, keyvaluemembers, roles, membercount)
   
   filter = 0
   boundary = 0
   polygon = 0
   roads = 0
   membersuperseeded = {}
   for i = 1, membercount do
      membersuperseeded[i] = 0
   end

   type = keyvalues["type"]
   keyvalues["type"] = nil
  

   if (type == "boundary") then
      boundary = 1
   end
   if ((type == "multipolygon") and keyvalues["boundary"]) then
      boundary = 1
   elseif (type == "multipolygon") then
      polygon = 1
      polytagcount = 0;
      for i,k in ipairs(polygon_keys) do
         if keyvalues[k] then
            polytagcount = polytagcount + 1
         end
      end
      if (polytagcount == 0) then
         for i = 1,membercount do
            if (roles[i] == "outer") then
               for k,v in pairs(keyvaluemembers[i]) do
                  keyvalues[k] = v
               end
            end
         end
      end
      for i = 1,membercount do
         superseeded = 1
         for k,v in pairs(keyvaluemembers[i]) do
            if ((keyvalues[k] == nil) or (keyvalues[k] ~= v)) then
               for j,k2 in ipairs(generic_keys) do
                  if (k == k2) then
                     superseeded = 0;
                     break
                  end
               end
            end
         end
         membersuperseeded[i] = superseeded
      end
   end

   keyvalues, roads = add_z_order(keyvalues)

   return filter, keyvalues, membersuperseeded, boundary, polygon, roads
end
