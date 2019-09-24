#!/bin/bash

# conda activate forestatrisk

#===== Past deforestation NCL for Locus (mbtiles)
gdaldem color-relief data/forest_NCL.tif fcc_color_file.txt data/fcc_RGB_newcal.tif -alpha -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9"
gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3857 -r near -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/fcc_RGB_newcal.tif data/fcc_RGB_newcal_mercator.tif 
gdal_translate -co "RESAMPLING=NEAREST" -of MBTiles data/fcc_RGB_newcal_mercator.tif data/fcc_newcal.mbtiles
gdaladdo -r nearest data/fcc_newcal.mbtiles 2 4 8 16

#===== Numerical model stereo (mbtiles)
gdaldem color-relief data/Kuebeni_stereo_MNC-1.tif mn_color_file.txt data/mn_RGB_newcal.tif -alpha -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9"
gdalwarp -s_srs EPSG:32758 -t_srs EPSG:3857 -r near -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/mn_RGB_newcal.tif data/mn_RGB_newcal_mercator.tif 
gdal_translate -co "RESAMPLING=NEAREST" -of MBTiles data/mn_RGB_newcal_mercator.tif data/mn_newcal.mbtiles
gdaladdo -r nearest data/mn_newcal.mbtiles 2 4 8 16

#===== Numerical model Lidar (mbtiles)
gdaldem color-relief data/MNC.tif mn_color_file_lidar.txt data/mnc_RGB_newcal.tif -alpha -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9"
gdalwarp -s_srs EPSG:32758 -t_srs EPSG:3857 -r near -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/mnc_RGB_newcal.tif data/mnc_RGB_newcal_mercator.tif 
gdal_translate -co "RESAMPLING=NEAREST" -of MBTiles data/mnc_RGB_newcal_mercator.tif data/mnc_newcal.mbtiles
gdaladdo -r nearest data/mnc_newcal.mbtiles 2 4 8 16