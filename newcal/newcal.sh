#!/bin/bash

# conda activate forestatrisk

#===== Past deforestation NCL for Locus (mbtiles)
gdaldem color-relief data/forest_NCL.tif fcc_color_file.txt data/fcc_RGB_newcal.tif -alpha -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9"
gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3857 -r near -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/fcc_RGB_newcal.tif data/fcc_RGB_newcal_mercator.tif 
gdal_translate -co "RESAMPLING=NEAREST" -of MBTiles data/fcc_RGB_newcal_mercator.tif data/fcc_newcal.mbtiles
gdaladdo -r nearest data/fcc_newcal.mbtiles 2 4 8 16
