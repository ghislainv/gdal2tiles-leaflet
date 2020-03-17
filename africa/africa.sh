#!/bin/bash

# conda activate forestatrisk

#=== GDAl COG (Cloud Optimized GeoTIFF)
gdaladdo -r nearest data-far-tropics/prob.tif 2 4 8 16 32 64 128 256 512 1024 2048

gdal_translate -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "TILED=YES" \
-co "COPY_SRC_OVERVIEWS=YES" -co "BLOCKXSIZE=256" -co "BLOCKYSIZE=256" \
data-far-tropics/prob.tif data-far-tropics/prob_tiled.tif

# Geoserver, Building and using an image pyramid
# https://docs.geoserver.org/stable/en/user/tutorials/imagepyramid/imagepyramid.html
gdal_retile.py -v -useDirForEachRow -r near -levels 7 -ps 2048 2048 \
-co "TILED=YES" -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BLOCKXSIZE=256" -co "BLOCKYSIZE=256" \
-targetDir pyramid_prob_AFR data/prob.tif