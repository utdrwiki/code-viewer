draw_sprite_ext_pivotscale = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //gml_Script_draw_sprite_ext_pivotscale
{
    draw_sprite_ext(argument0, argument1, (argument2 - (argument9 * (argument4 - image_xscale))), (argument3 - (argument10 * (argument5 - image_yscale))), argument4, argument5, argument6, argument7, argument8)
    return;
}

