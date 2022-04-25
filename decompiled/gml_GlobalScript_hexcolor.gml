hexcolor = function(argument0) //gml_Script_hexcolor
{
    return ((((argument0 & 255) << 16) | (argument0 & 65280)) | ((argument0 >> 16) & 255));
}

