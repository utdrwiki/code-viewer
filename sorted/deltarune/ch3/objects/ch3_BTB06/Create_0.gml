con = -1;
customcon = 0;
susie_attack_fx = false;
susie_attack_timer = 0;
set_tenna_pitch = false;
tenna_snap = false;
tenna_snap_obj = -4;
battle_start = false;
battle_active = false;
border_switch = false;
if (global.plot == 290)
{
    global.interact = 1;
    con = 50;
    bg_vfx = instance_find(obj_dw_snow_zone_battle_bg, 0);
    bg_vfx.depth = 99000;
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        sprite_index = rsprite;
        x = camerax() + 238;
        y = 188;
    }
    with (obj_caterpillarchara)
    {
        fun = 1;
        follow = 0;
        if (name == "susie")
        {
            sprite_index = spr_susie_walk_right_dw_unhappy;
            x = camerax() + 145;
            y = 196;
        }
        if (name == "ralsei")
        {
            sprite_index = spr_ralsei_walk_right_unhappy;
            x = camerax() + 60;
            y = 220;
        }
    }
    battle_bg = instance_create(camerax(), cameray(), obj_tenna_enemy_bg);
    with (battle_bg)
    {
        audience_y_pos = 480;
        paused = true;
    }
}
else if (global.plot >= 300 && global.plot < 310)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    scr_lerp_instance_var(blackall, "image_alpha", 1, 0, 60);
    with (obj_mainchara)
        cutscene = 1;
    tv_marker = scr_marker((camerax() + (view_wport[0] / 2)) - 160, cameray() - 400, spr_dw_tv_tvtimeSign);
    with (tv_marker)
        depth = 98990;
    tv_time = instance_create(camerax(), 230, obj_tenna_tv_time);
    bg_vfx = instance_create(0, 0, obj_dw_snow_zone_battle_bg);
    bg_vfx.depth = 99000;
    battle_bg = instance_create(camerax(), cameray(), obj_tenna_enemy_bg);
    with (battle_bg)
    {
        audience_y_pos = 480;
        paused = true;
    }
}
else
{
    instance_destroy();
}
