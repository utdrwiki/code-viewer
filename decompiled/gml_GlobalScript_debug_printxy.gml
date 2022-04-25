debug_printxy = function(argument0, argument1, argument2) //gml_Script_debug_printxy
{
    if scr_debug()
    {
        camx = __view_get((0 << 0), 0)
        camy = __view_get((1 << 0), 0)
        camx = (argument0 + camerax())
        camy = (argument1 + cameray())
        draw_set_font(fnt_small)
        draw_set_color(c_black)
        draw_text(camx, camy, argument2)
        draw_text((camx + 1), camy, argument2)
        draw_text((camx + 1), (camy + 1), argument2)
        draw_text((camx + 1), (camy - 1), argument2)
        draw_text((camx - 1), camy, argument2)
        draw_text((camx - 1), (camy + 1), argument2)
        draw_text((camx - 1), (camy - 1), argument2)
        draw_text(camx, (camy - 1), argument2)
        draw_text((camx + 1), (camy - 1), argument2)
        draw_text((camx - 1), (camy - 1), argument2)
        draw_text(camx, (camy + 1), argument2)
        draw_text((camx + 1), (camy + 1), argument2)
        draw_text((camx - 1), (camy + 1), argument2)
        draw_set_color(c_gray)
        draw_text(camx, camy, argument2)
    }
    return;
}

