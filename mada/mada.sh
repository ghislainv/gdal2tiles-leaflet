#!/bin/bash

# conda activate forestatrisk

#===== Past deforestation
#gdaldem color-relief data/fcc_recent.tif fcc_color_file.txt data/fcc_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
#gdal2tiles.py -p mercator -r near --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Recent deforestation 2000-2017" -w leaflet data/fcc_RGB.tif tiles_fcc

#===== Probability
#gdaldem color-relief data/prob_icar.tif prob_color_file.txt data/prob_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
#gdal2tiles.py -p mercator -r average --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Deforestation probability" -w leaflet data/prob_RGB.tif tiles_prob2010

#===== Future forest cover
# gdaldem color-relief data/proj2050_icar.tif proj_color_file.txt data/proj_RGB.tif -alpha -co "COMPRESS=LZW" -co "PREDICTOR=2" -co "BIGTIFF=YES"
# gdal2tiles.py -p mercator -r near --processes=3 -s EPSG:32738 -z 0-14 -c Cirad -t "Forest cover change 2010-2050" -w leaflet data/proj_RGB.tif tiles_proj2050

#===== Past deforestation Masoala for Locus (mbtiles)
gdal_translate -projwin 919980 8360010 1091970 8220000 -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/fcc_recent.tif data/fcc_recent_masoala.tif
gdaldem color-relief data/fcc_recent_masoala.tif fcc_color_file.txt data/fcc_RGB_masoala.tif -alpha -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9"
gdalwarp -s_srs EPSG:32738 -t_srs EPSG:3857 -r near -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/fcc_RGB_masoala.tif data/fcc_RGB_masoala_mercator.tif 
gdal_translate -co "RESAMPLING=NEAREST" data/fcc_RGB_masoala_mercator.tif data/fcc_masoala_bioscene.mbtiles
gdaladdo -r nearest data/fcc_masoala_bioscene.mbtiles 2 4 8 16

#===== Past deforestation Masoala Christelle for Locus (mbtiles)
#gdaldem color-relief data/fcc_masoala_christelle.tif fcc_color_file.txt data/fcc_RGB_masoala_christelle.tif -alpha -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9"
#gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3857 -r near -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=9" data/fcc_RGB_masoala_christelle.tif data/fcc_RGB_masoala_christelle_mercator.tif 
#gdal_translate -co "RESAMPLING=NEAREST" data/fcc_RGB_masoala_christelle_mercator.tif data/fcc_masoala_christelle.mbtiles
#gdaladdo -r nearest data/fcc_masoala_christelle.mbtiles 2 4 8 16
