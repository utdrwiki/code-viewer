scr_maskdraw_start = function(argument0, argument1, argument2, argument3) //gml_Script_scr_maskdraw_start
{
    gpu_set_blendenable(false)
    gpu_set_colorwriteenable(0, 0, 0, 1)
    draw_set_alpha(0)
    draw_rectangle(argument0, argument1, argument2, argument3, false)
    draw_set_alpha(1)
    return;
}

