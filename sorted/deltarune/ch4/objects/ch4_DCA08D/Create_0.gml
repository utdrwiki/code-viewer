con = -1;
customcon = 0;
darkentimer = 0;
darkencon = 0;
darkenalpha = 0;
darkentimer2 = 0;
darkencon2 = 0;
darkenalpha2 = 0;
follow_light = -4;
shortened = false;
if (scr_flag_get(850) < 4)
{
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_alpha = 0;
    ralsei_heal = false;
    ralsei_heal_con = 0;
    ralsei_heal_timer = 0;
    ralsei_heal_loop = false;
    heal_blast = false;
    heal_marker = -4;
    heal_blast_timer = 0;
    adjust_caterpillar = false;
    chandelier = scr_dark_marker(2930, 1750, spr_dw_church_chandelier_broken);
    with (chandelier)
        depth = 100100;
    var shards_marker = scr_dark_marker(2884, 1994, spr_dw_church_window_shards);
    with (shards_marker)
        depth = 100100;
    chandelier_sway = false;
    chandelier_sway_timer = 0;
    gerson_oops = false;
    gerson_oops_con = 0;
    make_npcs = false;
    var fought_any = false;
    var prop_list = scr_get_ini_value_all_slots(global.chapter, "Ch4Boss");
    for (var i = 0; i < array_length(prop_list); i++)
    {
        var prop = prop_list[i][0];
        var value = prop_list[i][1];
        if (value == 1)
        {
            fought_any = true;
            break;
        }
    }
    global.tempflag[100] = fought_any ? 1 : 0;
    if (global.tempflag[98] == 1)
    {
        global.tempflag[100] = 1;
        global.interact = 1;
        global.facing = 1;
        shortened = true;
        snd_free_all();
        blackall.image_blend = c_black;
        blackall.image_alpha = 1;
        scr_lerp_var_instance(blackall, "image_alpha", 1, 0, 15);
        darkness_overlay = instance_find(obj_darkness_overlay, 0);
        with (darkness_overlay)
            scr_delay_var("active", 1, 1);
        with (obj_dw_church_dark_maze_controller)
            con = 6;
        krlight = instance_create(x, y, obj_light_following);
        with (krlight)
        {
            target = 1049;
            preset = 1;
            setxy(899, 678);
        }
        sulight = instance_create(x, y, obj_light_following);
        sulight.preset = 2;
        ralight = instance_create(x, y, obj_light_following);
        ralight.preset = 3;
        with (obj_light_following)
            size = clamp(distance_to_point(2122, 1960) / 5, 54, 180);
        con = 3;
        with (obj_border_controller)
        {
            set_border(border_dw_church_a, 1);
            hide_border(1);
        }
    }
}
else
{
    instance_destroy();
}
