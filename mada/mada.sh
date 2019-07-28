#!/bin/bash

# conda activate forestatrisk

#===== Past deforestation
gdaldem color-relief data/fcc_recent.tif fcc_color_file.txt data/fcc_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
gdal2tiles.py -p mercator -r near --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Recent deforestation 2000-2017" -w leaflet data/fcc_RGB.tif tiles_fcc

#===== Probability
#gdaldem color-relief data/prob_icar.tif prob_color_file.txt data/prob_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
#gdal2tiles.py -p mercator -r average --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Deforestation probability" -w leaflet data/prob_RGB.tif tiles_prob2010

#===== Future forest cover
# gdaldem color-relief data/proj2050_icar.tif proj_color_file.txt data/proj_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
# gdal2tiles.py -p mercator -r near --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Forest cover change 2010-2050" -w leaflet data/proj_RGB.tif tiles_proj2050
