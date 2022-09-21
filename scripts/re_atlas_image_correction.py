########################################################################################################################################
#################################################### Author:      s3raph                ################################################
#################################################### Purpose:     Modify Atlas Images   ################################################
#################################################### Version:     1.00                  ################################################
#################################################### Last Update: 20220921              ################################################
########################################################################################################################################

from PIL import Image, ImageEnhance, ImageFilter
import PIL
import PIL.ImageOps 
import fnmatch
import os

var_file_match = []
for root, dirnames, filenames in os.walk('./'):
    for filename in fnmatch.filter(filenames, '*.jpg'):
        var_file_match.append(os.path.join(root, filename))

for var_match in var_file_match:
    with Image.open(var_match) as var_base_image:
        var_length = len(var_match)
        var_match_str = var_match[:var_length-4]
        var_base_image.load()
        var_convert_image_1 = PIL.ImageEnhance.Color(var_base_image)
        var_image_proc = var_convert_image_1.enhance(0.1)
        var_match_dc = var_match_str + "_decolorized.jpg"
        var_image_proc.save(var_match_dc)
        var_grayscale_image = var_image_proc.convert('L')
        var_match_gs = var_match_str + "_grayscale.jpg"
        print(var_match_gs)
        var_grayscale_image.save(var_match_gs)
        var_inverted_image = PIL.ImageOps.invert(var_base_image)
        var_match_inv = var_match_str + "_inverted.jpg"
        print(var_match_inv)
        var_inverted_image.save(var_match_inv)
        var_convert_image = PIL.ImageEnhance.Contrast(var_grayscale_image)
        var_grayscale_image2 = var_convert_image.enhance(1.3)
        var_convert_image_2 = PIL.ImageEnhance.Brightness(var_grayscale_image2)
        var_grayscale_image3 = var_convert_image_2.enhance(0.6)
        var_base_image_gray_smooth = var_grayscale_image3.filter(ImageFilter.SMOOTH)
        var_image_smooth_edge = var_base_image_gray_smooth.filter(ImageFilter.FIND_EDGES)
        var_image_enhance_edge = var_base_image_gray_smooth.filter(ImageFilter.EDGE_ENHANCE)
        var_match_edges = var_match_str + "_edges.jpg"
        print(var_match_edges)
        var_image_enhance_edge.save(var_match_edges)

###########################################################################
################################# ENDING ##################################
###########################################################################

############################### LEGAL NOTES ###############################

###########################################################################
###               Copyright (C)  2021  s3raph                             #
###                                                                       #
### This program is free software: you can redistribute it and/or modify  # 
### it under the terms of the GNU General Public License as published by  #
### the Free Software Foundation, either version 3 of the License, or     #
### (at your option) any later version.                                   #
###                                                                       #
### This program is distributed in the hope that it will be useful,       #
### but WITHOUT ANY WARRANTY; without even the implied warranty of        #
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
### GNU General Public License for more details.                          #
###                                                                       #
### You should have received a copy of the GNU General Public License     #  
### along with this program.                                              #
### If not, see <https://www.gnu.org/licenses/>.                          #
###########################################################################

################################## FIN ####################################