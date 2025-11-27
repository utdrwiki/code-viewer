con = -1;
customcon = 0;
door_marker = scr_marker(423, 295, spr_noellehouse_door_dess);
with (door_marker)
    scr_depth();
door_marker.visible = 0;
noelle_door_marker = scr_marker(323, 295, spr_noellehouse_door);
with (noelle_door_marker)
    scr_depth();
noelle_door_marker.visible = 0;
kris_hide = false;
kris_shadow = 0;
noelle_hide = false;
noelle_shadow = 0;
drawer_cover_marker = scr_marker(462, 333, spr_noellehouse_main_drawer_cover);
with (drawer_cover_marker)
    depth = 98000;
drawer_marker = scr_marker(462, 340, spr_noellehouse_main_drawer);
drawer_marker.depth = drawer_cover_marker.depth - 10;
drawer_shake = false;
if (global.plot == 61)
{
    con = 0;
    kris_overlay = instance_create(0, 0, obj_noellehouse_kris_overlay);
    kris_overlay.depth = 3000;
    kris_overlay.set_alpha(0.8);
    kris_overlay.overlay_active = true;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    door_marker.visible = 1;
    closet_marker = scr_marker(363, 435, spr_noellehouse_door);
    with (closet_marker)
        depth = 95999;
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
}
else
{
    instance_destroy();
}
