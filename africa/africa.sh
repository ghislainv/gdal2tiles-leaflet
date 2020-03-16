#!/bin/bash

# conda activate forestatrisk

gdaladdo -r cubic data/prob_AFR.tif 2 4 8 16

# Geoserver, Building and using an image pyramid
# https://docs.geoserver.org/stable/en/user/tutorials/imagepyramid/imagepyramid.html

#===== Probability
gdal_retile.py -useDirForEachRow -r bilinear -levels 4 -ps 2048 2048 -co "TILED=YES" -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" -co "BIGTIFF=YES" -targetDir pyramid_prob_AFR data/prob.tif