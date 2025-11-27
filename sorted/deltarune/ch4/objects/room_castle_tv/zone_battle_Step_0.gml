if (mic_active)
{
    if (obj_mainchara.x >= 3760)
    {
        mic_timer++;
        if (mic_timer == 120)
        {
            with (mic_marker)
                scr_lerpvar("image_alpha", 0, 1, 60);
        }
        if (mic_timer >= 120)
        {
            if ((mic_timer % 6) == 1)
            {
                with (mic_marker)
                {
                    y = ystart + random(2);
                    x = xstart + random(2);
                }
            }
        }
        if (mic_timer == 360)
        {
            with (mic_marker)
                scr_lerpvar("image_alpha", 1, 0, 60);
        }
        if (mic_timer == 430)
            mic_active = false;
    }
}
if (!i_ex(obj_cutscene_master))
{
    with (blackall_zone)
    {
        var min_x = 640;
        var max_x = 3680;
        var darkness_value = clamp(((obj_mainchara.x - min_x) * 100) / (max_x - min_x), 0, 100);
        image_alpha = 1 * (darkness_value * 0.01);
    }
    if (mike_track[1] != -4)
    {
        var min_x = 640;
        var max_x = 3680;
        var darkness_value = clamp(((obj_mainchara.x - min_x) * 100) / (max_x - min_x), 0, 100);
        audio_sound_gain(mike_track[1], 1 * (darkness_value * 0.01), 0);
    }
}
if (con < 0)
    exit;
if (con == 5 && !d_ex())
{
    con = 10;
    if (shortened)
        con = 20;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    mi = actor_count + 1;
    mi_actor = instance_create(camerax() + 265, -120, obj_actor);
    scr_actor_setup(mi, mi_actor, "mike");
    mi_actor.sprite_index = spr_mike_s;
    za = actor_count + 2;
    za_actor = instance_create(-100, -100, obj_actor);
    scr_actor_setup(za, za_actor, "zapper");
    za_actor.sprite_index = spr_npc_zapper_talk;
    sh = actor_count + 3;
    sh_actor = instance_create(-100, -100, obj_actor);
    scr_actor_setup(sh, sh_actor, "shadowguy");
    sh_actor.sprite_index = spr_shadowman_reload_right;
    c_sel(za);
    c_visible(0);
    c_sel(sh);
    c_visible(0);
    var kr_x_pos = camerax() + 300;
    var kr_y_pos = 220;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, 4);
    c_sel(kr);
    c_setxy(kr_actor.x, 490);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    if (!solo_mode)
    {
        c_sel(su);
        c_setxy(su_actor.x, 490);
        c_sel(ra);
        c_setxy(ra_actor.x, 500);
        c_wait(6);
        var su_x_pos = kr_x_pos + 40;
        var su_y_pos = kr_y_pos + 6;
        var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, 8);
        c_sel(su);
        c_walkdirect(su_actor.x, kr_y_pos + 6, 40);
        c_delaywalkdirect(41, su_x_pos, su_y_pos, su_walktime);
        c_delayfacing(41 + su_walktime + 1, "u");
        var ra_x_pos = kr_x_pos - 50;
        var ra_y_pos = kr_y_pos + 10;
        var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, 8);
        c_wait(10);
        c_sel(ra);
        c_walkdirect(ra_actor.x, ra_y_pos, 40);
        c_delaywalkdirect(41, ra_x_pos, ra_y_pos, ra_walktime);
        c_delayfacing(41 + ra_walktime + 1, "u");
        c_wait(40);
    }
    c_wait(30);
    if (!shortened)
    {
        c_customfunc(function()
        {
            global.msc = -99;
            global.choice = -1;
            global.choicemsg = [stringsetloc("Yeah,#it said#\"Mike\"", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_148_0"), stringsetloc("No,#it said#\"Mike\"", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_149_0")];
        });
        c_speaker("no_name");
        c_msgsetloc(0, "* Hey^1, the heck are you doing in here?!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_154_0");
        c_msgnextloc("* Didn't you read that DOOR?!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_155_0");
        c_msgnext("\\C2");
        c_customfunc(function()
        {
            var d = d_make();
            d.side = 1;
        });
    }
    else
    {
        c_sel(mi);
        c_lerp_var_instance(mi_actor, "y", -120, 125, 20, 2, "out");
        c_wait(21);
    }
    c_waitcustom();
}
if (con == 10 && global.choice != -1 && customcon == 1)
{
    con = 15;
    customcon = 0;
    k_d(3);
    c_waitcustom_end();
    if (global.choice == 0)
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* AND YOU STILL WENT INSIDE!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_186_0");
    }
    else if (global.choice == 1)
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* IF YOU DIDN'T READ IT HOW DO YOU KNOW WHAT IT SAID!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_190_0");
    }
    c_customfunc(function()
    {
        global.msc = -99;
        global.choice = -1;
        global.choicemsg = [stringsetloc("#We're Mike", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_199_0"), stringsetloc("#You're Mike", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_200_0")];
        if (solo_mode)
            global.choicemsg[0] = stringsetloc("#I'm Mike", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_207_0");
    });
    c_msgnextloc("* What!? What!? You think you're Mike or somethin'!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_204_0");
    c_msgnext("\\C2");
    c_customfunc(function()
    {
        var d = d_make();
        d.side = 1;
    });
    c_waitcustom();
}
if (con == 15 && global.choice != -1 && customcon == 1)
{
    con = 20;
    customcon = 0;
    k_d(3);
    c_waitcustom_end();
    c_msgside("bottom");
    if (global.choice == 0)
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* Wrong^1! WRONG!!^1! Are you GETTING this!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_229_0");
        c_msgnextloc("* Ya hearing yourself YAPPING^1, ya room noise!? AIR CHECK!!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_230_0");
        c_talk_wait();
        c_wait(30);
        c_speaker("no_name");
        c_msgsetloc(0, "* ..^1. no^1, MIKE CHECK!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_236_0");
        c_talk_wait();
    }
    else if (global.choice == 1)
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* ..^1. Miii hi hi hi hi hi hyike!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_241_0");
        c_msgnextloc("* So ya figured it out^1, did ya?!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_242_0");
        c_talk_wait();
        c_wait(30);
        c_speaker("no_name");
        c_msgsetloc(0, "* Mee-yike^1, that's right!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_248_0");
        c_talk_wait();
    }
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* There's only ONE real MIKE.../%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_257_0");
    c_talk_wait();
    c_sel(mi);
    c_sprite(spr_mike_s_pointing);
    c_lerp_var_instance(mi_actor, "y", -120, 125, 20, 2, "out");
    c_wait(21);
    c_wait(5);
    c_autowalk(0);
    c_imageindex(1);
    c_shakeobj();
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* And that's ME!!!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_275_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = 25;
    snd_free_all();
    if (global.flag[1695] == 0)
        global.flag[1695] = 1;
    mike_controller = instance_create(0, 0, obj_mike_controller);
    instance_create(0, 0, obj_battleback);
    with (obj_actor)
        visible = 0;
    var _m = instance_create(camerax() + 488, cameray() + 200, obj_mike_battle);
    _m.x = mi_actor.x + (_m.sprite_width / 2);
    _m.y = mi_actor.y + (_m.sprite_height / 2);
    with (_m)
    {
        speed = point_distance(x, y, xstart - 32, ystart) / 20;
        direction = point_direction(x, y, xstart - 32, ystart);
    }
    encounterflag = 177;
    global.flag[54] = encounterflag;
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("mike.ogg");
    snd_volume(global.currentsong[1], 0, 20);
    if (scr_debug())
    {
    }
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    obj_mainchara.x = kr_x;
    obj_mainchara.y = kr_y;
    obj_mainchara.visible = 1;
    if (scr_havechar("susie") && scr_havechar("ralsei"))
    {
        var su_x = su_actor.x;
        var su_y = su_actor.y;
        var ra_x = ra_actor.x;
        var ra_y = ra_actor.y;
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                x = su_x;
                y = su_y;
            }
            else if (name == "ralsei")
            {
                x = ra_x;
                y = ra_y;
            }
            scr_caterpillar_interpolate();
            visible = 1;
        }
    }
    instance_create(0, 0, obj_encountermike);
}
if (con == 25 && i_ex(obj_mike_attack_controller))
{
    var battle_end = false;
    with (obj_mike_attack_controller)
    {
        if (finished)
        {
            battle_end = true;
            global.specialbattle = 3;
            scr_endcombat();
        }
    }
    if (battle_end)
    {
        con = 26;
        global.interact = 1;
        with (obj_mainchara)
        {
            freeze = 1;
            visible = 0;
        }
        with (obj_caterpillarchara)
            visible = 0;
    }
}
if (con == 26)
{
    with (obj_actor)
    {
        if (sprite_index == spr_mike_s_pointing)
            sprite_index = spr_mike_s;
    }
    with (obj_caterpillarchara)
    {
        sprite_index = usprite;
        fun = 1;
    }
    with (obj_mike_battle)
    {
        if (sprite_index == spr_mike_small)
        {
            xscale = -1;
            sad = 0;
            image_speed = 0;
            image_index = 0;
            var _newx = 375 + (sprite_width / 2);
            var _newy = 122 + (sprite_height / 2);
            x += ((_newx - x) * 0.25);
            y += ((_newy - y) * 0.25);
            if (point_distance(x, y, _newx, _newy) < 4)
            {
                x = scr_approach(x, _newx, 1);
                y = scr_approach(y, _newy, 1);
            }
            if (x == _newx && y == _newy)
            {
            }
        }
    }
    with (obj_mike_battle)
    {
        if (sprite_index == spr_zapper_jump)
        {
            image_speed = 0;
            image_index = 0;
            var _newx = 377 + (sprite_width / 2);
            var _newy = 78 + (sprite_height / 2);
            x += ((_newx - x) * 0.25);
            y += ((_newy - y) * 0.25);
            if (point_distance(x, y, _newx, _newy) < 4)
            {
                x = scr_approach(x, _newx, 1);
                y = scr_approach(y, _newy, 1);
            }
            if (x == _newx && y == _newy)
            {
            }
        }
    }
    with (obj_mike_battle)
    {
        if (sprite_index == spr_shadowman_reload)
        {
            image_speed = 0;
            var _newx = 225;
            var _newy = 86 + (sprite_height / 2);
            x += ((_newx - x) * 0.25);
            y += ((_newy - y) * 0.25);
            if (point_distance(x, y, _newx, _newy) < 4)
            {
                x = scr_approach(x, _newx, 1);
                y = scr_approach(y, _newy, 1);
            }
            if (x == _newx && y == _newy)
            {
                other.con++;
                global.specialbattle = 0;
                snd_stop(global.batmusic[1]);
                snd_free(global.batmusic[1]);
                with (obj_mainchara)
                    visible = 0;
                with (obj_caterpillarchara)
                    visible = 0;
                with (obj_actor)
                    visible = 1;
                with (obj_mike_controller)
                    instance_destroy();
            }
        }
    }
}
if (con == 27 && customcon == 1)
{
    con = 90;
    customcon = 0;
    global.interact = 1;
    global.facing = 0;
    npc_animate = true;
    npc_animate_target = za_actor;
    c_waitcustom_end();
    c_var_instance(blackall, "image_alpha", 0);
    setxy(270, 122, mi_actor);
    setxy(154, 96, sh_actor);
    setxy(380, 65, za_actor);
    c_waitcustom_end();
    c_sel(mi);
    c_sprite(spr_mike_s);
    c_visible(1);
    c_sel(sh);
    c_visible(1);
    c_sel(za);
    c_visible(1);
    with (obj_mike_battle)
        instance_destroy();
    c_msgside("bottom");
    c_speaker("no_name");
    c_msgsetloc(0, "* Sorry^1, sorry. I admit it. I admit it./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_510_0");
    c_msgnextloc("* It was so hard doing what Tenna wanted^1, I couldn't do it alone./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_511_0");
    c_msgnextloc("* I needed more.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_512_0");
    c_msgnextloc("* More Mikes!!^1! And along the way^1, I forgot who I really was./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_513_0");
    if (solo_mode)
        c_msgnextloc("* But you..^1. Helped me remember./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_523_0");
    else
        c_msgnextloc("* But you guys..^1. Helped me remember./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_514_0");
    c_msgnextloc("* I'm the only Mike..^1. The real one./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_515_0");
    c_msgnextloc("* These two guys.../%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_516_0");
    c_talk();
    c_wait_box(4);
    c_sel(mi);
    c_sprite(spr_mike_s_point_down);
    c_wait_box(5);
    c_sel(mi);
    c_sprite(spr_mike_s_mic_up);
    c_wait_talk();
    c_wait(15);
    c_sel(mi);
    c_autowalk(0);
    c_sprite(spr_mike_s_pointing_both);
    c_imagespeed(0.2);
    c_addxy(-4, 2);
    c_shakeobj();
    c_sel(za);
    c_sprite(spr_zapper_hurt);
    c_setxy(395, 95);
    c_shakeobj();
    c_sel(sh);
    c_sprite(spr_shadowman_hurt);
    c_flip("x");
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* Are fakes!!^1! Beat them up!!!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_550_0");
    c_msgnextloc("* Make them pay for being so stupid!!!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_551_0");
    c_talk_wait();
    c_sel(za);
    c_autowalk(0);
    c_sprite(spr_npc_zapper_talk);
    c_setxy(380, 65);
    c_sel(sh);
    c_sprite(spr_shadowman_reload_right);
    c_flip("x");
    c_sel(mi);
    c_halt();
    c_wait(15);
    c_sel(sh);
    c_autowalk(0);
    c_lerp_var_instance(sh_actor, "x", 154, 168, 6);
    c_wait(12);
    c_sel(mi);
    c_visible(0);
    c_sprite(spr_pippins_shock);
    c_addxy(16, 0);
    c_snd_play(snd_wing);
    c_sel(sh);
    c_autowalk(0);
    c_sprite(spr_mike_s_costume_remove);
    c_var_lerp_instance(sh_actor, "image_index", 0, 7, 16);
    c_wait(60);
    c_sel(mi);
    c_visible(1);
    c_sel(sh);
    c_sprite(spr_shadowman_reload_right);
    c_lerp_var_instance(sh_actor, "x", 168, 154, 6);
    c_var_instance(id, "npc_animate", false);
    c_speaker("no_name");
    c_msgsetloc(0, "* .../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_599_0");
    c_msgnextloc("* All right. I admit it. None of us are actually Mike./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_600_0");
    c_msgnextloc("* We're just kind of..^1. in charge of Mike's room. Unofficially./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_601_0");
    c_msgnextloc("* Tenna's always talking to Mike^1, right...?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_602_0");
    c_msgnextloc("* Well^1, ya see^1, sometimes he wants to come to this room and..^1. \"visit\" him./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_603_0");
    c_msgnextloc("* It's been that way since TV world!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_604_0");
    c_msgnextloc("* But he gets really moody if Mike isn't there..^1. And takes it out on us./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_605_0");
    c_msgnextloc("* Now^1, here's the thing about that./%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_606_0");
    c_talk();
    c_wait_box(1);
    c_sel(sh);
    c_sprite(spr_shadowman_embarrassed);
    c_sel(za);
    c_sprite(spr_zapper_spare);
    c_addxy(10, 20);
    c_sel(mi);
    c_sprite(spr_pippins_eyes_closed);
    c_wait_talk();
    c_wait(30);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_down);
    c_halt();
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* Mike has NEVER been here!!^1! Not ONCE!!!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_630_0");
    c_msgnextloc("* And in order to stop Tenna from getting his nose twisted up.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_631_0");
    c_msgnextloc("* We just started taking turns pretending to be him!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_632_0");
    c_msgnextloc("* And you know what the weird thing is!? It actually worked!!!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_633_0");
    c_msgnextloc("* As long as there's a Mike^1, Tenna actually believes it!!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_634_0");
    c_msgnextloc("* Obviously^1, we couldn't let you in here^1, or you'd snitch./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_635_0");
    c_msgnextloc("* ..^1. But it's too late now. Our conspiracy is busted./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_636_0");
    c_msgnextloc("* ..^1. Just^1, before you tell Tenna^1, lemme ask you one last thing./%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_637_0");
    c_talk();
    c_wait_box(5);
    c_sel(mi);
    c_sprite(spr_pippins_thinking);
    c_imagespeed(0.2);
    c_wait_talk();
    c_wait(30);
    c_snd_play(snd_wing);
    c_var_instance(board_marker, "x", (camerax() + (view_wport[0] / 2)) - 80);
    c_var_instance(board_marker, "visible", true);
    c_var_lerp_to_instance(board_marker, "y", 90, 15);
    c_var_lerp_to_instance(sh_actor, "x", 114, 15);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_down);
    c_imagespeed(0.2);
    c_var_lerp_to("y", 115, 8);
    c_var_lerp_to("x", 250, 8);
    c_sel(za);
    c_sprite(spr_npc_zapper_jump);
    c_addxy(-10, -20);
    c_var_lerp_to("image_index", 5, 12);
    c_var_lerp_to("x", 410, 12);
    c_delaycmd(13, "sprite", spr_npc_zapper_talk);
    c_delaycmd(13, "imageindex", 0);
    c_delaycmd(13, "iamgespeed", 0);
    c_wait(15);
    c_customfunc(function()
    {
        mike_base_pos = [mi_actor.x, mi_actor.y];
        mike_shake = true;
    });
    c_speaker("no_name");
    c_msgsetloc(0, "* Who's Mike?^1! Who is he?!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_688_0");
    c_msgnextloc("* 'cause none of us have ever seen him^1! None of us^1! Ever!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_689_0");
    c_msgnextloc("* Every time Tenna asks Mike to do something^1, it's either like.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_690_0");
    c_msgnextloc("* He just does it himself^1, we do it secretly^1, or.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_691_0");
    c_msgnextloc("* It just sorta happens!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_692_0");
    c_msgnextloc("* So who is Mike!? Who is he!? Is he just Tenna's imaginary friend!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_693_0");
    c_msgnextloc("* Is he Tenna's alter-ego!? Like some alternate personality or something?!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_694_0");
    c_msgnextloc("* And why the hell does he get so much love and attention!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_695_0");
    c_msgnextloc("* If the weather guys are second-in-command^1, what does that make him?!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_696_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Uh^1, what if it's us?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_698_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Us?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_700_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Yeah^1, we been pretending to be Mike doin' stuff.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_702_0");
    c_msgnextloc("* What if when we pretend to be Mike^1, we's actually Mike?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_703_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* What?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_705_0");
    c_msgnextloc("* It's ALWAYS been us!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_706_0");
    c_msgnextloc("* Then where'd the idea of Mike come from in the first place?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_707_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Beats me.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_709_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* This doesn't make any sense!!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_711_0");
    if (solo_mode)
    {
        c_msgnextloc("* What about you!? You came to this room.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_728_0");
        c_msgnextloc("* Are YOU Mike?^1! Are you!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_729_0");
    }
    else
    {
        c_msgnextloc("* What about you guys!? You came to this room.../", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_712_0");
        c_msgnextloc("* Are YOU guys Mike?^1! Are you!?/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_713_0");
    }
    c_msgnextloc("* Huh!? Are ya!? Are ya!?/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_714_0");
    c_talk();
    c_wait_box(2);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_point_left);
    c_wait_box(3);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_point_right);
    c_wait_box(4);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_point_left);
    c_wait_box(5);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_down);
    c_wait_box(6);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_point_left);
    c_wait_box(7);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_point_right);
    c_wait_box(8);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_down);
    c_wait_box(10);
    c_var_instance(id, "npc_animate", true);
    c_wait_box(12);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_stop);
    c_var_instance(id, "mike_shake", false);
    c_wait_box(14);
    c_var_instance(id, "npc_animate", true);
    c_wait_box(15);
    c_var_instance(id, "npc_animate", true);
    c_wait_box(19);
    c_var_instance(id, "mike_shake_intensity", 2);
    c_var_instance(id, "mike_shake", true);
    c_var_instance(id, "mike_flip", true);
    c_wait_box(21);
    c_var_instance(id, "npc_animate", true);
    c_wait_box(24);
    c_var_instance(id, "mike_flip", false);
    c_sel(mi);
    c_sprite(spr_pippins_exasperated_point_forward);
    c_shakeobj();
    c_wait_talk();
    c_wait(30);
    c_sel(mi);
    c_sprite(spr_pippins_thinking);
    c_imagespeed(0.2);
    c_var_instance(id, "mike_shake", false);
    if (scr_flag_get(779) < 2 || solo_mode)
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* Ahhhh^1, I give up^1! As long as someone's Mike^1, it'll work out!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_807_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* Ahhhh^1, I give up^1! It's time to face the music./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_812_0");
        c_msgnextloc("* Go ahead..^1. snitch to Tenna./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_813_0");
        c_facenext("susie", 0);
        if (scr_tenna_alt_plot())
            c_msgnextloc("\\ED* Tenna..^1. he's..^1. he's^1, uh^1, not in this Dark World^1, y'know./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_817_0");
        else
            c_msgnextloc("\\E0* Dude^1, we gave him away. He's not even in this Dark World anymore./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_821_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* H-huh!? You mean..^1. We..^1. We.../%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_824_0");
        c_talk();
        c_wait_box(3);
        c_sel(su);
        c_sprite(spr_susie_hand_up);
        c_addxy(0, -4);
        c_wait_box(5);
        c_sel(su);
        c_facing("u");
        c_addxy(0, 4);
        c_sel(mi);
        c_sprite(spr_npc_pippins_expressions);
        c_halt();
        c_wait_talk();
        c_var_instance(id, "npc_animate", true);
        c_speaker("no_name");
        c_msgsetloc(0, "* We can keep pretendin's to be Mike as long as we's want!?/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_846_0");
        c_talk_wait();
        c_wait(30);
        c_sel(mi);
        c_sprite(spr_npc_pippins_jump_green);
        c_halt();
        c_imagespeed(0.4);
        c_sel(sh);
        c_sprite(spr_shadowman_sad);
        c_sel(za);
        c_imageindex(6);
        c_speaker("no_name");
        c_msgsetloc(0, "* We never WANTED to be Mike^1, you big bozo!/", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_865_0");
        c_msgnextloc("* Now let's get outta here^1, before something WEIRD happens!/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_866_0");
        c_talk_wait();
    }
    c_sel(mi);
    c_sprite(spr_npc_pippins_jump_green);
    c_halt();
    c_wait(15);
    c_sel(kr);
    c_facing("l");
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(415, kr_actor.y, 12);
    c_delaycmd(13, "imagespeed", 0);
    if (!solo_mode)
    {
        c_sel(su);
        c_facing("l");
        c_autowalk(0);
        c_imagespeed(0.2);
        c_walkdirect(360, su_actor.y, 12);
        c_delaycmd(13, "imagespeed", 0);
        c_sel(ra);
        c_facing("r");
        c_autowalk(0);
        c_imagespeed(0.2);
        c_walkdirect(220, ra_actor.y, 12);
        c_delaycmd(13, "imagespeed", 0);
    }
    c_sel(mi);
    c_imagespeed(0.4);
    c_walkdirect(280, 260, 30);
    c_delaywalkdirect(31, 280, 540, 30);
    c_wait(15);
    c_sel(sh);
    c_sprite(spr_shadowman_idle_a_right);
    c_imagespeed(0.2);
    c_walkdirect(255, sh_actor.y, 30);
    c_delaywalkdirect(31, 255, 580, 30);
    c_wait(15);
    c_sel(za);
    c_sprite(spr_npc_zapper_jump);
    c_imagespeed(0.2);
    c_walkdirect(255, za_actor.y, 30);
    c_delaywalkdirect(31, 255, 580, 30);
    c_wait(90);
    if (!solo_mode)
    {
        c_sel(ra);
        c_facing("r");
        c_sel(su);
        c_facing("l");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EM* I suppose..^1. we also. Don't need to be here./", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_945_0");
        c_facenext("susie", 0);
        c_msgnextloc("\\EP* ..^1. yeah.../%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_947_0");
        c_talk_wait();
        c_sel(su);
        c_autowalk(1);
        c_walkdirect(292, su_actor.y, 12);
        c_delaywalkdirect(13, 292, 510, 40);
        c_wait(15);
        c_sel(ra);
        c_autowalk(1);
        c_walkdirect(298, ra_actor.y, 12);
        c_delaywalkdirect(13, 298, 510, 40);
        c_wait(60);
    }
    c_customfunc(function()
    {
        mike_track[0] = snd_init("tv_infrontof.ogg");
        mike_track[1] = audio_play_sound(mike_track[0], 90, 1, 0);
        audio_sound_pitch(mike_track[1], 0.9);
    });
    c_waitcustom();
}
if (con == 90 && !d_ex() && customcon == 1)
{
    con = 100;
    customcon = 0;
    for (var _i = 1; _i < 4; _i++)
        global.hp[_i] = clamp(global.hp[_i], 1, global.maxhp[_i]);
    global.facing = 0;
    c_waitcustom_end();
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_customfunc(function()
    {
        var board_readable = instance_create(board_marker.x, board_marker.y + 36, obj_readable_room1);
        with (board_readable)
        {
            extflag = "board";
            image_xscale = 8;
            image_yscale = 2;
        }
    });
    c_actortokris();
    c_terminatekillactors();
}
if (con == 100 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.flag[1696] = 1;
    mic_active = true;
    with (obj_mainchara)
        freeze = 0;
}
if (mike_shake)
{
    var _x = mike_base_pos[0];
    var _y = mike_base_pos[1];
    with (mi_actor)
    {
        x = _x + choose(-1, 1);
        y = _y + choose(-1, 1);
    }
}
if (mike_flip)
{
    mike_flip_timer++;
    if (mike_flip_timer == 6)
    {
        snd_stop(snd_wing);
        snd_play(snd_wing);
        with (mi_actor)
            sprite_index = spr_pippins_exasperated_point_left;
    }
    if (mike_flip_timer == 12)
    {
        snd_stop(snd_wing);
        snd_play(snd_wing);
        with (mi_actor)
            sprite_index = spr_pippins_exasperated_point_right;
    }
    if (mike_flip_timer == 18)
        mike_flip_timer = 5;
}
if (npc_animate)
{
    if (i_ex(obj_writer))
    {
        if (obj_writer.halt >= 1)
        {
            with (npc_animate_target)
            {
                image_speed = 0;
                image_index = 0;
            }
            npc_animate = false;
        }
        else
        {
            with (npc_animate_target)
                image_speed = 0.2;
        }
    }
}
if (con == 95 && !d_ex() && global.interact == 0)
{
    con = 100;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (You don't really like looking at this sort of thing.)/%", "obj_room_castle_tv_zone_battle_slash_Step_0_gml_1115_0");
    d_make();
}
