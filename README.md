# Hikemap #

**Work in progress**

Styles and scripts for rendering a topographic hiking map based on OpenStreetMap.
In part based on earlier work from
[TopOSM](https://github.com/Ahlzen/TopOSM) and
[TopOSM2](https://github.com/Ahlzen/TopOSM2).


## Requirements ##

For Debian/Ubuntu based systems, these packages will get you most of the way:

`postgresql postgresql-client postgresql-9.3-postgis-2.1 postgis wget tilestache python-numpy python-scipy python-pil proj-bin libmapnik mapnik-utils node-carto unzip fonts-dejavu fonts-dejavu-extra fonts-liberation fonts-sil-gentium fonts-sil-gentium-basic`

(`postgresql` and `postgis` versions may depend on your distro)


#### GDAL/OGR ####

NHD data is distributed in FileGDB format, which is only supported in `gdal` 1.11 or later. This may not available for your distro. If not, [instructions for building a more recent GDAL are here](http://trac.osgeo.org/gdal/wiki/BuildHints).

TODO.


#### Blit ####

Required for certain tilestache providers. Install with NPM.

TODO


#### Google Fonts ####

Hikemap uses a few high-quality open font families that are available from [Google Fonts](https://www.google.com/fonts). I have included a script that downloads and installs font families directly from Google Fonts:

```
sudo get_google_font alegreya alegreyasans alegreyasanssc
```


## Download and Process Data ##


#### Configure environment ####

Edit the `config` file and change the settings to match your environment. You can adjust the map extents here, which determines the area for which data is downloaded and rendered.


#### Data Sources ####

Hikemap uses the following data sources:

* OpenStreetMap - roads, trails, mountain peaks and most other features)
* National Elevation Dataset (NED) - hillshading and contour lines
* National Hydrographic Dataset (NHD) - streams, rivers, lakes and wetlands
* National Land Cover Tree Canopy Data - tree coverage
* OSM Water Polygons - aids ocean rendering

A script, `get_data`, contains functions to download and pre-process this data. You can download and process all required data (except OSM) like so:

```
source get_data
get_all_data
```

This may take a while, both the download and processing. Make sure you have plenty of disk space.


#### OSM Data Import ####

Hikemap includes a .style and .lua script for `osm2pgsql`, to select certain tags and perform some additional pre-processing during data import that simplifies rendering. Hstore is not required.

There is also a script that adds a few indexes to speed up certain queries.

To import an OSM extract, you would do something like:

```
. config
osm2pgsql -c -s -p $OSM_TABLE_PREFIX --drop -S hikemap.style --keep-coastlines --tag-transform-script hikemap_tagtransform.lua data/osm/us-northeast-latest.osm.pbf
./create_osm_indexes
```


## Processing Sources ##

The `process_sources` script builds the mapnik XML style files and a tilestache.conf from the source files under `sources/`.


#### Testing ####

TileStache comes with a simple server that you can use to test the supplied tilestache.conf:

```
tilestache-server.py --config=processed/tilestache.conf
```

The [tilestache documentation](http://tilestache.org/doc/) describes how to serve tiles using web servers more suitable for production.

Alternatively, you can use `tilestache-seed` to pre-render a set of tiles.