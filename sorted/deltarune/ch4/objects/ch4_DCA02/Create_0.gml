con = -1;
customcon = 0;
if (scr_flag_get(7) == 1)
    scr_flag_set(7, 0);
glass_readable = instance_create(162, 162, obj_readable_room1);
with (glass_readable)
{
    extflag = "glass";
    image_xscale = 10;
    image_yscale = 1.5;
}
starcount = 0;
if (global.plot >= 110 && global.plot < 120)
{
    con = 0;
    walk_timer = 0;
    walk_buffer = 0;
    legend_marker = scr_marker(640, 40, spr_dw_legend_example);
    with (legend_marker)
        scr_depth();
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_alpha = 1;
    blackall.image_blend = c_black;
    susie_heal_pos_x = 0;
    susie_heal_pos_y = 0;
    susie_heal = false;
    susie_heal_timer = 0;
    kris_color_blend = 0;
    kris_target_color = 32768;
    heal_siner = 0;
    kris_heal_marker = scr_dark_marker(camerax() - 100, cameray() - 100, spr_kris_injured);
    kris_heal_marker.image_index = 3;
    ralsei_heal = false;
    ralsei_heal_timer = 0;
    if (scr_debug())
    {
        with (obj_border_controller)
            hide_border();
    }
}
else
{
    instance_destroy();
}
