var rmx = 686;
var rmy = 370;
if (con < 0)
    exit;
if (con == 0 && !d_ex())
{
    global.interact = 1;
    con = 5;
    darkness_overlay = instance_find(obj_darkness_overlay, 0);
    with (obj_light_following)
    {
        if (target == 1049)
            other.follow_light = id;
    }
    with (obj_mainchara)
    {
        fun = 1;
        cutscene = 1;
    }
    with (obj_caterpillarchara)
    {
        fun = 1;
        cutscene = 1;
        follow = 0;
    }
    with (obj_border_controller)
        hide_border(0.025);
}
if (con == 3)
{
    con = 4;
    alarm[0] = 30;
    if (follow_light == -4)
    {
        with (obj_light_following)
        {
            if (target == 1049)
                other.follow_light = id;
        }
    }
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            x -= 40;
        else
            x -= 90;
        scr_caterpillar_interpolate_old();
    }
}
if (con == 5)
{
    var finished_moving = 0;
    var move_speed = shortened ? 6 : 4;
    with (obj_mainchara)
    {
        if (x != (1570 + rmx) || y != (1591 + rmy))
        {
            fun = 1;
            image_speed = 0.2;
            scr_obj_movetowards_point(1570 + rmx, 1591 + rmy, move_speed);
        }
        else
        {
            image_speed = 0;
            image_index = 0;
            finished_moving++;
        }
    }
    with (obj_caterpillarchara)
    {
        fun = 1;
        sprite_index = rsprite;
        if (name == "susie")
        {
            if (x != (1522 + rmx) || y != (1575 + rmy))
            {
                image_speed = 0.2;
                scr_obj_movetowards_point(1522 + rmx, 1575 + rmy, move_speed);
            }
            else
            {
                image_speed = 0;
                image_index = 0;
                finished_moving++;
            }
        }
        else if (x != (1486 + rmx) || y != (1580 + rmy))
        {
            image_speed = 0.2;
            scr_obj_movetowards_point(1486 + rmx, 1580 + rmy, move_speed);
        }
        else
        {
            image_speed = 0;
            image_index = 0;
            finished_moving++;
        }
        scr_caterpillar_interpolate_old();
    }
    if (finished_moving >= 3)
        con = 10;
}
if (con == 10)
{
    con = 15;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right);
    c_sel(su);
    c_sprite(spr_susie_surprised_right);
    c_var_instance(blackall, "depth", 89000);
    c_var_instance(blackall, "image_blend", 0);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 15);
    c_var_instance(follow_light, "light_con", 4);
    var wait_time = shortened ? 15 : 30;
    c_wait(wait_time);
    c_waitcustom();
}
if (con == 15 && customcon == 1)
{
    con = 18;
    with (darkness_overlay)
        instance_destroy();
    snd_free_all();
    jackenstein = instance_create(1760 + rmx, 1455 + rmy, obj_npc_jackenstein);
    with (jackenstein)
    {
        scr_depth();
        darkened = true;
    }
}
if (darkencon == 1)
{
    var interval = shortened ? 2 : 1;
    darkentimer += interval;
    with (obj_actor)
        image_alpha = lerp(1, 0, other.darkentimer / 20);
    if (darkentimer == 20)
    {
        darkentimer = 0;
        darkencon = 2;
        kr_actor.visible = false;
        su_actor.sprite_index = spr_susie_eyes_idle;
        su_actor.x -= 50;
        su_actor.y -= 21;
        ra_actor.sprite_index = spr_ralsei_eyes_idle;
        ra_actor.x -= 18;
        ra_actor.y += 6;
    }
}
if (darkencon == 2)
{
    var interval = shortened ? 2 : 1;
    darkentimer += interval;
    with (obj_actor)
        image_alpha = lerp(0, 1, other.darkentimer / 20);
    if (darkentimer == 20)
    {
        darkentimer = 0;
        darkencon = 0;
    }
}
if (con == 18 && customcon == 1)
{
    con = 18.1;
    customcon = 0;
    c_sel(kr);
    c_facing("r");
    c_waitcustom_end();
    c_pannable(1);
    var pan_speed = shortened ? 15 : 30;
    c_pan(1400 + rmx, cameray(), pan_speed);
    var wait_time = shortened ? 20 : 45;
    c_wait(wait_time);
    c_waitcustom();
}
if (con == 18.1 && customcon == 1)
{
    con = 18.2;
    if (global.tempflag[98] == 0)
    {
        scr_speaker("jackenstein");
        msgsetloc(0, "* ..^1. VERY WELL..^1. IF YOU COME CLOASER TO THIS PLACE.../", "obj_ch4_DCA08D_slash_Step_0_gml_233_0");
        msgnextloc("* ..^1. THEN YOU MAY FIND.../", "obj_ch4_DCA08D_slash_Step_0_gml_234_0");
        msgnextloc("* ..^1. THE DARK.../%", "obj_ch4_DCA08D_slash_Step_0_gml_235_0");
        with (instance_create(camerax() + 30, cameray() + 340, obj_writer))
            runcheck = 1;
    }
}
if (con == 18.2 && customcon == 1 && !i_ex(obj_writer))
{
    con = 18.3;
    customcon = 0;
    c_waitcustom_end();
    c_mus2("volume", 0, 30);
    c_var_instance(id, "darkencon", 1);
    c_wait(20);
    c_snd_play(snd_wallclaw);
    c_var_instance(jackenstein, "current_eyes_sprite", 824);
    if (global.tempflag[98] == 0)
    {
        c_var_lerp_instance(jackenstein, "eyes_alpha", 0, 1, 30);
        c_wait(45);
        c_customfunc(function()
        {
            scr_speaker("jackenstein");
            msgsetloc(0, "* ..^1. HAS COME TO YOU!!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_263_0");
            instance_create(camerax() + 30, cameray() + 340, obj_writer);
            global.tempflag[98] = 1;
            scr_set_ini_value(global.chapter, global.filechoice, "Ch4Boss", 1);
        });
    }
    else
    {
        c_var_lerp_instance(jackenstein, "eyes_alpha", 0, 1, 15);
        c_wait(20);
    }
    c_waitcustom();
}
if (con == 18.3 && !i_ex(obj_writer) && customcon == 1)
{
    con = 18.4;
    with (jackenstein)
        visible = 0;
    obj_mainchara.visible = false;
    snd_free_all();
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("pumpkin_boss.ogg");
    encounterflag = 174;
    global.flag[54] = encounterflag;
    marker_jackenstein = instance_create_depth(jackenstein.x, jackenstein.y, jackenstein.depth - 9999, obj_marker);
    marker_jackenstein.sprite_index = spr_jackenstein_battle_eyes;
    marker_jackenstein.image_index = 1;
    marker_jackenstein.image_xscale = 2;
    marker_jackenstein.image_yscale = 2;
    scr_battle(174, 1, marker_jackenstein, 0, 0);
    with (marker_jackenstein)
    {
        sprite_index = spr_jackenstein_battle_eyes;
        image_index = 1;
    }
    marker_susie = instance_create_depth(su_actor.x, su_actor.y, su_actor.depth - 9999, obj_marker);
    marker_susie.sprite_index = spr_susie_eyes_idle;
    marker_susie.image_xscale = 2;
    marker_susie.image_yscale = 2;
    marker_ralsei = instance_create_depth(ra_actor.x, ra_actor.y, ra_actor.depth - 9999, obj_marker);
    marker_ralsei.sprite_index = spr_ralsei_eyes_idle;
    marker_ralsei.image_xscale = 2;
    marker_ralsei.image_yscale = 2;
    with (marker_susie)
        scr_move_to_point_over_time(camerax() + 52, cameray() + 110, 14);
    with (marker_ralsei)
        scr_move_to_point_over_time(camerax() + 80, cameray() + 210, 14);
    with (obj_battleback)
        instance_destroy();
    global.flag[9] = 1;
    with (obj_actor)
        visible = 0;
}
if (con == 18.4 && i_ex(obj_battlecontroller))
{
    darkentimer++;
    if (darkentimer == 26)
    {
        with (marker_susie)
            instance_destroy();
        with (marker_ralsei)
            instance_destroy();
    }
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 200;
        alarm[0] = 30;
        snd_volume(global.batmusic[0], 0, 25);
    }
}
if (con == 201)
{
    con = 19;
    alarm[0] = 30;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    global.charinstance[0].x = 2256;
    global.charinstance[0].y = 1961;
    global.charinstance[1].x = 2208;
    global.charinstance[1].y = 1945;
    global.charinstance[2].x = 2172;
    global.charinstance[2].y = 1950;
    obj_herokris.visible = false;
    obj_mainchara.visible = false;
    obj_mainchara.x = obj_herokris.x;
    obj_mainchara.y = obj_herokris.y;
    kr_actor.x = obj_herokris.x;
    kr_actor.y = obj_herokris.y;
    su_actor.x = obj_herosusie.x;
    su_actor.y = obj_herosusie.y;
    ra_actor.x = obj_heroralsei.x;
    ra_actor.y = obj_heroralsei.y;
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    with (jackenstein)
        visible = 1;
    if (i_ex(obj_monsterparent))
    {
        with (obj_monsterparent)
            instance_destroy();
    }
    if (i_ex(obj_bulletparent))
    {
        with (obj_bulletparent)
            instance_destroy();
    }
    if (i_ex(obj_heroparent))
    {
        with (obj_heroparent)
            instance_destroy();
    }
    if (i_ex(obj_battlecontroller))
        instance_destroy(obj_battlecontroller);
}
if (con == 20 && customcon == 1 && !i_ex(obj_battlecontroller))
{
    customcon = 0;
    con = 21;
    alarm[0] = 30;
    c_waitcustom_end();
    c_var_instance(jackenstein, "is_laughing", false);
    c_sel(kr);
    c_visible(0);
    c_var_instance(jackenstein, "current_state", 2);
    c_wait(21);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* THE LAIGHT..^1. NOT THE LAIGHT!!!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_441_0");
    c_talk_wait();
    c_var_instance(jackenstein, "depth", 5000);
    c_var_instance(jackenstein, "current_state", 5);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* NOOOOOOO!!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_470_0");
    c_talk_wait();
    c_wait_if(jackenstein, "state_loaded", "=", true);
    c_var_instance(jackenstein, "darkened", false);
    c_var_instance(jackenstein, "destroyoverlay", true);
    c_customfunc(function()
    {
        with (obj_border_controller)
        {
            stop_custom_effect();
            show_border();
        }
    });
    c_snd_play(snd_punchheavythunder);
    c_var_instance(blackall, "depth", 100);
    c_var_instance(blackall, "image_blend", 16777215);
    c_var_instance(blackall, "image_alpha", 1);
    c_sel(kr);
    c_visible(1);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_visible(1);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_addxy(-26, 0);
    c_visible(1);
    c_var_instance(jackenstein, "base_alpha", 1);
    c_sel(su);
    c_sel(ra);
    c_sel(su);
    c_wait(30);
    c_var_instance(jackenstein, "current_state", 6);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_var_instance(jackenstein, "current_state", 11);
    c_wait(30);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* N..^1. NO..^1. DOAN'T LOOK..^1. I'M..^1. I'M.../", "obj_ch4_DCA08D_slash_Step_0_gml_520_0");
    c_msgnextloc("* I'M TOO SCAIREY!!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_521_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(jackenstein, "current_state", 6);
    c_wait_talk();
    c_wait(15);
    c_sel(ra);
    c_sel(su);
    c_var_instance(jackenstein, "current_state", 1);
    c_wait_if(jackenstein, "state_loaded", "=", true);
    c_wait(90);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_autowalk(0);
    c_wait(60);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* Are you all right? The chandelier..^1. It.../%", "obj_ch4_DCA08D_slash_Step_0_gml_558_0");
    c_talk_wait();
    c_var_instance(id, "chandelier_sway", true);
    c_pannable(1);
    c_pan(camerax() + 300, cameray(), 48);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect_speed(kr_actor.x + 300, kr_actor.y, 8);
    c_sel(su);
    c_autowalk(1);
    c_facing("susieunhappy");
    c_walkdirect_speed(su_actor.x + 300, su_actor.y, 8);
    c_sel(ra);
    c_addxy(26, 0);
    c_autowalk(1);
    c_facing("ralseiunhappy");
    c_walkdirect_speed_wait(ra_actor.x + 300, ra_actor.y, 8);
    c_wait(45);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* OUCHI..^1. OHHH^1, IT HOARTS..^1. IT HOARTS.../", "obj_ch4_DCA08D_slash_Step_0_gml_583_0");
    c_msgnextloc("* EVERYTHING..^1. SO BRAIGHT..^1. CULDN'T SEE.../", "obj_ch4_DCA08D_slash_Step_0_gml_584_0");
    c_msgnextloc("* HEAD HIT SHANDALIERE.../", "obj_ch4_DCA08D_slash_Step_0_gml_585_0");
    c_facenext("ralsei", 21);
    c_msgnextloc("\\EL* We're sorry^1, we were just looking for a way.../", "obj_ch4_DCA08D_slash_Step_0_gml_587_0");
    c_facenext("jackenstein", 0);
    c_msgnextloc("* OH..^1. MY HEAD..^1. IT HOARTS..^1. IT HOARTS INSIDE/", "obj_ch4_DCA08D_slash_Step_0_gml_589_0");
    c_facenext("ralsei", 19);
    c_msgnextloc("\\EJ* Um^1, don't worry^1! We know how to use healing^1, so.../%", "obj_ch4_DCA08D_slash_Step_0_gml_591_0");
    c_talk();
    c_wait_box(5);
    c_var_instance(jackenstein, "current_state", 6);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_wait_box(6);
    c_sel(ra);
    c_facing("ralseinohat");
    c_facing("r");
    c_wait_talk();
    c_sel(ra);
    c_walkdirect_wait(2020 + rmx, 1580 + rmy, 30);
    c_wait(15);
    c_sel(ra);
    c_autowalk(0);
    c_sound_play(snd_spellcast);
    c_sprite(spr_ralsei_spell);
    c_addxy(-6, -7);
    c_imageindex(0);
    c_imagespeed(0.3);
    c_wait(15);
    c_var_instance(jackenstein, "current_state", 12);
    c_wait(13);
    c_autowalk(1);
    c_facing("r");
    c_addxy(6, 7);
    c_wait(45);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* HMM.../%", "obj_ch4_DCA08D_slash_Step_0_gml_631_0");
    c_talk_wait();
    c_wait(120);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_shocked_right);
    c_addxy(-12, 0);
    c_shake();
    c_snd_play(snd_punchmed);
    c_snd_play(snd_impact);
    c_var_instance(jackenstein, "current_state", 2);
    c_var_instance(jackenstein, "anim_speed", 2);
    c_wait(15);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* OAAAHHHH IT STILL HOARTS!!!!!!!!!/", "obj_ch4_DCA08D_slash_Step_0_gml_655_0");
    c_facenext("ralsei", 12);
    c_msgnextloc("\\EC* H-huh? Sorry^1, I guess I'll^1, um^1, try it again...!/", "obj_ch4_DCA08D_slash_Step_0_gml_657_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* Umm^1, maybe I could.../", "obj_ch4_DCA08D_slash_Step_0_gml_659_0");
    c_facenext("ralsei", "J");
    c_msgnextloc("\\EJ* Susie...?/", "obj_ch4_DCA08D_slash_Step_0_gml_661_0");
    c_facenext("susie", "S");
    c_msgnextloc("\\EW* Umm^1, nothin'. Nevermind./%", "obj_ch4_DCA08D_slash_Step_0_gml_663_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right);
    c_addxy(12, 0);
    c_sel(su);
    c_facing("r");
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_box(6);
    c_sel(ra);
    c_facing("l");
    c_wait_box(8);
    c_sel(su);
    c_sprite(spr_susie_walk_back_arm);
    c_wait_talk();
    c_wait(15);
    c_sel(ra);
    c_delayfacing(10, "r");
    c_sel(su);
    c_flip("x");
    c_imagespeed(0.2);
    c_walkdirect_speed(1500 + rmx, su_actor.y, 6);
    c_wait(50);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_sel(su);
    c_halt();
    c_flip("x");
    c_sprite(spr_susie_look_down_left_dw);
    c_setxy(1240 + rmx, su_actor.y);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_waitcustom();
}
if (con == 22 && customcon == 1 && !d_ex())
{
    scr_flag_set(850, 4);
    con = 40;
    with (obj_mainchara)
        fun = 0;
    ralsei_readable = instance_create(ra_actor.x, ra_actor.y + 40, obj_readable_room1);
    with (ralsei_readable)
    {
        extflag = "jack_heal";
        image_yscale = 4;
    }
    ralsei_block = instance_create(ra_actor.x, ra_actor.y + 40, obj_solidblock);
    with (ralsei_block)
        image_yscale = 4;
    var sus_x = su_actor.x;
    var sus_y = su_actor.y;
    var ral_x = ra_actor.x;
    var ral_y = ra_actor.y;
    ralsei_heal_loop = true;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            follow = 0;
            fun = 1;
            x = sus_x;
            y = sus_y;
            sprite_index = spr_susie_look_down_left_dw;
        }
        else
        {
            visible = 0;
            follow = 0;
            fun = 1;
            x = ral_x;
            y = ral_y;
            sprite_index = rsprite;
        }
    }
    global.interact = 0;
    global.facing = 0;
}
if (con == 40 && !d_ex() && customcon == 1 && global.interact == 0 && obj_mainchara.x < (1730 + rmx))
{
    con = 50;
    global.interact = 1;
    with (su_actor)
        instance_destroy();
    with (ra_actor)
        instance_destroy();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 51;
    customcon = 0;
    ralsei_heal_loop = false;
    gerson_npc = instance_create(860 + rmx, 1587 + rmy, obj_npc_gerson);
    with (gerson_npc)
    {
        extflag = "gerson";
        current_state = 9;
        facing_right = true;
        scr_depth();
    }
    c_waitcustom_end();
    scr_maincharacters_actors();
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_autodepth(0);
    c_depth(gerson_npc.depth - 10);
    c_pannable(1);
    c_pan(935 + rmx, cameray(), 60);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EO* .../", "obj_ch4_DCA08D_slash_Step_0_gml_829_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* How's the adventure^1, hero?/%", "obj_ch4_DCA08D_slash_Step_0_gml_831_0");
    c_talk_wait();
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_emote("!", 30);
    c_wait(30);
    c_pannable(1);
    c_pan(780 + rmx, 1388 + rmy, 30);
    c_wait(30);
    c_mus2("initloop", "gerson_defeated.ogg", 0);
    c_wait(30);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 1000 + rmx, 36);
    c_delaycmd4(37, "var", gerson_npc, "current_state", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* ..^1. Old man?/", "obj_ch4_DCA08D_slash_Step_0_gml_856_0");
    c_msgnextloc("\\ED* Shouldn't you be busy..^1. writing a letter or something?/%", "obj_ch4_DCA08D_slash_Step_0_gml_857_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("u");
    c_wait(37);
    c_wait_talk();
    c_snd_play(snd_gerlaugh);
    c_var_instance(gerson_npc, "current_state", 5);
    c_sel(su);
    c_facing("l");
    c_wait(60);
    c_var_instance(gerson_npc, "current_state", 9);
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 8);
    c_speaker("gerson");
    c_msgsetloc(0, "* ..^1. Shouldn't you be helping that pumpkin fella?/", "obj_ch4_DCA08D_slash_Step_0_gml_880_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* Nah^1, Ralsei's got it covered. I..^1. I quit./%", "obj_ch4_DCA08D_slash_Step_0_gml_882_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(gerson_npc, "current_state", 9);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_talk();
    c_sel(su);
    c_facing("l");
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait(30);
    c_var_instance(gerson_npc, "current_state", 0);
    c_wait(15);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_beard_thinking_neutral);
    c_var_instance(gerson_npc, "anim_speed", 0.1);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_speaker("gerson");
    c_msgsetloc(0, "* Quit? Quit what?/", "obj_ch4_DCA08D_slash_Step_0_gml_914_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* You know. Healing. That green sparkle thing./%", "obj_ch4_DCA08D_slash_Step_0_gml_916_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susiedarkeyes");
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_head_scratch_dw);
    c_addxy(0, -6);
    c_wait_talk();
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 1040 + rmx, 15);
    c_delaycmd4(16, "var", gerson_npc, "current_state", 0);
    c_delaycmd4(17, "var", gerson_npc, "current_sprite_index", 80);
    c_wait(15);
    c_sel(su);
    c_autowalk(1);
    c_facing("susiedarkeyes");
    c_facing("l");
    c_addxy(0, 6);
    c_halt();
    c_speaker("gerson");
    c_msgsetloc(0, "* Hmm. So you don't like doing it?/", "obj_ch4_DCA08D_slash_Step_0_gml_946_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* Well^1, uh..^1. I dunno^1, actually./", "obj_ch4_DCA08D_slash_Step_0_gml_948_0");
    c_msgnextloc("\\EN* At first^1, I was really..^1. I was really excited I could do it./", "obj_ch4_DCA08D_slash_Step_0_gml_949_0");
    c_msgnextloc("\\ED* But like..^1. I sort of realized.../", "obj_ch4_DCA08D_slash_Step_0_gml_950_0");
    c_msgnextloc("\\ET* I just suck at it. Heh./%", "obj_ch4_DCA08D_slash_Step_0_gml_951_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_halt();
    c_autowalk(1);
    c_facing("l");
    c_walk("l", 2, 12);
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_box(5);
    c_var_instance(gerson_npc, "current_state", 9);
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait(60);
    c_var_instance(gerson_npc, "current_state", 0);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_outfit_walk_cane_look_side);
    c_wait(15);
    c_speaker("gerson");
    c_msgsetloc(0, "* What if you practiced? Put a little shell into it./", "obj_ch4_DCA08D_slash_Step_0_gml_989_0");
    c_facenext("susie", 13);
    c_msgnextloc("\\ED* I mean^1, I kind of..^1. When people aren't looking.../", "obj_ch4_DCA08D_slash_Step_0_gml_991_0");
    c_msgnextloc("\\EN* I was kind of trying to practice a little^1, but.../", "obj_ch4_DCA08D_slash_Step_0_gml_992_0");
    c_msgnextloc("\\ED* I sorta realized^1, y'know?/", "obj_ch4_DCA08D_slash_Step_0_gml_993_0");
    c_msgnextloc("\\ET* I'll never be as good as Ralsei^1, so what's the point?/", "obj_ch4_DCA08D_slash_Step_0_gml_994_0");
    c_msgnextloc("\\ER* So everyone can see how..^1. bad I am?/", "obj_ch4_DCA08D_slash_Step_0_gml_995_0");
    c_msgnextloc("\\ED* I should just stick to what I'm good for./", "obj_ch4_DCA08D_slash_Step_0_gml_996_0");
    c_msgnextloc("\\ET* Y'know..^1. uh..^1. hurting people..^1. magic./", "obj_ch4_DCA08D_slash_Step_0_gml_997_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Hm. Is that so./%", "obj_ch4_DCA08D_slash_Step_0_gml_999_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_head_scratch_dw);
    c_addxy(0, -6);
    c_wait_box(4);
    c_sel(su);
    c_halt();
    c_wait_box(5);
    c_sel(su);
    c_autowalk(1);
    c_facing("l");
    c_addxy(0, 6);
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_box(7);
    c_sel(su);
    c_facing("u");
    c_wait_box(8);
    c_sel(su);
    c_facing("l");
    c_wait_box(10);
    c_var_instance(gerson_npc, "current_state", 6);
    c_wait_talk();
    c_wait(15);
    c_var_instance(gerson_npc, "facing_right", false);
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_speaker("gerson");
    c_msgsetloc(0, "* Didn't take you for a purple bellied coward./", "obj_ch4_DCA08D_slash_Step_0_gml_1051_0");
    c_facenext("susie", "Z");
    c_msgnextloc("\\EZ* Coward...? Hey^1, what do you mean by that!?/", "obj_ch4_DCA08D_slash_Step_0_gml_1053_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* You're afraid of making some little green sparkles./%", "obj_ch4_DCA08D_slash_Step_0_gml_1055_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susieunhappy");
    c_walk_wait("l", 4, 16);
    c_wait_box(4);
    c_var_instance(gerson_npc, "current_state", 12);
    c_wait_talk();
    c_sel(su);
    c_walkdirect_wait(905 + rmx, su_actor.y, 25);
    c_sprite(spr_susie_exasperated);
    c_shakeobj();
    c_var_instance(gerson_npc, "current_state", 9);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Look^1, just CASTING it isn't a big deal!/", "obj_ch4_DCA08D_slash_Step_0_gml_1077_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* Alrighty then.../%", "obj_ch4_DCA08D_slash_Step_0_gml_1079_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(gerson_npc, "facing_right", true);
    c_var_instance(gerson_npc, "current_state", 2);
    c_wait_talk();
    c_wait(15);
    c_var_instance(gerson_npc, "current_state", 1);
    c_var_lerp_to_instance(gerson_npc, "x", 1100 + rmx, 20);
    c_delaycmd4(21, "var", gerson_npc, "current_state", 0);
    c_wait(25);
    c_var_instance(gerson_npc, "facing_right", false);
    c_wait(30);
    c_var_instance(gerson_npc, "current_sprite_index", spr_gerson_hand_up);
    c_speaker("gerson");
    c_msgsetloc(0, "* Here./", "obj_ch4_DCA08D_slash_Step_0_gml_1103_0");
    c_facenext("susie", 12);
    c_msgnextloc("\\EC* What?/", "obj_ch4_DCA08D_slash_Step_0_gml_1105_0");
    c_facenext("gerson", 0);
    c_msgnextloc("* I pricked my finger with my pen earlier./", "obj_ch4_DCA08D_slash_Step_0_gml_1107_0");
    c_msgnextloc("* If yer not a coward^1, give me your best shot!/", "obj_ch4_DCA08D_slash_Step_0_gml_1108_0");
    c_facenext("susie", 5);
    c_msgnextloc("\\E5* Fine^1, if it gets you to shut up!/", "obj_ch4_DCA08D_slash_Step_0_gml_1110_0");
    c_msgnextloc("\\EH* Take this!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_1111_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_wait_box(5);
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back);
    c_halt();
    c_wait_box(7);
    c_sel(su);
    c_sound_play(snd_noise);
    c_sprite(spr_susie_exasperated);
    c_shakeobj();
    c_wait_talk();
    c_mus2("volume", 0, 30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_heal_charge);
    c_addxy(-44, -24);
    c_halt();
    c_animate(0, 9, 0.2);
    c_wait_if(su_actor, "image_index", ">=", 9);
    c_sprite(spr_susie_heal_loop);
    c_imagespeed(0.2);
    c_wait(18);
    c_var_instance(gerson_npc, "current_state", 13);
    c_wait(6);
    c_var_instance(gerson_npc, "paper_con", 1);
    c_var_instance(id, "gerson_oops", true);
    c_wait(4);
    c_snd_play(snd_spellcast);
    c_var_instance(id, "heal_blast", true);
    c_wait(15);
    c_pan(1680 + rmx, 1388 + rmy, 20);
    c_sel(kr);
    c_setxy(1730 + rmx, 1592 + rmy);
    c_autowalk(1);
    c_facing("r");
    c_wait(50);
    c_var_instance(gerson_npc, "current_state", 9);
    c_var_instance(jackenstein, "current_state", 7);
    c_wait(10);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_shakeobj();
    c_wait(100);
    c_var_instance(jackenstein, "current_state", 13);
    c_wait(15);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* OH!!!^1! THE OUCHI..^1. THE HOART..^1. IT'S GONE!!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_1187_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(1);
    c_facing("r");
    c_setxy(1620 + rmx, 1576 + rmy);
    c_autowalk(1);
    c_walkdirect(1785 + rmx, 1576 + rmy, 30);
    c_wait(20);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* ..^1. Susie?/%", "obj_ch4_DCA08D_slash_Step_0_gml_1203_0");
    c_talk();
    c_wait(15);
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_smile_up);
    c_jump_in_place(10, 5);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EP* Susie^1, that was a great idea!/", "obj_ch4_DCA08D_slash_Step_0_gml_1219_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* H-huh?/", "obj_ch4_DCA08D_slash_Step_0_gml_1221_0");
    c_facenext("ralsei", 26);
    c_msgnextloc("\\EQ* I was wondering why my healing wasn't working.../", "obj_ch4_DCA08D_slash_Step_0_gml_1223_0");
    c_msgnextloc("\\EK* I suppose..^1. I was only healing the outside./", "obj_ch4_DCA08D_slash_Step_0_gml_1224_0");
    c_msgnextloc("\\EJ* But Susie^1, your healing blast seemed to hit the spot!/", "obj_ch4_DCA08D_slash_Step_0_gml_1225_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* Huh?/", "obj_ch4_DCA08D_slash_Step_0_gml_1227_0");
    c_msgnextloc("\\EK* Well^1, heh^1, I was uh^1, actually just trying to heal that old man.../%", "obj_ch4_DCA08D_slash_Step_0_gml_1228_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susiedarkeyes");
    c_facing("r");
    c_sel(ra);
    c_facing("l");
    c_wait_box(4);
    c_sel(ra);
    c_facing("r");
    c_wait_box(5);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_wait_box(6);
    c_sel(ra);
    c_walk_wait("l", 2, 6);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_wait_box(8);
    c_sel(su);
    c_sprite(spr_susie_sheeh);
    c_addxy(0, 5);
    c_wait_box(9);
    c_sel(su);
    c_facing("r");
    c_addxy(0, -5);
    c_wait_talk();
    c_var_instance(gerson_npc, "visible", 0);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_unhappy);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* ..^1. Old..^1. man?/%", "obj_ch4_DCA08D_slash_Step_0_gml_1283_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_facing("l");
    c_sel(kr);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Yeah^1, he's.../%", "obj_ch4_DCA08D_slash_Step_0_gml_1295_0");
    c_talk_wait();
    c_pan(1466, cameray(), 90);
    c_wait(150);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_pan(2386, cameray(), 90);
    c_wait(120);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* ..^1./%", "obj_ch4_DCA08D_slash_Step_0_gml_1312_0");
    c_talk_wait();
    c_wait(60);
    c_sel(su);
    c_facing("susiedarkeyes");
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Huh. Guess he left. Heh./%", "obj_ch4_DCA08D_slash_Step_0_gml_1322_0");
    c_talk_wait();
    c_wait(30);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_walkdirect_wait(1860 + rmx, 1579 + rmy, 20);
    c_facing("l");
    c_wait(15);
    c_var_instance(id, "adjust_caterpillar", true);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EH* Well^1, Mr. Jack is better^1, so let's be on our way!/%", "obj_ch4_DCA08D_slash_Step_0_gml_1344_0");
    c_talk_wait();
    c_mus("free_all");
    c_mus2("initloop", "church_dark_study.ogg", 0);
    c_mus2("volume", 1, 30);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 51 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.interact = 0;
    global.facing = 0;
    with (ralsei_readable)
        instance_destroy();
    with (ralsei_block)
        instance_destroy();
    with (gerson_npc)
        setxy(room_width, room_height);
    scr_flag_set(850, 5);
    with (obj_dw_church_dark_maze_controller)
        instance_destroy();
}
if (adjust_caterpillar)
{
    adjust_caterpillar = false;
    with (obj_caterpillarchara)
    {
        fun = 0;
        follow = 1;
        scr_caterpillar_interpolate();
    }
}
if (con == 80 && !d_ex())
{
    con = 81;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_var_instance(jackenstein, "current_state", 13);
    c_sel(kr);
    c_walkdirect(2036 + rmx, 1590 + rmy, 10);
    c_delayfacing(11, "r");
    c_sel(su);
    c_walkdirect(1993 + rmx, 1562 + rmy, 10);
    c_delayfacing(11, "r");
    c_sel(ra);
    c_walkdirect_wait(1958 + rmx, 1579 + rmy, 10);
    c_facing("r");
    c_speaker("jackenstein");
    c_msgsetloc(0, "* YOU..^1. GIRL..^1. YOU HELPED ME.../", "obj_ch4_DCA08D_slash_Step_0_gml_1414_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* Hey^1, it was^1, uh.../%", "obj_ch4_DCA08D_slash_Step_0_gml_1416_0");
    c_talk_wait();
    c_var_instance(jackenstein, "current_state", 9);
    c_wait(31);
    c_sound_play(snd_grab);
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* YOU THREE..^1. MY FRAINDS!!!/%", "obj_ch4_DCA08D_slash_Step_0_gml_1432_0");
    c_talk_wait();
    c_wait(15);
    c_var_instance(jackenstein, "current_state", 10);
    c_sound_play(snd_bump);
    c_wait(7);
    c_sel(kr);
    c_visible(1);
    c_sel(su);
    c_visible(1);
    c_sel(ra);
    c_visible(1);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* ME NAME IS JACKENSTEIN./", "obj_ch4_DCA08D_slash_Step_0_gml_1451_0");
    c_msgnextloc("* I WAS BULLYED^1, AND HAITED BY THE OTHERS^1, FROAM MY LARGE AND UGLY BODDY./", "obj_ch4_DCA08D_slash_Step_0_gml_1452_0");
    c_msgnextloc("* I WAS BANNISHED TO THE DARK ZONE^1, ONLY TO APPEAR ON FESTIVAL NAIGHT.../", "obj_ch4_DCA08D_slash_Step_0_gml_1453_0");
    c_msgnextloc("* I WAIR THIS MASK^1, BEACAUSE MY TRUE FAICE^1, SCAIRES EVEN MYSELF./%", "obj_ch4_DCA08D_slash_Step_0_gml_1454_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(jackenstein, "current_state", 6);
    c_wait_box(3);
    c_var_instance(jackenstein, "current_state", 2);
    c_wait_talk();
    c_wait(30);
    c_var_instance(jackenstein, "current_state", 13);
    c_wait(30);
    c_msc(1387);
    c_talk_wait();
    c_waitcustom();
}
if (con == 90 && customcon == 1 && !d_ex())
{
    con = 91;
    global.flag[23] = 1;
    customcon = 0;
    c_waitcustom_end();
    if (scr_keyitemcheck(31) == 0)
        scr_keyitemget(31);
    if (global.choice == 0)
    {
        scr_flag_set(849, 1);
        c_speaker("jackenstein");
        c_msgsetloc(0, "* COVER YOUR EAYES.../%", "obj_ch4_DCA08D_slash_Step_0_gml_1502_0");
        c_talk_wait();
        c_wait(10);
        c_sel(su);
        c_sprite(spr_susie_surprised_step_back);
        c_halt();
        c_var_instance(jackenstein, "current_state", 3);
        c_wait_if(jackenstein, "state_loaded", "=", true);
        c_wait(60);
        c_sel(ra);
        c_sprite(spr_ralsei_smile_up);
        c_flip("x");
        c_sel(su);
        c_facing("r");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EK* Umm^1, actually^1, it's kind of cu--%%", "obj_ch4_DCA08D_slash_Step_0_gml_1525_0");
        c_talk_wait();
        c_sel(ra);
        c_sprite(spr_ralsei_shocked_right);
        c_flip("x");
        c_shakeobj();
        c_sel(su);
        c_sprite(spr_susie_sheeh);
        c_shakeobj();
        c_var_instance(jackenstein, "current_state", 4);
        c_speaker("jackenstein_cute");
        c_msgsetloc(0, "* ACTUALLY IT'S TOO SCAIRY/%", "obj_ch4_DCA08D_slash_Step_0_gml_1540_0");
        c_talk_wait();
        c_sel(ra);
        c_facing("r");
        c_sel(su);
        c_facing("r");
        c_wait(5);
        c_var_instance(jackenstein, "current_state", 13);
    }
    if (global.choice == 1)
    {
        c_var_instance(jackenstein, "current_state", 13);
        c_speaker("jackenstein");
        c_msgsetloc(0, "* YES. ME NEATHER./%", "obj_ch4_DCA08D_slash_Step_0_gml_1561_0");
        c_talk_wait();
    }
    c_wait(30);
    c_speaker("jackenstein");
    c_msgsetloc(0, "* THE POINT IS..^1. YOU THREE..^1. ARE MORE DIFFERENT^1, THEN THE OTHERS./", "obj_ch4_DCA08D_slash_Step_0_gml_1568_0");
    c_msgnextloc("* YOU ARE KAIND. MERSIFULL. AND^1, MOAST OF ALL.../", "obj_ch4_DCA08D_slash_Step_0_gml_1569_0");
    c_msgnextloc("* YOU DOAN'T KNOW HOW TO CLAIMB./", "obj_ch4_DCA08D_slash_Step_0_gml_1570_0");
    c_msgnextloc("* TAKE THIS..^1. MY FRAINDS..^1. MY CLAIMBING SET./", "obj_ch4_DCA08D_slash_Step_0_gml_1571_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* (You got the ClaimbClaws.)/", "obj_ch4_DCA08D_slash_Step_0_gml_1573_0");
    c_facenext("jackenstein", 0);
    c_msgnextloc("* IT'S TOO SMALL FOR ME/%", "obj_ch4_DCA08D_slash_Step_0_gml_1575_0");
    c_talk();
    c_wait_box(4);
    c_sound_play(snd_item);
    c_wait_talk();
    c_pannable(1);
    c_panobj(kr_actor, 10);
    c_wait(11);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 91 && !i_ex(obj_cutscene_master))
{
    con = 70;
    global.interact = 0;
    global.facing = 0;
}
if (con == 70)
{
    var trig = 0;
    if (!d_ex() && global.interact == 0)
    {
        with (obj_trigger)
        {
            if (extflag == "susieaid")
            {
                if (place_meeting(x, y, obj_mainchara))
                    trig = 1;
            }
        }
    }
    if (trig == 1)
        con = 70.1;
}
if (con == 70.1)
{
    global.interact = 1;
    con = 71;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_msgruncheck(true);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* (Hey^1, uh^1, Kris?)/", "obj_ch4_DCA08D_slash_Step_0_gml_1631_0");
    c_msgnextloc("\\EN* (..^1. can't guarantee it will be any good^1, but^1, uh...)/", "obj_ch4_DCA08D_slash_Step_0_gml_1632_0");
    c_msgnextloc("\\E2* (Y'know^1, feel free to ask me to heal again. If you need it.)/%", "obj_ch4_DCA08D_slash_Step_0_gml_1633_0");
    c_talk_wait();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 71 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(850, 6);
    global.tempflag[98] = 0;
    scr_tempsave();
}
if (ralsei_heal_loop)
{
    ralsei_heal_timer++;
    if (ralsei_heal_timer == 1)
    {
        snd_play(snd_spellcast);
        ra_actor.auto_walk = 0;
        ra_actor.sprite_index = spr_ralsei_spell;
        ra_actor.x -= 6;
        ra_actor.y -= 7;
        ra_actor.image_speed = 0.3;
        ra_actor.image_index = 0;
    }
    if (ralsei_heal_timer == 15)
    {
        with (jackenstein)
            current_state = 8;
    }
    if (ralsei_heal_timer == 38)
    {
        ra_actor.sprite_index = spr_ralsei_walk_right;
        ra_actor.x += 6;
        ra_actor.y += 7;
        ra_actor.image_speed = 0;
        ra_actor.image_index = 0;
    }
    if (ralsei_heal_timer == 120)
    {
        ralsei_heal_timer = 0;
        with (jackenstein)
            current_state = 2;
    }
}
if (ralsei_heal)
{
    if (ralsei_heal_con == 0 && global.interact == 0)
    {
        ralsei_heal_con = 1;
        global.interact = 1;
    }
    if (ralsei_heal_con < 1)
        exit;
    if (ralsei_heal_con == 1)
    {
        ralsei_heal_con = 2;
        scr_speaker("ralsei");
        msgsetloc(0, "\\EQ* How's this? Feel better?/", "obj_ch4_DCA08D_slash_Step_0_gml_1714_0");
        scr_anyface_next("jackenstein", 0);
        msgnextloc("* NO..^1. STILL HOARTS.../%", "obj_ch4_DCA08D_slash_Step_0_gml_1716_0");
        d_make();
    }
    if (ralsei_heal_con == 2 && !d_ex())
    {
        ralsei_heal_con = 4;
        global.interact = 0;
        ralsei_heal_con = 0;
        ralsei_heal = false;
    }
}
if (heal_blast)
{
    heal_blast_timer++;
    if (heal_marker == -4)
    {
        heal_marker = scr_dark_marker(su_actor.x + 100, su_actor.y + 65, spr_heal_beam_small);
        with (heal_marker)
        {
            depth = 3000;
            image_speed = 0.2;
        }
    }
    if (heal_marker.x != (jackenstein.x + 130) || heal_marker.y != (jackenstein.y + 35))
    {
        var target_x = jackenstein.x + 130;
        var target_y = jackenstein.y + 35;
        with (heal_marker)
            scr_obj_movetowards_point(target_x, target_y, 16);
    }
    else
    {
        heal_blast = false;
        with (heal_marker)
            visible = 0;
    }
}
if (gerson_oops)
{
    if (gerson_oops_con == 0)
    {
        gerson_oops_con = 2;
        scr_speaker("gerson");
        msgsetloc(0, "* Oop^1, my letter!%%", "obj_ch4_DCA08D_slash_Step_0_gml_1777_0");
        var d = d_make();
        d.skippable = 0;
        d.zurasu = 1;
        with (obj_writer)
            skippable = 0;
    }
    if (gerson_oops_con == 2 && !d_ex())
    {
        gerson_oops = false;
        gerson_oops_con = 99;
    }
}
if (chandelier_sway)
{
    chandelier_sway_timer += 0.4;
    var target_angle = clamp(70 - chandelier_sway_timer, 0, 70);
    chandelier.image_angle = target_angle * sin(chandelier_sway_timer / 2);
    if (chandelier_sway_timer >= 120)
    {
        chandelier_sway_timer = 0;
        chandelier_sway = false;
    }
}
