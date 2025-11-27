if (init == 0)
{
    var pedestal_npc = instance_create(1880, 190, obj_npc_room);
    with (pedestal_npc)
    {
        extflag = "pedestal";
        sprite_index = spr_castle_book_pillar;
        scr_depth();
    }
    shadowguy_sax = scr_dark_marker(1980, 142, spr_shadowman_sax_a);
    with (shadowguy_sax)
    {
        scr_flip("x");
        scr_depth();
        image_speed = 0.25;
    }
    var shadowguy_sax_readable = instance_create(shadowguy_sax.x - 90, shadowguy_sax.y + 40, obj_readable_room1);
    with (shadowguy_sax_readable)
    {
        extflag = "shadowguy_sax";
        image_xscale = 3;
        image_yscale = 3;
    }
    var shadowguy_sax_block = instance_create(shadowguy_sax.x - 100, shadowguy_sax.y + 40, obj_solidblocksized);
    with (shadowguy_sax_block)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
    shadowguy = scr_dark_marker(shadowguy_sax.x + 4, 142, spr_shadowman_idle_a);
    with (shadowguy)
    {
        scr_depth();
        image_speed = 0.25;
    }
    shadowguy_readable = instance_create(shadowguy.x + 20, shadowguy.y + 40, obj_readable_room1);
    with (shadowguy_readable)
    {
        extflag = "shadowguy";
        image_xscale = 3;
        image_yscale = 3;
    }
    var shadowguy_block = instance_create(shadowguy.x, shadowguy.y + 40, obj_solidblocksized);
    with (shadowguy_block)
    {
        image_xscale = 2.6;
        image_yscale = 2;
    }
    var pippins_marker = scr_dark_marker(shadowguy.x + 150, 170, spr_npc_pippins_jump);
    pippins_marker.image_speed = 0.2;
    with (pippins_marker)
        scr_depth();
    var pippins_readable = instance_create(pippins_marker.x + 8, pippins_marker.y + 16, obj_readable_room1);
    with (pippins_readable)
    {
        extflag = "pippins";
        image_xscale = 3;
        image_yscale = 2;
    }
    var pippins_block = instance_create(pippins_marker.x + 4, pippins_marker.y + 40, obj_solidblocksized);
    with (pippins_block)
    {
        image_xscale = 1.6;
        image_yscale = 1;
    }
    var save_point = instance_create(pippins_marker.x + 110, 230, obj_savepoint);
    with (save_point)
        scr_depth();
    var trash_marker = scr_dark_marker(save_point.x + 80, 174, spr_dw_ch3_b3bs_trashcan);
    with (trash_marker)
        scr_depth();
    var trash_readable = instance_create(trash_marker.x + 4, trash_marker.y + 20, obj_readable_room1);
    with (trash_readable)
    {
        extflag = "shutta";
        image_xscale = 2;
        image_yscale = 3;
    }
    var trash_block = instance_create(trash_marker.x + 4, trash_marker.y + 40, obj_solidblocksized);
    with (trash_block)
    {
        image_xscale = 1;
        image_yscale = 1;
    }
    shutta_marker = scr_dark_marker(trash_marker.x + 20, trash_marker.y + 80, spr_dw_couch_shutta_hand);
    shutta_marker.depth = trash_marker.depth + 10;
    var zapper_npc = instance_create(trash_marker.x + 110, 109, obj_npc_room);
    with (zapper_npc)
    {
        extflag = "zapper";
        sprite_index = spr_npc_zapper_talk;
    }
    lanino = scr_dark_marker(zapper_npc.x + 170, 260, spr_lanino_cool);
    with (lanino)
    {
        depth = 98340;
        image_xscale = -2;
        image_index = 3;
    }
    elnina = scr_dark_marker(lanino.x + 120, 260, spr_elnina_cool);
    with (elnina)
    {
        depth = 98350;
        image_index = 3;
    }
    var weather_guys_readable = instance_create(lanino.x - 10, 218, obj_readable_room1);
    with (weather_guys_readable)
    {
        extflag = "weather_guys";
        image_xscale = 7;
        image_yscale = 2;
    }
    var weather_block = instance_create(lanino.x - 10, 218, obj_solidblocksized);
    with (weather_block)
    {
        image_xscale = 4;
        image_yscale = 1;
    }
    var ramb_npc = instance_create(elnina.x + 90, 194, obj_npc_ramb);
    with (ramb_npc)
        scr_depth();
    var rouxls_npc = instance_create(ramb_npc.x + 90, 144, obj_npc_room);
    with (rouxls_npc)
    {
        extflag = "rouxls";
        sprite_index = spr_rurus_idle;
    }
    shadowguycon = 0;
    shadowguytimer = 0;
    weathercon = 0;
    weathertimer = 0;
    init = 1;
}
if (shadowguycon == 2)
{
    if (i_ex(shadowguy))
    {
        if (global.interact == 0)
            global.interact = 1;
        shadowguytimer++;
        if (shadowguytimer == 1)
        {
            snd_play_x(snd_damage, 0.8, 1.6);
            with (shadowguy)
            {
                sprite_index = spr_shadowman_hurt;
                scr_shakeobj();
                y = ystart;
                x = xstart;
            }
        }
        if (shadowguytimer >= 26)
        {
            with (shadowguy_readable)
                extflag = "shadowguy_fallen";
            shadowguy.image_xscale = 2;
            shadowguy.sprite_index = spr_shadowman_fallen;
            shadowguy.hspeed = 6;
            shadowguy.friction = 0.5;
            shadowguy.y += 80;
            shadowguy.x -= 30;
            snd_play(snd_bump);
            snd_play(snd_wing);
            shadowguycon = 3;
            shadowguytimer = 0;
        }
    }
}
if (shadowguycon == 3)
{
    if (shadowguy.hspeed == 0)
    {
        shadowguycon = 4;
        global.interact = 0;
    }
}
if (weather_talk)
{
    if (weather_talk_con == 0 && global.interact == 0)
    {
        weather_talk_con = 1;
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Ah^1, the stars. Charmed. We'll be your boss encounter./", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_194_0");
        msgnextloc("* Here's a little romantic forecast for you.../%", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_195_0");
        d_make();
    }
    if (weather_talk_con == 1 && !d_ex())
    {
        weather_talk_con = 2;
        weathercon = 1;
    }
    if (weather_talk_con == 2 && weathercon == 2)
    {
        weather_talk_con = 3;
        scr_speaker("no_name");
        msgsetloc(0, "* The weather.../%", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_211_0");
        d_make();
    }
    if (weather_talk_con == 3 && !d_ex())
    {
        weather_talk_con = 4;
        weathercon = 3;
    }
    if (weather_talk_con == 4 && weathercon == 0)
    {
        weather_talk_con = 5;
        scr_speaker("no_name");
        msgsetloc(0, "* ..^1. always sticks together./%", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_227_0");
        d_make();
    }
    if (weather_talk_con == 5 && !d_ex())
    {
        weather_talk_con = -1;
        weather_talk = false;
        global.interact = 0;
    }
}
if (global.flag[20] == 1)
{
    if (!weather_pose)
    {
        weather_pose = true;
        weathercon = 1;
    }
}
else if (global.flag[20] == 2)
{
    global.flag[20] = 0;
    if (weather_pose)
    {
        weather_pose = false;
        weathercon = 3;
    }
}
if (weather_pose)
{
    if (weather_pose_con == 0 && global.interact == 0)
    {
        global.interact = 1;
        weather_pose_con = 2;
        weathercon = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Tonight's weather is.../%", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_289_0");
        d_make();
    }
    if (weather_pose_con == 2 && !d_ex())
    {
        weather_pose_con = 3;
        weathercon = 3;
    }
    if (weather_pose_con == 3 && weathercon == 0)
    {
        weather_pose_con = 6;
        var weather_list = [stringsetloc("Moons", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_302_0"), stringsetloc("Crystal", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_302_1"), stringsetloc("Drop", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_302_2"), stringsetloc("Sun", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_302_3")];
        var weather_word = weather_list[irandom(array_length_1d(weather_list) - 1)];
        scr_speaker("no_name");
        msgsetsubloc(0, "* ~1./%", weather_word, "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_306_0");
        d_make();
    }
    if (weather_pose_con == 6 && !d_ex())
    {
        weather_pose_con = 0;
        weather_pose = false;
        global.interact = 0;
    }
}
if (weathercon == 1)
{
    weathertimer = 0;
    snd_play(snd_wing);
    with (lanino)
    {
        image_index = 0;
        scr_shakeobj();
    }
    with (elnina)
    {
        image_index = 0;
        scr_shakeobj();
    }
    weathercon = 2;
}
if (weathercon == 3)
{
    weathertimer++;
    if (weathertimer == 1)
    {
        with (lanino)
        {
            image_index = 0;
            image_speed = 0.5;
        }
        with (elnina)
        {
            image_index = 0;
            image_speed = 0.5;
        }
    }
    if (weathertimer == 4)
        snd_play(snd_wing);
    if (weathertimer == 7)
    {
        snd_play_x(snd_bell, 0.5, 0.8);
        with (lanino)
        {
            image_speed = 0;
            scr_animation(x, y - 80, 3133, 0.5, 0);
        }
        with (elnina)
        {
            image_speed = 0;
            scr_animation(x + 6, y - 80, 3133, 0.5, 0);
        }
        var flyingheart = scr_marker(((lanino.x + elnina.x) / 2) + 6, lanino.y - 96, spr_shadowman_sharpshoot_heart);
        with (flyingheart)
        {
            image_xscale = 0.5;
            image_yscale = 0.5;
            scr_lerpvar("image_alpha", 3, 0, 30, 0, "in");
            speed = 4 + random(2);
            direction = 90 + random_range(-20, 20);
            friction = 0.3;
            scr_doom(id, 60);
        }
    }
    if (weathertimer == 30)
        weathercon = 0;
}
if (shadow_play)
{
    if (shadow_play_con == 0 && !d_ex())
    {
        shadow_play_con = 1;
        global.interact = 1;
        snd_play(snd_shadowman_sax_1);
        scr_delay_var("shadow_play_con", 5, 20);
    }
    if (shadow_play_con == 5 && !d_ex())
    {
        global.interact = 0;
        shadow_play = false;
        shadow_play_con = 0;
    }
}
if (starwalker_active)
{
    if (starwalker_npc == -4)
    {
        if (obj_mainchara.x >= 450)
        {
            starwalker_npc = instance_create(40, 184, obj_npc_room);
            with (starwalker_npc)
            {
                extflag = "starwalker";
                sprite_index = spr_npc_originalstarwalker;
                scr_depth();
            }
        }
    }
}
if (shutta_talk)
{
    if (shutta_talk_con == 0 && global.interact == 0)
    {
        shutta_talk_con = 1;
        global.interact = 1;
        with (shutta_marker)
        {
            image_speed = 0.2;
            scr_lerpvar("y", ystart, ystart - 40, 6, 3, "out");
        }
        scr_speaker("no_name");
        msgsetloc(0, "* Everyone pose!/%", "obj_dw_ch3_curtainroomnpc_slash_Step_0_gml_353_0");
        d_make();
    }
    if (shutta_talk_con == 1 && !d_ex())
    {
        shutta_talk_con = 2;
        scr_delay_var("shutta_talk_con", 3, 30);
        with (obj_mainchara)
        {
            cutscene = 1;
            fun = 1;
            image_speed = 0.4;
            sprite_index = dsprite;
            var distance = distance_to_point(x, y);
            var max_speed = clamp(distance / 6, 6, 20);
            scr_move_to_point_over_time(2352, 222, max_speed);
            scr_delay_var("image_index", 0, max_speed);
            scr_delay_var("image_speed", 0, max_speed);
        }
        with (obj_caterpillarchara)
        {
            cutscene = 1;
            fun = 1;
            follow = 0;
            if (name == "susie")
            {
                var target_x_pos = 2402;
                image_speed = 0.4;
                sprite_index = (x > target_x_pos) ? lsprite : rsprite;
                var distance = distance_to_point(target_x_pos, 209);
                var max_speed = clamp(distance / 10, 10, 20);
                scr_move_to_point_over_time(target_x_pos, 209, max_speed);
                scr_delay_var("sprite_index", dsprite, max_speed);
                scr_delay_var("image_index", 0, max_speed);
                scr_delay_var("image_speed", 0, max_speed);
            }
            else if (name == "ralsei")
            {
                var target_x_pos = 2284;
                image_speed = 0.4;
                sprite_index = (x > target_x_pos) ? lsprite : rsprite;
                var distance = distance_to_point(target_x_pos, 213);
                var max_speed = clamp(distance / 10, 10, 20);
                scr_move_to_point_over_time(target_x_pos, 213, max_speed);
                scr_delay_var("sprite_index", dsprite, max_speed);
                scr_delay_var("image_index", 0, max_speed);
                scr_delay_var("image_speed", 0, max_speed);
            }
        }
    }
    if (shutta_talk_con == 3)
    {
        shutta_talk_con = 4;
        scr_delay_var("shutta_talk_con", 5, 15);
        with (obj_mainchara)
            sprite_index = spr_kris_pose;
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                sprite_index = spr_susie_pose;
            else if (name == "ralsei")
                sprite_index = spr_ralsei_pose;
        }
    }
    if (shutta_talk_con == 5 && !d_ex())
    {
        shutta_talk_con = 6;
        scr_delay_var("shutta_talk_con", 7, 30);
        var flash_background = scr_marker(0, 0, spr_pixel_white);
        with (flash_background)
        {
            image_xscale = 999;
            image_yscale = 999;
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 3);
            scr_script_delayed(scr_lerpvar, 6, "image_alpha", 1, 0, 6);
        }
        scr_doom(flash_background, 7);
        snd_play_volume(snd_camera_flash, 0.8);
    }
    if (shutta_talk_con == 7)
    {
        shutta_talk_con = 8;
        scr_delay_var("shutta_talk_con", 10, 8);
        with (shutta_marker)
        {
            image_speed = 0;
            image_index = 0;
            scr_lerpvar("y", ystart - 40, ystart, 6, 3, "out");
        }
        with (obj_mainchara)
            sprite_index = dsprite;
        with (obj_caterpillarchara)
            sprite_index = dsprite;
        scr_pan_to_obj(obj_mainchara, 8);
    }
    if (shutta_talk_con == 10)
    {
        shutta_talk_con = 0;
        global.interact = 0;
        global.facing = 0;
        shutta_talk = false;
        with (obj_mainchara)
        {
            cutscene = 0;
            fun = 0;
        }
        with (obj_caterpillarchara)
        {
            cutscene = 0;
            fun = 0;
            follow = 1;
            scr_caterpillar_interpolate();
        }
    }
}
