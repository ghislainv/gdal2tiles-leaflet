#!/bin/bash

# conda activate

#===== Probability

# Produce a 4 bands raster with RGBA
# gdaldem color-relief data/prob_icar.tif prob_color_file.txt data/prob_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"

# With gdal2tiles.py from GDAL
# gdal2tiles.py -p mercator -r average --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Deforestation probability" -w leaflet data/prob_RGB.tif data/tiles_RGB_14

#===== Forest cover
gdaldem color-relief data/proj2050_icar.tif proj_color_file.txt data/proj_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
gdal2tiles.py -p mercator -r average --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Forest cover change 2010-2050" -w leaflet data/proj_RGB.tif tiles_proj2050
