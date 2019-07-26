#!/bin/bash

#===== Probability

# Produce a 4 bands raster with RGBA
# gdaldem color-relief prob_icar.tif prob_color_file.txt prob_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"

# With gdal2tiles.py from GDAL
# gdal2tiles.py -p mercator -r average --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Deforestation probability" -w leaflet prob_RGB.tif tiles_RGB_14

#===== Forest cover
# gdaldem color-relief proj2050_icar.tif proj_color_file.txt proj_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
gdal2tiles.py -p mercator -r average --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Forest cover change 2010-2050" -w leaflet proj_RGB.tif tiles_proj2050
