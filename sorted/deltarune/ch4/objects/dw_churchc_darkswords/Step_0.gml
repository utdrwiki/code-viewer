if (scr_debug() && keyboard_check_pressed(ord("P")))
    friends_protecc_state = 1;
if (con < 99)
{
    scr_populatechars();
    var _cx = camerax();
    var _cy = cameray();
    if (con == 0)
    {
        if (instance_exists(darkness))
            darkness.image_alpha = darkness_initial + max(0, ((kris.x - darkness_startx) / (darkness_midx - darkness_startx)) * (darkness_mid - darkness_initial));
        light_player.size = light_player_size - (60 * darkness.image_alpha);
        if (cutscene == 0 && kris.x > darkness_midx)
        {
            global.interact = 1;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            c_msgruncheck(true);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\E4* It's getting dark..^1. Let's stick together./%", "obj_dw_churchc_darkswords_slash_Step_0_gml_29_0");
            c_talk_wait();
            c_wait(15);
            c_sel(su);
            c_walkdirect(kris.x - 36, kris.y - 16, 25);
            c_sel(ra);
            c_walkdirect(kris.x - 70, kris.y - 12, 25);
            c_wait(45);
            cutscene = 1;
            c_customfunc(function()
            {
                global.facing = 1;
                slowwalk = instance_create(400, 0, obj_slowwalk);
                with (slowwalk)
                {
                    scr_sizeexact(room_width, room_height);
                    maxwalkspeed = 4;
                    extflag = "temporary walkntalk";
                }
                su_hunch = scr_dark_marker_fancy(su_actor.x - 2, su_actor.y + 6, spr_susie_walk_hunched);
                with (su_hunch)
                {
                    mask_index = spr_susie_right_dw;
                    depth = other.su_actor.depth;
                    offsetx = x - other.kr_actor.x;
                    offsety = y - other.kr_actor.y;
                }
                ra_hunch = scr_dark_marker(ra_actor.x + 2, ra_actor.y + 10, spr_ralsei_walk_hunched);
                with (ra_hunch)
                {
                    mask_index = spr_ralsei_right;
                    depth = other.ra_actor.depth;
                    offsetx = x - other.kr_actor.x;
                    offsety = y - other.kr_actor.y;
                }
            });
            c_actortokris();
            c_customfunc(function()
            {
                global.facing = 1;
            });
            c_terminatekillactors();
            layer_set_visible("TILES_DAMAGE", true);
            with (instance_create(360, 4040, obj_solidblockDark))
            {
                image_xscale = 5;
                image_yscale = 3;
            }
            scr_flag_set(7, 1);
            con = 1;
        }
    }
    if (con == 1)
    {
        if (cutscene == 1 && !i_ex(cutscene_master))
        {
            global.interact = 0;
            cutscene = 2;
        }
        if (cutscene == 3)
        {
            global.interact = 1;
            timer++;
            if (timer > 15)
            {
                timer = 0;
                cutscene_master = scr_cutscene_make();
                c_wait(35);
                c_msgruncheck(true);
                c_speaker("susie");
                c_msgside("top");
                c_msgsetloc(0, "\\EJ* ...!?/%", "obj_dw_churchc_darkswords_slash_Step_0_gml_107_0");
                c_talk_wait();
                c_terminatekillactors();
                cutscene = 4;
            }
        }
        if (cutscene == 4)
        {
            if (!i_ex(cutscene_master))
                global.interact = 0;
            else
                global.interact = 1;
        }
        if (instance_exists(darkness))
            darkness.image_alpha = darkness_mid + (((kris.x - darkness_midx) / (darkness_endx - darkness_midx)) * (darkness_end - darkness_mid));
        light_player.size = light_player_size - (60 * darkness.image_alpha);
        if (kris.x > darkness_endx)
        {
            super_darkness.image_alpha = (kris.x - darkness_endx) / (darkness_super_endx - darkness_endx);
            if (super_darkness.image_alpha >= 1)
            {
                if (darkness_hits > 0 && cutscene < 3)
                    cutscene = 3;
                if (darkness_hits >= 3)
                {
                    global.interact = 1;
                    timer++;
                    if (timer > 15)
                    {
                        timer = 0;
                        con = 2;
                        with (su_hunch)
                            instance_destroy();
                        with (ra_hunch)
                            instance_destroy();
                    }
                }
            }
        }
    }
    if (con == 2)
    {
        light_player.size = 24;
        light_player.lightalpha = 0;
        with (obj_mainchara)
        {
            x = other.horizontal_endx + 160;
            y = 3970;
            fun = 1;
            sprite_index = spr_kris_walk_up_windy;
        }
        with (obj_caterpillarchara)
        {
            follow = 0;
            if (name == "susie")
            {
                x = other.horizontal_endx + 185;
                y = 3980;
            }
            else
            {
                x = other.horizontal_endx + 125;
                y = 3984;
            }
        }
        with (cam)
        {
            panLimitLeft[0] = 3860;
            panLimitRight[0] = 3860;
            panLimitTop[0] = 0;
            event_user(1);
        }
        global.facing = 2;
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_customfunc(function()
        {
            su_hunch = scr_dark_marker_fancy(su_actor.x, su_actor.y, spr_susie_walk_up_windy);
            with (su_hunch)
            {
                depth = other.su_actor.depth;
                offsetx = x - other.kr_actor.x;
                offsety = y - other.kr_actor.y;
                redalpha = 0;
                hair_wind = true;
                hair_index = 0;
                
                draw_func = function()
                {
                    var _con = sprite_index == spr_susie_walk_up_windy || sprite_index == spr_susie_walk_up_windy_lookleft;
                    gpu_set_fog(true, c_red, 0, 1);
                    draw_sprite_ext(sprite_index, image_index, x, y - image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
                    draw_sprite_ext(sprite_index, image_index, x + image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
                    draw_sprite_ext(sprite_index, image_index, x, y + image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
                    draw_sprite_ext(sprite_index, image_index, x - image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
                    if (_con)
                    {
                        var _spr = spr_susie_walk_up_windy_hair;
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
                        draw_sprite_ext(spr_susie_walk_up_windy_hair, hair_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
                };
            }
            ra_hunch = scr_dark_marker_fancy(ra_actor.x, ra_actor.y, spr_ralsei_walk_up_windy);
            with (ra_hunch)
            {
                depth = other.ra_actor.depth;
                offsetx = x - other.kr_actor.x;
                offsety = y - other.kr_actor.y;
                redalpha = 0;
                hair_wind = true;
                hair_index = 0;
                
                draw_func = function()
                {
                    var _con = sprite_index == spr_ralsei_walk_up_windy || sprite_index == spr_ralsei_walk_up_windy_lookright;
                    gpu_set_fog(true, c_red, 0, 1);
                    draw_sprite_ext(sprite_index, image_index, x, y - image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
                    draw_sprite_ext(sprite_index, image_index, x + image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
                    draw_sprite_ext(sprite_index, image_index, x, y + image_yscale, image_xscale, image_yscale, 0, c_white, redalpha);
                    draw_sprite_ext(sprite_index, image_index, x - image_xscale, y, image_xscale, image_yscale, 0, c_white, redalpha);
                    if (_con)
                    {
                        var _spr = spr_ralsei_walk_up_windy_scarf;
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
                        draw_sprite_ext(spr_ralsei_walk_up_windy_scarf, hair_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
                };
            }
        });
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susie_walk_up_windy);
        c_sel(ra);
        c_autowalk(0);
        c_sprite(spr_ralsei_walk_up_windy);
        c_sel(kr);
        c_autowalk(0);
        c_sprite(spr_kris_walk_up_windy);
        c_msgside("top");
        c_speaker("susie");
        c_msgsetloc(0, "\\Ed* D..^1. Damn it!/", "obj_dw_churchc_darkswords_slash_Step_0_gml_274_0");
        c_msgnextloc("\\Ec* It's so dark..^1. we can't see anything.../", "obj_dw_churchc_darkswords_slash_Step_0_gml_275_0");
        c_msgnextloc("\\Eb* If this keeps up^1, we'll be.../%", "obj_dw_churchc_darkswords_slash_Step_0_gml_276_0");
        c_talk_wait();
        c_wait(15);
        c_customfunc(function()
        {
            mus_initloop("dark_place.ogg");
            mus_volume(global.currentsong[1], 0.5, 0);
            mus_volume(global.currentsong[1], 1, 150);
            with (super_darkness)
                instance_destroy();
            with (wind_effect)
            {
                con = 1;
                depth = 900000;
            }
            snd_volume(wind_sound, wind_sound_peak_volume, 300);
        });
        c_var_lerp_instance(fakesoul, "image_alpha", 0, 1, 25, 2, "out");
        whiteoutlineheart = scr_dark_marker(fakesoul.x, fakesoul.y, spr_heart_outline_white);
        whiteoutlineheart.depth = fakesoul.depth - 1;
        whiteoutlineheart.image_alpha = 0;
        whiteoutlineheart.image_xscale = 1;
        whiteoutlineheart.image_yscale = 1;
        c_wait(45);
        c_var_lerp_instance(whiteoutlineheart, "image_alpha", 0, 1, 10);
        c_var_lerp_instance(flash, "image_alpha", 0, 1, 10, 2, "out");
        audio_sound_pitch(snd_great_shine, 0.6);
        c_soundplay(snd_great_shine);
        c_customfunc(function()
        {
            scr_banish(fakesoul, 10);
            fakesoul = whiteoutlineheart;
            with (super_darkness)
                instance_destroy();
            draw_heart_effect = true;
            siner = 0;
        });
        c_wait(5);
        c_customfunc(function()
        {
            scr_lerpvar_instance(light_player, "lightalpha", 0, 0.6, 35);
            scr_lerpvar_instance(light_player, "size", 0, 64, 50, 2, "out");
            scr_lerpvar_instance(darkness, "image_alpha", 1, 0.76, 80);
        });
        c_wait(25);
        c_customfunc(function()
        {
            scr_lerpvar_instance(light_player_b, "lightalpha", 0, 0.4, 50);
            scr_lerpvar_instance(light_player_b, "size", 0, 124, 40, 2, "out");
        });
        c_wait(75);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ed* K..^1. Kris?/", "obj_dw_churchc_darkswords_slash_Step_0_gml_333_0");
        c_facenext("susie", "D");
        c_msgnextloc("\\ED* Kris...? What is that..^1. light?/%", "obj_dw_churchc_darkswords_slash_Step_0_gml_335_0");
        c_pannable(0);
        c_talk_wait();
        c_actortokris();
        c_customfunc(function()
        {
            cam.panStyle[0] = 3;
        });
        c_terminatekillactors();
        con = 6;
    }
    if (con == 6)
    {
        if (!i_ex(cutscene_master))
        {
            scr_lerpvar("heartalpha", 1, 0, 30);
            wound = false;
            cantdie = true;
            global.interact = 0;
            with (light_player)
                target = 1049;
            with (light_player_b)
                target = 1049;
            with (obj_mainchara)
                sprite_index = spr_kris_walk_up_windy;
            con = 7;
            sync_friends = true;
            with (obj_slowwalk)
                maxwalkspeed = 2;
        }
        else
        {
            global.interact = 1;
        }
    }
    if (con == 7)
    {
        if (kris.y < 3960 && !bulletareastarted)
        {
            bulletareastarted = true;
            scr_lerp_instance_var(kr_special, "redalpha", 0, 0.7, 15);
        }
        if (i_ex(flash))
        {
            flash.image_alpha = heartalpha + (scr_wave(0, 0.6, 5, 0) * (1 - heartalpha));
            if (flash.image_alpha <= 0.01)
                flash.visible = false;
        }
        if (friends_protecc_state == 0)
        {
            if (wound)
            {
                if (wound_heavy)
                {
                    wound_distance = 45;
                    wound_kneeltime = 80;
                    wound_returntime = 28;
                }
                wound_state = true;
                global.interact = 1;
                sync_friends = false;
                with (obj_mainchara)
                {
                    fun = 1;
                    sprite_index = spr_krisu_kneel_b;
                    drawbattlemode = 0;
                    scr_lerpvar("y", y, y + other.wound_distance, 15, 2, "out");
                }
                wound = false;
                timer = 0;
                scr_lerp_instance_var(kr_special, "redalpha", 0.7, 0, 15);
            }
            if (wound_state)
            {
                global.interact = 1;
                if (timer == 0)
                {
                    su_hunch.sprite_index = spr_susie_walk_up_windy_lookleft;
                    ra_hunch.sprite_index = spr_ralsei_walk_up_windy_lookright;
                }
                timer++;
                if (timer == 17)
                {
                    with (obj_mainchara)
                        scr_minishakeobj();
                }
                if (timer == 47 && wound_heavy)
                {
                    with (obj_mainchara)
                        scr_minishakeobj();
                }
                if (timer >= (wound_kneeltime - wound_standtime) && timer <= wound_kneeltime)
                {
                    obj_mainchara.sprite_index = spr_kris_stand_from_kneel_up;
                    obj_mainchara.image_index = min((1 - ((wound_kneeltime - timer) / wound_standtime)) * obj_mainchara.image_number, obj_mainchara.image_number - 1);
                    ra_hunch.sprite_index = spr_ralsei_lift;
                    ra_hunch.image_index = min(obj_mainchara.image_index, ra_hunch.image_number - 1);
                    su_hunch.sprite_index = spr_susie_lift;
                    su_hunch.image_index = min(obj_mainchara.image_index, su_hunch.image_number - 1);
                }
                var _briefpause = 5;
                if (timer == (wound_kneeltime + _briefpause))
                {
                    ra_hunch.sprite_index = spr_ralsei_walk_up_windy;
                    su_hunch.sprite_index = spr_susie_walk_up_windy;
                    obj_mainchara.sprite_index = spr_kris_walk_up_windy;
                    with (obj_mainchara)
                        scr_lerpvar("y", y, y - other.wound_distance, other.wound_returntime, 0);
                }
                if (timer > (wound_kneeltime + _briefpause))
                    obj_mainchara.sprite_index = spr_kris_walk_up_windy;
                if (timer > (wound_kneeltime + wound_returntime + _briefpause))
                {
                    sync_friends = true;
                    global.interact = 0;
                    wound_state = false;
                    scr_lerp_instance_var(kr_special, "redalpha", 0, 0.7, 15);
                }
            }
        }
        if (friends_protecc_state == 1)
        {
            framestore = obj_mainchara.image_index;
            sync_friends = false;
            global.interact = 1;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            ra_actor.x = ra_hunch.x;
            ra_actor.y = ra_hunch.y;
            su_actor.x = su_hunch.x;
            su_actor.y = su_hunch.y;
            su_actor.depth = su_hunch.depth;
            ra_actor.depth = ra_hunch.depth;
            su_actor.sprite_index = spr_susie_walk_up_windy_lookleft;
            ra_actor.sprite_index = ra_hunch.sprite_index;
            su_actor.image_index = su_hunch.image_index;
            ra_actor.image_index = ra_hunch.image_index;
            kr_actor.image_index = obj_mainchara.image_index;
            c_sel(kr);
            c_autofacing(0);
            c_autowalk(0);
            c_imageindex(framestore);
            c_sel(ra);
            c_autofacing(0);
            c_autowalk(0);
            c_imageindex(framestore);
            var _sux = su_actor.x;
            var _suy = su_actor.y;
            c_sel(su);
            c_autofacing(0);
            c_autowalk(0);
            c_imageindex(framestore);
            c_wait(30);
            c_sprite(spr_susie_run_up);
            c_imagespeed(0.6);
            c_walkdirect(kris.x - 8, kris.y - 14, 7);
            c_wait(2);
            c_sel(kr);
            c_lerp_var_instance(kr_special, "redalpha", 0.7, 0, 15);
            c_jump(_sux + 8, _suy + 14, 10, 12);
            c_wait(5);
            c_sel(su);
            c_sprite(spr_susie_walk_up_windy);
            c_imagespeed(0);
            c_imageindex(0);
            c_wait(20);
            c_sel(ra);
            c_sprite(spr_ralsei_walk_up_windy_lookright);
            c_sel(su);
            c_sprite(spr_susie_kneel_up);
            c_customfunc(function()
            {
                scr_lerp_var_instance(su_actor, "y", su_actor.y, su_actor.y + wound_distance, 15, 2, "out");
            });
            c_wait(17);
            c_customfunc(function()
            {
                with (su_actor)
                    scr_minishakeobj();
            });
            c_wait(43);
            c_msgside("top");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EC* S..^1. Susie...^1! What are you doing...!?/", "obj_dw_churchc_darkswords_slash_Step_0_gml_572_0");
            c_facenext("susie", "l");
            c_msgnextloc("\\El* ..^1. Like I'm going to let Kris hog all the bullets./%", "obj_dw_churchc_darkswords_slash_Step_0_gml_574_0");
            c_talk_wait();
            cam.targetYRelative[0] = -24;
            cam.targetXRelative[0] = -25;
            c_autowalk(0);
            c_sprite(spr_susie_stand_from_kneel_up);
            c_imageindex(0);
            c_sel(ra);
            c_autowalk(0);
            c_sprite(spr_ralsei_lift);
            c_imageindex(0);
            c_wait(4);
            c_var_instance(ra_actor, "image_index", 1);
            c_var_instance(su_actor, "image_index", 1);
            c_wait(4);
            c_var_instance(ra_actor, "image_index", 2);
            c_var_instance(su_actor, "image_index", 2);
            c_wait(4);
            c_var_instance(ra_actor, "image_index", 3);
            c_var_instance(su_actor, "image_index", 3);
            c_wait(4);
            c_wait(15);
            c_sprite(spr_ralsei_walk_up_windy);
            c_var_instance(ra_actor, "image_index", kris.image_index);
            c_sel(su);
            c_sprite(spr_susie_walk_up_windy);
            c_imageindex(kris.image_index);
            c_imagespeed(8 / (wound_returntime + 1));
            c_walkto_actor(su_actor, 0, -wound_distance, wound_returntime);
            c_wait(wound_returntime + 1);
            c_actortokris();
            c_customfunc(function()
            {
                wound = false;
                ra_hunch.x = ra_actor.x;
                ra_hunch.y = ra_actor.y;
                su_hunch.x = su_actor.x;
                su_hunch.y = su_actor.y;
                ra_hunch.visible = true;
                su_hunch.visible = true;
                sync_friends = true;
                ra_hunch.offsetx = ra_hunch.x - kr_actor.x;
                ra_hunch.offsety = ra_hunch.y - kr_actor.y;
                su_hunch.offsetx = su_hunch.x - kr_actor.x;
                su_hunch.offsety = su_hunch.y - kr_actor.y;
                with (obj_slowwalk)
                    maxwalkspeed = 2;
                scr_lerpvar_instance(su_hunch, "redalpha", 0, 0.7, 15);
            });
            c_terminatekillactors();
            friends_protecc_state = 3;
        }
        if (friends_protecc_state == 3)
        {
            if (!i_ex(cutscene_master))
            {
                global.interact = 0;
                if (wound)
                {
                    wound_state = true;
                    global.interact = 1;
                    sync_friends = false;
                    with (su_hunch)
                    {
                        sprite_index = spr_susie_kneel_up;
                        scr_lerpvar("y", y, y + other.wound_distance, 15, 2, "out");
                    }
                    scr_lerpvar_instance(su_hunch, "redalpha", 0.7, 0, 15);
                    wound = false;
                    timer = 0;
                }
                if (wound_state)
                {
                    global.interact = 1;
                    if (timer == 0)
                        ra_hunch.sprite_index = spr_ralsei_walk_up_windy_lookright;
                    timer++;
                    if (timer == 17)
                    {
                        with (su_hunch)
                            scr_minishakeobj();
                    }
                    if (timer == 47 && wound_heavy)
                    {
                        with (su_hunch)
                            scr_minishakeobj();
                    }
                    if (timer >= (wound_kneeltime - wound_standtime) && timer <= wound_kneeltime)
                    {
                        su_hunch.sprite_index = spr_susie_stand_from_kneel_up;
                        su_hunch.image_index = min((1 - ((wound_kneeltime - timer) / wound_standtime)) * su_hunch.image_number, su_hunch.image_number - 1);
                        ra_hunch.sprite_index = spr_ralsei_lift;
                        ra_hunch.image_index = min(su_hunch.image_index, ra_hunch.image_number - 1);
                    }
                    var _briefpause = 5;
                    if (timer == (wound_kneeltime + _briefpause))
                    {
                        with (su_hunch)
                        {
                            scr_lerpvar("y", y, y - other.wound_distance, other.wound_returntime, 0);
                            sprite_index = spr_susie_walk_up_windy;
                            image_speed = 8 / other.wound_returntime;
                        }
                        ra_hunch.sprite_index = spr_ralsei_walk_up_windy;
                    }
                    if (timer > (wound_kneeltime + wound_returntime + _briefpause))
                    {
                        sync_friends = true;
                        global.interact = 0;
                        wound_state = false;
                        su_hunch.sprite_index = spr_susie_walk_up_windy;
                        scr_lerpvar_instance(su_hunch, "redalpha", 0, 0.7, 15);
                    }
                }
            }
            else
            {
                global.interact = 1;
            }
        }
        if (friends_protecc_state == 4)
        {
            sync_friends = false;
            global.interact = 1;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            scr_actor_facing(ra_actor, "u");
            scr_actor_facing(su_actor, "u");
            ra_actor.x = ra_hunch.x;
            ra_actor.y = ra_hunch.y;
            su_actor.x = su_hunch.x;
            su_actor.y = su_hunch.y;
            su_actor.depth = su_hunch.depth;
            ra_actor.depth = ra_hunch.depth;
            su_actor.sprite_index = su_hunch.sprite_index;
            ra_actor.sprite_index = spr_ralsei_walk_up_windy_lookright;
            su_actor.image_index = su_hunch.image_index;
            ra_actor.image_index = ra_hunch.image_index;
            kr_actor.image_index = obj_mainchara.image_index;
            c_sel(kr);
            c_autofacing(0);
            c_autowalk(0);
            c_imageindex(framestore);
            c_sel(su);
            c_autofacing(0);
            c_autowalk(0);
            c_sprite(spr_susie_walk_up_windy);
            c_imageindex(framestore);
            var _rux = ra_actor.x;
            var _ruy = ra_actor.y;
            c_sel(ra);
            c_autofacing(0);
            c_autowalk(0);
            c_wait(30);
            c_sprite(spr_ralsei_walk_up_windy);
            c_imagespeed(0.9);
            c_walkdirect(su_actor.x + 6, su_actor.y + 4, 7);
            c_wait(2);
            c_sel(su);
            c_lerp_var_instance(su_hunch, "redalpha", 0.7, 0, 15);
            c_autofacing(0);
            c_jump(_rux - 6, _ruy - 4, 10, 12);
            c_wait(5);
            c_sel(ra);
            c_sprite(spr_ralsei_walk_up_windy);
            c_imagespeed(0);
            c_imageindex(0);
            c_wait(20);
            c_sel(ra);
            c_sprite(spr_ralsei_kneel_up);
            c_customfunc(function()
            {
                scr_lerp_var_instance(ra_actor, "y", ra_actor.y, ra_actor.y + wound_distance, 15, 2, "out");
            });
            c_wait(17);
            c_customfunc(function()
            {
                with (ra_actor)
                    scr_minishakeobj();
            });
            c_wait(43);
            c_msgside("top");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EQ* Susie..^1. Kris..^1. as long as.../", "obj_dw_churchc_darkswords_slash_Step_0_gml_804_0");
            c_msgnextloc("\\Ec* There's any pain I can take in your place.../", "obj_dw_churchc_darkswords_slash_Step_0_gml_805_0");
            c_msgnextloc("\\Ee* I'll be there^1, okay?/%", "obj_dw_churchc_darkswords_slash_Step_0_gml_806_0");
            c_talk_wait();
            c_autowalk(0);
            c_sprite(spr_ralsei_stand_from_kneel_up);
            c_imageindex(0);
            c_sel(su);
            c_autowalk(0);
            c_sprite(spr_susie_lift_r);
            c_imageindex(0);
            c_wait(4);
            c_var_instance(ra_actor, "image_index", 1);
            c_var_instance(su_actor, "image_index", 1);
            c_wait(4);
            c_var_instance(ra_actor, "image_index", 2);
            c_var_instance(su_actor, "image_index", 2);
            c_wait(4);
            c_var_instance(ra_actor, "image_index", 3);
            c_var_instance(su_actor, "image_index", 3);
            c_wait(4);
            c_wait(15);
            c_sprite(spr_susie_walk_up_windy);
            c_var_instance(su_actor, "image_index", kris.image_index);
            c_sel(ra);
            c_autowalk(0);
            c_imagespeed(0.25);
            c_sprite(spr_ralsei_walk_up_windy);
            c_walkto_actor(ra_actor, 0, -wound_distance, wound_returntime);
            c_wait(wound_returntime + 1);
            c_actortokris();
            c_customfunc(function()
            {
                wound = false;
                ra_hunch.x = ra_actor.x;
                ra_hunch.y = ra_actor.y;
                su_hunch.x = su_actor.x;
                su_hunch.y = su_actor.y;
                ra_hunch.visible = true;
                su_hunch.visible = true;
                su_hunch.sprite_index = spr_susie_walk_up_windy;
                sync_friends = true;
                ra_hunch.offsetx = ra_hunch.x - kr_actor.x;
                ra_hunch.offsety = ra_hunch.y - kr_actor.y;
                su_hunch.offsetx = su_hunch.x - kr_actor.x;
                su_hunch.offsety = su_hunch.y - kr_actor.y;
                with (obj_slowwalk)
                    maxwalkspeed = 2;
                scr_lerpvar_instance(ra_hunch, "redalpha", 0, 0.7, 15);
            });
            c_terminatekillactors();
            friends_protecc_state = 5;
        }
        if (friends_protecc_state == 5)
        {
            if (!i_ex(cutscene_master))
            {
                global.interact = 0;
                if (wound)
                {
                    wound_state = true;
                    global.interact = 1;
                    sync_friends = false;
                    with (ra_hunch)
                    {
                        sprite_index = spr_ralsei_kneel_up;
                        scr_lerpvar("y", y, y + other.wound_distance, 15, 2, "out");
                    }
                    scr_lerpvar_instance(ra_hunch, "redalpha", 0.7, 0, 15);
                    wound = false;
                    timer = 0;
                }
                if (wound_state)
                {
                    global.interact = 1;
                    timer++;
                    if (timer == 17)
                    {
                        with (ra_hunch)
                            scr_minishakeobj();
                    }
                    if (timer == 47 && wound_heavy)
                    {
                        with (ra_hunch)
                            scr_minishakeobj();
                    }
                    if (timer >= (wound_kneeltime - wound_standtime) && timer <= wound_kneeltime)
                    {
                        ra_hunch.sprite_index = spr_ralsei_stand_from_kneel_up;
                        ra_hunch.image_index = min((1 - ((wound_kneeltime - timer) / wound_standtime)) * ra_hunch.image_number, ra_hunch.image_number - 1);
                        su_hunch.sprite_index = spr_susie_lift_r;
                        su_hunch.image_index = min(ra_hunch.image_index, su_hunch.image_number - 1);
                    }
                    var _briefpause = 5;
                    if (timer == (wound_kneeltime + _briefpause))
                    {
                        with (ra_hunch)
                        {
                            scr_lerpvar("y", y, y - other.wound_distance, other.wound_returntime, 0);
                            sprite_index = spr_ralsei_walk_up_windy;
                            image_speed = 8 / other.wound_returntime;
                        }
                        su_hunch.sprite_index = spr_susie_walk_up_windy;
                        su_hunch.image_xscale = 2;
                    }
                    if (timer > (wound_kneeltime + wound_returntime + _briefpause))
                    {
                        sync_friends = true;
                        global.interact = 0;
                        wound_state = false;
                        ra_hunch.sprite_index = spr_ralsei_walk_up_windy;
                        scr_lerpvar_instance(ra_hunch, "redalpha", 0, 0.7, 15);
                    }
                }
            }
            else
            {
                global.interact = 1;
            }
        }
        if (kris.y < vertical_endy)
            con = 10;
    }
    if (con == 10)
    {
        with (wind_effect)
            con = 0;
        with (instance_create(4080, 1360, obj_solidblockDark))
        {
            image_xscale = 5;
            image_yscale = 5;
        }
        layer_set_visible("TILES_BLOCKED", true);
        scr_lerpvar_instance(ra_hunch, "redalpha", 0.7, 0, 15);
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        scr_actor_facing(ra_actor, "u");
        scr_actor_facing(su_actor, "u");
        global.interact = 1;
        ra_hunch.hair_wind = false;
        su_hunch.hair_wind = false;
        kr_special.hair_wind = false;
        ra_actor.x = ra_hunch.x;
        ra_actor.y = ra_hunch.y;
        su_actor.x = su_hunch.x;
        su_actor.y = su_hunch.y;
        ra_actor.depth = ra_hunch.depth;
        su_actor.depth = su_hunch.depth;
        ra_actor.sprite_index = ra_hunch.sprite_index;
        su_actor.sprite_index = su_hunch.sprite_index;
        su_actor.image_index = su_hunch.image_index;
        ra_actor.image_index = ra_hunch.image_index;
        c_wait(15);
        c_customfunc(function()
        {
            scr_banish(fakesoul, 50);
            scr_banish(flash, 50);
            scr_lerpvar_instance(light_player, "lightalpha", light_player.lightalpha, 0, 130);
            scr_lerpvar_instance(light_player, "size", light_player.size, 330, 150, 2, "in");
            scr_lerpvar_instance(light_player_b, "lightalpha", light_player_b.lightalpha, 0, 130);
            scr_lerpvar_instance(light_player_b, "size", light_player_b.size, 400, 150, 2, "in");
            scr_lerpvar_instance(darkness, "image_alpha", darkness.image_alpha, darkness_initial, 130);
            mus_fade(global.currentsong[1], 140);
            snd_volume(wind_sound, 0, 130);
            with (obj_darkcontroller)
                charcon = 0;
        });
        c_wait(160);
        c_sel(ra);
        c_facing("d");
        c_sel(su);
        c_facing("r");
        c_sel(kr);
        c_facing("l");
        c_msgside("bottom");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EQ* ..^1. Looks like that's the end of it./", "obj_dw_churchc_darkswords_slash_Step_0_gml_999_0");
        c_facenext("susie", "D");
        c_msgnextloc("\\ED* ..^1. Yeah./%", "obj_dw_churchc_darkswords_slash_Step_0_gml_1001_0");
        c_talk_wait();
        c_wait(30);
        c_speaker("susie");
        c_msgsetloc(0, "\\EY* ..^1. Let's finish this./%", "obj_dw_churchc_darkswords_slash_Step_0_gml_1005_0");
        c_talk_wait();
        c_wait(30);
        c_sel(kr);
        c_facing("d");
        with (obj_slowwalk)
            instance_destroy();
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
        con = 11;
        obj_mainchara.mask_index = spr_krisu_dark;
        obj_mainchara.fun = 0;
        wrappedup = true;
    }
    if (con == 11)
    {
        if (!i_ex(cutscene_master))
        {
            ra_hunch.visible = false;
            su_hunch.visible = false;
            with (obj_caterpillarchara)
                follow = 1;
            scr_caterpillar_interpolate();
            snd_free_all();
            global.interact = 0;
            con = 12;
        }
        else
        {
            global.interact = 1;
        }
        global.plot = 248;
        with (obj_border_controller)
            show_border();
    }
    if (con == 12)
    {
    }
    if (scr_debug() && keyboard_check_pressed(ord("K")))
        friends_protecc_state = 4;
}
