con = -1;
customcon = 0;
if (global.plot >= 240 && global.plot < 290)
{
    con = 0;
    door_lock = scr_marker(320, 70, bg_church_entrance_door_lock);
    door_lock.image_blend = merge_color(c_white, c_navy, 0.6);
    door_lock.depth = 400100;
    door_vfx = instance_create(292, 33, obj_ch4_DCB03_church_door);
    door_vfx.depth = 1000000;
    darkness_vfx = instance_create(0, 0, obj_ch4_DCB03_darkness);
    if (scr_debug())
        scr_setparty(1, 0);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 1;
    blackall.visible = 1;
}
else
{
    instance_destroy();
}
