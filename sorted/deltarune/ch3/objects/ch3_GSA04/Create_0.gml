con = -1;
customcon = 0;
saveload = false;
var su_stove = scr_dark_marker(46, 178, spr_dw_chef_stove);
with (su_stove)
{
    depth = 98010;
    image_speed = 0.2;
}
var ra_stove = scr_dark_marker(554, 178, spr_dw_chef_stove);
with (ra_stove)
{
    depth = 98010;
    image_speed = 0.2;
}
if (scr_flag_get(7) == 1)
    scr_flag_set(7, 0);
if (global.plot < 100)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    darken = scr_dark_marker(-10, -10, spr_pixel_white);
    darken.image_xscale = 999;
    darken.image_yscale = 999;
    darken.depth = 100;
    darken.image_blend = c_black;
    darken.image_alpha = 0.5;
    darken.visible = 1;
    chefhat = scr_dark_marker(-10, -10, spr_tenna_chef_hat);
    chefhat.x = camerax() - 100;
    chefhat.y = cameray() - 100;
    tut = scr_dark_marker(0, 0, spr_chef_tutorial_01);
    tut.x = camerax() + 32 + sprite_get_width(spr_chef_tutorial_01);
    tut.y = cameray() + 12 + sprite_get_height(spr_chef_tutorial_01);
    tut.image_speed = 1.5;
    tut.image_xscale = 0;
    tut.image_yscale = 0;
    jumpstart_x = 0;
    jumpstart_y = 0;
    warnpitch = 0;
    bg_vfx = instance_create(0, 0, obj_ch3_GSA04_screen);
    tv_time = instance_create(0, 0, obj_tenna_tv_time);
    counter_marker = scr_dark_marker(0, 310, spr_dw_kitchen_counter);
    counter_marker.depth = 99000;
    screen = instance_find(obj_dw_chef_screen, 0);
    show_border = false;
    with (obj_border_controller)
        hide_border(1);
}
else
{
    snd_free_all();
    global.interact = 0;
    with (obj_mainchara)
        visible = 0;
    with (obj_caterpillarchara)
        visible = 0;
    scr_chefs_start(0);
    var retry_screen = instance_create(0, 0, obj_gameover_retry);
    instance_destroy();
}
