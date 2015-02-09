Required packages
=================

postgresql postgresql-client postgis wget
tilestache blit(npm) python-numpy python-scipy python-pil ... 
 proj-bin libmapnik mapnik-utils node-carto unzip

fonts-dejavu fonts-dejavu-extra liberation-*
fonts-sil-gentium fonts-sil-gentium-basic

gdal-bin (>= 1.11 for NHD data in .gdb format)

postgresql-9.3-postgis-2.1 ?
(postgresql and postgis versions may depend on your distro)

# google fonts
get_google_font alegreya alegreyasans alegreyasanssc



#### TODO

* Precompute curves to eliminate canopy_mask_exp layer


#### OSM import

. config
osm2pgsql -c -s -p $OSM_TABLE_PREFIX --drop -S hikemap.style --keep-coastlines --tag-transform-script hikemap_tagtransform.lua data/osm/us-northeast-latest.osm.pbf


#### Create indexes

# Railroads
echo "CREATE INDEX idx_line_rail ON ${OSM_TABLE_PREFIX}_line USING gist(way) WHERE (railway IS NOT NULL);" | $DBCMD

# Roads
echo "CREATE INDEX idx_line_roads ON ${OSM_TABLE_PREFIX}_line USING gist(way) WHERE highway IN ('motorway','trunk','primary','secondary','tertiary','residential','unclassified','service','motorway_link','primary_link','secondary_link','tertiary_link');" | $DBCMD

# Trails
echo "CREATE INDEX idx_line_trails ON ${OSM_TABLE_PREFIX}_line USING gist(way) WHERE highway IN ('track', 'bridleway', 'footway', 'path', 'pedestrian', 'cycleway');" | $DBCMD

# Coastline
echo "CREATE INDEX idx_line_coastline ON ${OSM_TABLE_PREFIX}_line USING gist(way) WHERE \"natural\" = 'coastline'" | $DBCMD

# Places
echo "CREATE INDEX idx_point_places ON ${OSM_TABLE_PREFIX}_point USING gist(way) WHERE place IS NOT NULL AND name IS NOT NULL;" | $DBCMD

# Natural
echo "CREATE INDEX idx_point_peaks ON ${OSM_TABLE_PREFIX}_point USING gist(way) WHERE \"natural\" = 'peak'" | $DBCMD


