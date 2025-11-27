wind_effect = instance_create(0, 0, obj_church_wind_effect);
wind_effect.con = 0;
con = 0;
timer = 0;
init = 0;
siner = 0;
cutscene = 0;
cutscene_master = 0;
snd_stop_all();
wind_sound = snd_loop(snd_strongwind_loop);
snd_volume(wind_sound, 0, 0);
wind_sound_peak_volume = 0.25;
framestore = 0;
bulletareastarted = false;
heartalpha = 1;
slowdown = false;
darkness_initial = 0.3;
darkness_hits = 0;
darkness_mid = 0.7;
darkness_end = 1;
sword_timer = 20;
sword_frames_between_each = 80;
music_started = false;
kr_actor = -1;
sword_pattern = 0;
cantdie = false;
sword_damage = 20;
swapsdone = 0;
draw_heart_effect = false;
warp_happened = false;
ra_hunch = -4;
su_hunch = -4;
kr_outline = -4;
ra_outline = -4;
su_outline = -4;
kr_special = scr_dark_marker_fancy(obj_mainchara.x, obj_mainchara.y, spr_krisu_dark);
with (kr_special)
{
    redalpha = 0;
    hair_wind = true;
    hair_index = 0;
    
    draw_func = function()
    {
        var _con = sprite_index == spr_kris_walk_up_windy;
        gpu_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x, y - image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
        draw_sprite_ext(sprite_index, image_index, x + image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
        draw_sprite_ext(sprite_index, image_index, x, y + image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
        draw_sprite_ext(sprite_index, image_index, x - image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
        if (_con)
        {
            var _spr = spr_kris_walk_up_windy_hair;
            if (hair_wind)
                hair_index = ((get_timer() / 1000000) * 30) / 5;
            draw_sprite_ext(_spr, hair_index, x, y - image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
            draw_sprite_ext(_spr, hair_index, x + image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
            draw_sprite_ext(_spr, hair_index, x, y + image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
            draw_sprite_ext(_spr, hair_index, x - image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
        }
        gpu_set_fog(false, c_black, 0, 0);
        draw_self();
        if (_con)
            draw_sprite_ext(spr_kris_walk_up_windy_hair, hair_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    };
}
su_actor = -4;
ra_actor = -4;
susieflippos = 0;
sync_friends = true;
sword_damage_horizontal = (global.maxhp[1] * 0.7) / 3;
friends_protecc_state = 0;
wound = false;
wound_state = false;
wound_heavy = false;
wound_distance = 40;
wound_kneeltime = 70;
wound_returntime = 28;
wound_standtime = 25;
wrappedup = false;
sword_endx = 3740;
darkness_startx = 360;
darkness_midx = 1000;
darkness_endx = 1600;
darkness_super_endx = 2000;
horizontal_endx = 4000;
vertical_starty = 3880;
vertical_endy = 940;
darkness = instance_create(0, 0, obj_darkness_overlay);
darkness.image_alpha = darkness_initial;
if (global.plot >= 248)
{
    with (obj_darkswordthrower)
        instance_destroy();
    with (obj_overworld_bulletarea_no_dark)
        instance_destroy();
    with (instance_create(4080, 1360, obj_solidblockDark))
    {
        image_xscale = 5;
        image_yscale = 5;
    }
    con = 99;
    with (kr_special)
        instance_destroy();
}
else
{
    var _separation = 200;
    for (var i = 0; i < 4; i++)
    {
        with (instance_create(darkness_super_endx + 100 + (i * _separation), 4040, obj_darkswordthrower))
        {
            image_xscale = 10;
            image_yscale = 30;
            pattern = ((i + 1) % 2) + 1;
            if (x > other.darkness_super_endx)
                murder = true;
            damage = other.sword_damage_horizontal;
            target = i;
            spring_length = 15;
        }
    }
    with (obj_overworld_bulletarea)
    {
    }
    layer_set_visible("DEBUG_ASSETS", 0);
    layer_set_visible("TILES_DAMAGE", false);
    layer_set_visible("TILES_BLOCKED", false);
    if (scr_debug())
    {
        if (keyboard_check(ord("P")))
        {
        }
    }
    super_darkness = scr_dark_marker(0, 0, spr_pixel_white);
    super_darkness.image_xscale = 200;
    super_darkness.image_yscale = 200;
    super_darkness.depth = 1100;
    super_darkness.image_blend = c_black;
    super_darkness.image_alpha = 0;
    light_player = instance_create(320, 4280, obj_light_following);
    light_player_size = 320;
    light_player.size = light_player_size;
    light_player.target = 1049;
    light_player.xoff = 18;
    light_player.yoff = 44;
    light_player.lightalpha = 0.08;
    light_player_b = instance_create(320, 4280, obj_light_following);
    light_player_b.size = 0;
    light_player_b.target = 1049;
    light_player_b.xoff = 18;
    light_player_b.yoff = 44;
    light_player_b.lightalpha = 0;
    flash = scr_marker(global.heartx, global.hearty, spr_heart_white);
    flash.depth = 1900;
    flash.image_alpha = 0;
    fakesoul = scr_marker(global.heartx, global.hearty, spr_heart);
    fakesoul.depth = 1950;
    fakesoul.image_alpha = 0;
    cam = instance_create(0, 0, obj_camera_advanced);
    with (cam)
        event_user(1);
    cam.panStyle[0] = 3;
    scr_setparty(1, 1, 0);
    global.hp[1] = global.maxhp[1];
    global.hp[2] = global.maxhp[2];
    global.hp[3] = global.maxhp[3];
    with (obj_mainchara)
    {
        battleheart.visible = false;
        drawbattlemode = 0;
    }
    with (obj_border_controller)
        hide_border(0.025);
}
