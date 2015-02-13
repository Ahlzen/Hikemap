-- Unit tests for functions in hikemap_tagtransform

require('luaunit')
require('hikemap_tagtransform')


-------------- Road classification ---------------

-- Interstates

function test_classify_interstate_1()
	kvs = {highway='motorway', ref='I-90'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'I')
	assertEquals(kvs['road_ref'], '90')
end

function test_classify_interstate_2()
	kvs = {highway='motorway', ref='I 295'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'I')
	assertEquals(kvs['road_ref'], '295')
end

function test_classify_interstate_3()
	kvs = {highway='motorway', ref='I90'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'I')
	assertEquals(kvs['road_ref'], '90')
end


-- US Highways

function test_classify_us_1()
	kvs = {highway='trunk', ref='US 1'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'U')
	assertEquals(kvs['road_ref'], '1')
end

function test_classify_us_2()
	kvs = {highway='trunk', ref=' US-44'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'U')
	assertEquals(kvs['road_ref'], '44')
end

function test_classify_us_3()
	kvs = {highway='trunk', ref='US12A'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'U')
	assertEquals(kvs['road_ref'], '12A')
end

-- State routes

function test_classify_state_1()
	kvs = {highway='primary', ref='SR 12A'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'S')
	assertEquals(kvs['road_ref'], '12A')
end

function test_classify_state_2()
	kvs = {highway='primary', ref='SR-6'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'S')
	assertEquals(kvs['road_ref'], '6')
end

function test_classify_state_ma()
	kvs = {highway='primary', ref='MA 128'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'S')
	assertEquals(kvs['road_ref'], '128')
end

function test_classify_state_nh()
	kvs = {highway='primary', ref='NH 5'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'S')
	assertEquals(kvs['road_ref'], '5')
end

function test_classify_state_vt()
	kvs = {highway='primary', ref='VT 131'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'S')
	assertEquals(kvs['road_ref'], '131')
end

-- Other routes

function test_classify_county_route()
	kvs = {highway='secondary', ref='CR 32'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], nil)
	assertEquals(kvs['road_ref'], '32')
end

-- Combined routes (only first one is significant)

function test_classify_combo()
	kvs = {highway='primary', ref='US2;MA 32'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'U')
	assertEquals(kvs['road_ref'], '2')
end

-- Not a numbered route

function test_classify_none_1()
	kvs = {highway='primary', ref='abc'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], nil)
	assertEquals(kvs['road_ref'], nil)
end

function test_classify_none_2()
	kvs = {highway='primary'}
	classify_road(kvs);
	assertEquals(kvs['road_class'], nil)
	assertEquals(kvs['road_ref'], nil)
end

-- Weird edge cases

function test_classify_edge_1()
	kvs = {highway='primary', ref=";"}
	classify_road(kvs);
	assertEquals(kvs['road_class'], nil)
	assertEquals(kvs['road_ref'], nil)
end

function test_classify_edge_2()
	kvs = {highway='primary', ref=";US 1"}
	classify_road(kvs);
	assertEquals(kvs['road_class'], nil)
	assertEquals(kvs['road_ref'], nil)
end

function test_classify_edge_3()
	kvs = {highway='primary', ref="US 1;"}
	classify_road(kvs);
	assertEquals(kvs['road_class'], 'U')
	assertEquals(kvs['road_ref'], '1')
end

function test_classify_edge_4()
	kvs = {highway='primary', ref=""}
	classify_road(kvs);
	assertEquals(kvs['road_class'], nil)
	assertEquals(kvs['road_ref'], nil)
end



lu = LuaUnit.new()
os.exit(lu:runSuite())
