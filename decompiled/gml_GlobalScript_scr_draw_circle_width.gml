scr_draw_circle_width = function(argument0, argument1, argument2, argument3) //gml_Script_scr_draw_circle_width
{
    if (argument3 <= 1 || argument3 >= argument2)
    {
        draw_circle(argument0, argument1, argument2, argument3 < argument2)
        return;
    }
    ring_surf = -1
    if (!surface_exists(ring_surf))
    {
        ring_surf = surface_create((argument2 * 2), (argument2 * 2))
        surface_set_target(ring_surf)
        draw_clear_alpha(c_black, 0)
        draw_circle(argument2, argument2, argument2, 0)
        gpu_set_blendmode(bm_subtract)
        draw_circle(argument2, argument2, (argument2 - argument3), 0)
        gpu_set_blendmode(bm_normal)
        surface_reset_target()
    }
    draw_surface(ring_surf, (argument0 - argument2), (argument1 - argument2))
    return;
}

