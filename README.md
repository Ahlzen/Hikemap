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

# TODO: Check extra fonts




TODO

* Precompute curves to eliminate canopy_mask_exp layer
* Use custom osm2pgsql style (to eliminate need for hstore)
* Import data: ele -> ele_ft (use lua script)
* Import data: name -> name_abbr (Mount -> Mt., South -> S. etc)
* Import data: add index on line.highway, line.railway