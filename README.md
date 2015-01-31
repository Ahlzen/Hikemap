Required packages
=================



tilestache blit(npm) python-numpy python-scipy python-pil ... 

gdal-bin proj-bin libmapnik mapnik-utils node-carto
fonts-dejavu fonts-dejavu-extra liberation-*
# TODO: Check extra fonts



TODO

* Precompute curves to eliminate canopy_mask_exp layer




    {
      "name": "hydro_poly",
      "id": "hydro_poly",
      "srs": "${EPSG3857}",
      "Datasource": {
        ${DBSETTINGS},
        "table": "(
          SELECT way, waterway, natural, water, name, intermittent
          FROM ${OSM_TABLE_PREFIX}_poly
          WHERE waterway = 'riverbank' OR natural = 'water'
          ) AS waterway"
      }
    }