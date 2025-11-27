con = -1;
customcon = 0;
kris_catch = false;
net_throw = false;
kris_hide = false;
kris_shadow = 0;
net_shake = false;
if (scr_flag_get(737) == 1)
{
    con = 0;
    kris_overlay = instance_create(0, 0, obj_noellehouse_kris_overlay);
    kris_overlay.depth = 3000;
    kris_overlay.set_alpha(0.8);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    door_marker = scr_marker(540, 435, spr_noellehouse_door);
    with (door_marker)
        depth = 95999;
    closet_marker = scr_marker(363, 435, spr_noellehouse_door);
    with (closet_marker)
        depth = 95999;
    with (obj_homealone_treat_catcher)
        instance_destroy();
    catcher_marker = scr_marker(514, 474, spr_noellehouse_treat_catcher_kris);
    with (catcher_marker)
        scr_depth();
    net_marker = scr_marker(549, 496, spr_noellehouse_treat_catcher_kris_net);
    with (net_marker)
        scr_depth();
    net_marker.visible = 0;
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
