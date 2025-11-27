if (i_ex(cliptrig))
{
    if (cliptrig.myinteract == 3)
    {
        global.flag[1163] = 1;
        global.interact = 1;
        cliptrig.myinteract = 4;
        cliptrig.talked = true;
        var allgot = gotemall();
        var lost = lostem();
        var textstring = 0;
        if (allgot)
            textstring = 1;
        if (lost)
            textstring = 2;
        scr_speaker("no_name");
        msgsetloc(0, "* It's a list of Tenna's remaining employees./", "obj_room_green_room_slash_Step_0_gml_20_0");
        if (textstring == 0)
            msgnextloc("* Looks like you haven't recruited all of them yet./%", "obj_room_green_room_slash_Step_0_gml_27_0");
        if (textstring == 1)
            msgnextloc("* Looks like you've recruited everyone./%", "obj_room_green_room_slash_Step_0_gml_23_0");
        if (textstring == 2)
        {
            msgnextloc("* (Looks like some people resigned due to getting hurt on the job.)/", "obj_room_green_room_slash_Step_0_gml_48_0");
            msgnextloc("* (Seems you'll never recruit everyone.)/%", "obj_room_green_room_slash_Step_0_gml_49_0");
        }
        d_make();
    }
    if (cliptrig.myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        cliptrig.myinteract = 0;
    }
}
if (hide_caterpillar)
{
    hide_caterpillar = false;
    with (obj_caterpillarchara)
    {
        follow = 0;
        visible = 0;
        fun = 1;
    }
}
if (con < 0)
    exit;
if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (scr_flag_get(1031) == 0)
    {
        scr_flag_set(1031, 1);
        c_sel(kr);
        c_walkdirect(1022, 100, 10);
        c_delayfacing(11, "d");
        var su_max_speed = 10;
        var ra_max_speed = 10;
        with (su_actor)
        {
            var su_distance = distance_to_point(1060, 116);
            su_max_speed = clamp(su_distance / 8, 10, 30);
        }
        with (ra_actor)
        {
            var ra_distance = distance_to_point(986, 121);
            ra_max_speed = clamp(ra_distance / 8, 10, 30);
        }
        c_sel(su);
        c_walkdirect(1060, 116, su_max_speed);
        c_delayfacing(su_max_speed + 2, "u");
        c_sel(ra);
        c_walkdirect_wait(986, 121, ra_max_speed);
        c_facing("u");
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* Uhh^1, that's like a bathroom^1, right?/", "obj_room_green_room_slash_Step_0_gml_76_0");
        c_facenext("ralsei", 26);
        c_msgnextloc("\\EQ* We'll just^1, um^1, go play games./%", "obj_room_green_room_slash_Step_0_gml_78_0");
        c_talk_wait();
        c_wait(15);
        c_sel(kr);
        c_facing("u");
        c_walkdirect(1020, 84, 30);
    }
    else
    {
        c_sel(kr);
        c_walkdirect(1022, 100, 10);
        if (i_ex(obj_caterpillarchara))
        {
            var su_max_speed = 10;
            var ra_max_speed = 10;
            with (su_actor)
            {
                var su_distance = distance_to_point(1060, 116);
                su_max_speed = clamp(su_distance / 8, 10, 30);
            }
            with (ra_actor)
            {
                var ra_distance = distance_to_point(986, 121);
                ra_max_speed = clamp(ra_distance / 8, 10, 30);
            }
            c_sel(su);
            c_walkdirect(1060, 116, su_max_speed);
            c_delayfacing(su_max_speed + 2, "u");
            c_sel(ra);
            c_walkdirect_wait(986, 121, ra_max_speed);
            c_facing("u");
            c_wait(5);
        }
        c_sel(kr);
        c_facing("u");
        c_walkdirect(1020, 84, 30);
    }
    c_waitcustom();
}
if (con == 1 && customcon == 1)
{
    con = 2;
    alarm[0] = 30;
    var fadeout = instance_create(0, 0, obj_fadeout);
    fadeout.fadespeed = 0.06;
    with (door_closed)
        image_index = 1;
    snd_play(snd_dooropen);
}
if (con == 3 && customcon == 1)
{
    instance_create(0, 0, obj_persistentfadein);
    snd_play(snd_doorclose);
    con = 99;
    customcon = 0;
    global.interact = 3;
    global.entrance = 1;
    scr_losechar();
    room_goto(room_dw_inbetween);
}
if (con == 10 && !d_ex())
{
    con = 99;
    global.interact = 0;
    room_goto(room_ch3_gameshowroom);
}
if (con == 40 && !d_ex())
{
    con = 41;
    alarm[0] = 30;
    global.interact = 1;
    blackall.visible = 1;
    scr_lerp_var_instance(blackall, "image_alpha", 0, 1, 30);
}
if (con == 42)
{
    con = -1;
    global.interact = 3;
    instance_create(0, 0, obj_persistentfadein);
    snd_free_all();
    room_goto(room_board_3b);
}
if (con == 50)
{
    con = 51;
    alarm[0] = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    tenna_marker = scr_dark_marker(1256, 60, spr_tenna_dance_cabbage_small);
    with (tenna_marker)
    {
        image_speed = 1;
        scr_depth();
    }
    global.facing = 0;
    c_sel(kr);
    c_facing("r");
    c_setxy(350, 133);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_setxy(296, 118);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_setxy(230, 120);
    c_var_instance(id, "border_switch", true);
    c_wait(1);
    c_var_instance(blackall, "visible", 0);
    c_var_instance(word_marker, "visible", 0);
    c_wait(30);
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* This place is.../%", "obj_room_green_room_slash_Step_0_gml_480_0");
    c_talk_wait();
    c_sound_play(snd_wing);
    c_var_lerp_to_instance(tenna_marker, "x", 470, 10, 3, "out");
    c_wait(15);
    var y_offset = (global.lang == "ja") ? -20 : -14;
    scr_funnytext_init(0, 0, y_offset, scr_84_get_sprite("spr_funnytext_green_room"), 0, 0);
    scr_funnytext_init(1, 0, -20, scr_84_get_sprite("spr_funnytext_relax"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* How do you like my&\\O0^1?/", "obj_room_green_room_slash_Step_0_gml_493_0");
    c_msgnextloc("* It'll take some time before round 2^1, so \\O1 ^1!/%", "obj_room_green_room_slash_Step_0_gml_494_0");
    c_talk_wait();
    c_var_lerp_to_instance(tenna_marker, "x", 900, 30, 3, "out");
    c_sound_play(snd_wing);
    c_wait(30);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 52 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    global.plot = 121;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("greenroom_detune.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    with (tenna_marker)
        instance_destroy();
    scr_tempsave();
}
if (con == 55)
{
    con = 56;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 57)
{
    con = 58;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_facing("r");
    c_setxy(360, 134);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_setxy(296, 118);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_setxy(230, 122);
    c_var_instance(id, "border_switch", true);
    c_wait(2);
    c_var_instance(blackall, "visible", 0);
    c_wait(60);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_wait(15);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* I suppose..^1. we should get ready for the next round./%", "obj_room_green_room_slash_Step_0_gml_579_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* ..^1. I'm fine as long as you want to keep playing^1, Susie!/%", "obj_room_green_room_slash_Step_0_gml_588_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_look_down_right);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* .../%", "obj_room_green_room_slash_Step_0_gml_598_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EN* I mean^1, the last game was wicked fun^1, but.../", "obj_room_green_room_slash_Step_0_gml_608_0");
    c_msgnextloc("\\ED* Get the feeling this'll keep going^1, until it gets old./", "obj_room_green_room_slash_Step_0_gml_609_0");
    c_msgnextloc("\\ER* ..^1. feels bad^1, but.../", "obj_room_green_room_slash_Step_0_gml_610_0");
    c_msgnextloc("\\EN* Let's go tell him this time's gonna be the last^1, okay^1, Kris?/%", "obj_room_green_room_slash_Step_0_gml_611_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_look_down_right);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_talk();
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 58 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 160;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("greenroom_detune.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    con = -1;
    scr_tempsave();
}
if (con == 60)
{
    con = 61;
    alarm[0] = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_walkdirect(204, 138, 14);
    c_sel(su);
    c_walkdirect(170, 98, 12);
    c_sel(ra);
    c_walkdirect_wait(242, 102, 16);
    c_sel(kr);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_wait(5);
    c_script_instance(lancer_npc, scr_jump_in_place, 0, 15, 10);
    c_speaker("lancer");
    c_msgsetloc(0, "\\E1* Susie^1! Other people^1! You looked so cool gaming!/", "obj_room_green_room_slash_Step_0_gml_567_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* Lancer^1! You're here for real?^1! Uh..^1. not real?/", "obj_room_green_room_slash_Step_0_gml_569_0");
    c_msgnextloc("\\ED* ..^1. Hey^1, wait^1, if you're in this Dark World^1, aren't you gonna.../", "obj_room_green_room_slash_Step_0_gml_570_0");
    c_facenext("lancer", 1);
    c_msgnextloc("\\E1* Don't worry^1, I've still got some time before I petrify!/", "obj_room_green_room_slash_Step_0_gml_572_0");
    c_msgnextloc("\\E2* Meanwhile^1, I got a job at the gaming factory./", "obj_room_green_room_slash_Step_0_gml_694_0");
    c_msgnextloc("\\E3* I got my own gamepad and I've only broken it 4 times!/", "obj_room_green_room_slash_Step_0_gml_695_0");
    c_msgnextloc("\\E1* Now^1, I gotta go press buttons for pennies.../", "obj_room_green_room_slash_Step_0_gml_696_0");
    c_msgnextloc("\\E8* See you in the funny stages!/%", "obj_room_green_room_slash_Step_0_gml_697_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_down_dw_unhappy);
    c_wait_box(5);
    c_sel(su);
    c_facing("l");
    c_script_instance(lancer_npc, scr_jump_in_place, 0, 15, 10);
    c_wait_box(6);
    c_var_instance(lancer_npc, "sprite_index", spr_lancer_dt);
    c_wait(3);
    c_var_instance(lancer_npc, "sprite_index", spr_lancer_lt);
    c_wait(3);
    c_var_instance(lancer_npc, "sprite_index", spr_lancer_ut);
    c_wait(3);
    c_var_instance(lancer_npc, "sprite_index", spr_lancer_rt);
    c_wait_talk();
    c_sound_play(snd_reverse_splat);
    c_var_lerp_to_instance(lancer_npc, "x", 0, 60, 3, "out");
    c_wait(60);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 62 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(1068, 1);
    var door_a = instance_create(34, 105, obj_doorAny);
    with (door_a)
    {
        image_xscale = 2;
        image_yscale = 2;
        doorRoom = room_dw_b3bs_interstitial;
        doorEntrance = "B";
        doorPreset = 1;
    }
    var door_b = instance_create(26, 184, obj_doorAny);
    with (door_b)
    {
        image_xscale = 1.5;
        image_yscale = 0.6;
        doorRoom = room_dw_b3bs_interstitial;
        doorEntrance = "B";
        doorPreset = 1;
    }
    with (lancer_npc)
        instance_destroy();
}
if (con == 70 && !d_ex())
{
    con = 71;
    global.interact = 1;
    zapper_marker = scr_dark_marker(zapper_npc.x, zapper_npc.y, spr_npc_zapper_talk);
    zapper_marker.depth = 97900;
    zapper_marker.image_speed = 0.2;
    with (zapper_npc)
        visible = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* No one gets inside. Mr. Tenna's orders./%", "obj_room_green_room_slash_Step_0_gml_639_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 71)
{
    var stop_anim = false;
    with (obj_writer)
    {
        if (halt > 0)
            stop_anim = true;
    }
    if (stop_anim)
    {
        with (zapper_marker)
        {
            image_speed = 0;
            image_index = 0;
        }
    }
    if (!d_ex())
    {
        con = -1;
        global.msc = 1319;
        scr_text(global.msc);
        var d = d_make();
        d.stay = 10;
    }
}
if (con == 80 && !d_ex())
{
    con = 90;
    with (zapper_marker)
        image_speed = 0.2;
    scr_speaker("no_name");
    msgsetloc(0, "* Mr. Tenna said if anyone wants to fight^1, don't fight 'em./", "obj_room_green_room_slash_Step_0_gml_685_0");
    msgnextloc("* You an' me are pals..^1. got it? Now smile./%", "obj_room_green_room_slash_Step_0_gml_686_0");
    var d = d_make();
}
if (con == 82 && !d_ex())
{
    if (scr_flag_get(1113) == 0)
    {
        con = 83;
        global.writersnd[0] = snd_random_bongo;
        scr_speaker("no_name");
        msgsetloc(0, "* (You played his chest like the bongos.)\\S0/%", "obj_room_green_room_slash_Step_0_gml_700_0");
        d_make();
    }
    else
    {
        con = 86;
        with (zapper_marker)
            image_speed = 0.2;
        scr_speaker("no_name");
        msgsetloc(0, "* Alright^1, alright^1, I give^1, I give^1! I'm ticklish!/", "obj_room_green_room_slash_Step_0_gml_715_0");
        msgnextloc("* Just be outta there quick^1, got it?/%", "obj_room_green_room_slash_Step_0_gml_716_0");
        d_make();
    }
}
if (con == 83 && !d_ex())
{
    if (audio_is_playing(snd_random_bongo))
        exit;
    con = 84;
    with (zapper_marker)
    {
        sprite_index = spr_zapper_hurt;
        y += 8;
        scr_shakeobj();
    }
    scr_speaker("no_name");
    msgsetloc(0, "* HEY^1, HANDS OFF THE MOICHANDISE!!/%", "obj_room_green_room_slash_Step_0_gml_736_0");
    d_make();
}
if (con == 84 && !d_ex())
{
    con = 85;
    with (zapper_marker)
    {
        sprite_index = spr_zapper_spare;
        image_speed = 2;
        y += 12;
    }
    snd_play(snd_sneeze);
    scr_speaker("no_name");
    msgsetloc(0, "* A---choo!!!/%", "obj_room_green_room_slash_Step_0_gml_755_0");
    d_make();
}
if (con == 85 && !d_ex())
{
    con = -1;
    with (zapper_npc)
        instance_destroy();
    if (scr_flag_get(1113) == 0)
        scr_flag_set(1113, 1);
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = 168;
}
if (con == 86)
{
    var stop_anim = false;
    with (obj_writer)
    {
        if (halt > 0)
            stop_anim = true;
    }
    if (stop_anim)
    {
        with (zapper_marker)
        {
            image_speed = 0;
            image_index = 0;
        }
    }
    else
    {
        with (zapper_marker)
            image_speed = 0.2;
    }
    if (!d_ex())
    {
        con = 87;
        alarm[0] = 31;
        with (zapper_marker)
        {
            image_speed = 0;
            scr_lerpvar("x", x, camerax() - 100, 30, 2, "in");
        }
    }
}
if (con == 88)
{
    con = -1;
    scr_flag_set(1113, 2);
    global.interact = 0;
    global.facing = 0;
    with (zapper_npc)
        instance_destroy();
    with (zapper_marker)
        instance_destroy();
}
if (con == 90)
{
    var stop_anim = false;
    with (obj_writer)
    {
        if (halt > 0)
            stop_anim = true;
    }
    if (stop_anim)
    {
        with (zapper_marker)
        {
            image_speed = 0;
            image_index = 0;
        }
    }
    else
    {
        with (zapper_marker)
            image_speed = 0.2;
    }
    if (!d_ex())
        con = 100;
}
if (con == 100 && !d_ex())
{
    con = -1;
    global.interact = 0;
    with (zapper_npc)
        visible = 1;
    with (zapper_marker)
        instance_destroy();
}
if (con == 110 && !d_ex())
{
    con = 111;
    scr_speaker("no_name");
    msgsetloc(0, "* What da...? You're bein' awfully suspicious./", "obj_room_green_room_slash_Step_0_gml_873_0");
    msgnextloc("* Better teach ya a lesson.../%", "obj_room_green_room_slash_Step_0_gml_874_0");
    d_make();
}
if (con == 111)
{
    var stop_anim = false;
    with (obj_writer)
    {
        if (halt > 0)
            stop_anim = true;
    }
    if (stop_anim)
    {
        with (zapper_marker)
        {
            image_speed = 0;
            image_index = 0;
        }
    }
    else
    {
        with (zapper_marker)
            image_speed = 0.2;
    }
    if (!d_ex())
        con = 112;
}
if (con == 112 && !d_ex())
{
    con = 118;
    encounterno = 138;
    encounterflag = 589;
    global.flag[54] = encounterflag;
    with (zapper_marker)
    {
        x -= 6;
        y += 14;
        image_speed = 0;
        image_index = 8;
        scr_delay_var("image_index", 0, 20);
        depth = 8000;
        sprite_index = spr_zapper_jump;
    }
    scr_battle(encounterno, 0, zapper_marker, 0, 0);
}
if (con == 118 && !i_ex(obj_battlecontroller))
{
    con = -1;
    scr_flag_set(1114, 1);
    with (zapper_npc)
        instance_destroy();
}
if (con == 120)
{
    con = 121;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_setxy(1022, 110);
    c_facing("d");
    c_sel(su);
    c_setxy(1060, 126);
    c_facing("u");
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_up);
    c_setxy(986, 131);
    c_pannable(1);
    c_pan(721, cameray(), 1);
    c_wait(15);
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* Umm^1, welcome back^1, Kris!/%", "obj_room_green_room_slash_Step_0_gml_1137_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_imagespeed(0.2);
    c_addxy(-2, -4);
    c_msc(1331);
    c_talk_wait();
    c_waitcustom();
}
if (con == 125 && !d_ex() && customcon == 1)
{
    con = 126;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_halt();
    if (global.choice == 0)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* Really? Hey^1, maybe we should play too^1, next time./", "obj_room_green_room_slash_Step_0_gml_1165_0");
        c_facenext("ralsei", "Q");
        c_msgnextloc("\\EQ* Th-that's okay^1, I'm not..^1. really good at games./%", "obj_room_green_room_slash_Step_0_gml_1167_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* Uh^1, okay./%", "obj_room_green_room_slash_Step_0_gml_1172_0");
        c_talk_wait();
    }
    c_sel(su);
    c_facing("u");
    c_addxy(2, 4);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Anyway^1, let's hurry up and get the hell out of here./%", "obj_room_green_room_slash_Step_0_gml_1182_0");
    c_talk_wait();
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 126 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(1185, global.choice + 1);
}
if (con == 130)
{
    con = 131;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_setxy(1022, 110);
    c_facing("d");
    c_sel(su);
    c_setxy(1060, 126);
    c_facing("u");
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right);
    c_setxy(640, 131);
    c_pannable(1);
    c_pan(721, cameray(), 1);
    c_wait(15);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Hey^1, Kris^1, you're back!/%", "obj_room_green_room_slash_Step_0_gml_1235_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. dude^1, Ralsei^1, Kris is back!/", "obj_room_green_room_slash_Step_0_gml_1244_0");
    c_facenext("ralsei", "L");
    c_msgnextloc("\\EL* H..^1. huh? O-Oops.../%", "obj_room_green_room_slash_Step_0_gml_1246_0");
    c_talk_wait();
    c_sel(ra);
    c_walkdirect_speed_wait(906, 131, 6);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Sorry^1, I got wrapped up in playing an RPG.../", "obj_room_green_room_slash_Step_0_gml_1254_0");
    c_facenext("susie", "A");
    c_msgnextloc("\\EA* Yeah^1, just walking around and not fighting anything./", "obj_room_green_room_slash_Step_0_gml_1256_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* S-sorry^1! We can get going now./%", "obj_room_green_room_slash_Step_0_gml_1258_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right_walk);
    c_wait_box(4);
    c_sel(ra);
    c_walkdirect_speed_wait(986, 131, 8);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait_talk();
    c_wait(5);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 131 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(1186, 1);
}
if (con == 150 && !d_ex())
{
    con = 151;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    el = actor_count + 1;
    el_actor = instance_create(elnina_npc.x, elnina_npc.y, obj_actor);
    scr_actor_setup(el, el_actor, "elnina");
    el_actor.sprite_index = elnina_npc.sprite_index;
    elnina = el_actor;
    pip = actor_count + 2;
    pip_actor = instance_create(pippins_npc.x, pippins_npc.y, obj_actor);
    scr_actor_setup(pip, pip_actor, "pippins");
    pip_actor.sprite_index = pippins_npc.sprite_index;
    pippins = pip_actor;
    global.facing = 0;
    c_msc(1377);
    c_talk_wait();
    c_waitcustom();
}
if (con == 155 && !d_ex() && customcon == 1)
{
    con = 156;
    customcon = 0;
    with (pippins_npc)
        instance_destroy();
    c_waitcustom_end();
    c_var_instance(elnina_npc, "visible", 0);
    c_sel(el);
    c_halt();
    c_sel(kr);
    c_walkdirect(kr_actor.x, 274, 8);
    c_delaywalkdirect(9, 766, 274, 15);
    c_delayfacing(25, "r");
    c_sel(su);
    c_walkdirect(su_actor.x, 259, 8);
    c_delaywalkdirect(9, 700, 259, 15);
    c_delayfacing(25, "r");
    c_sel(ra);
    c_walkdirect(ra_actor.x, 262, 8);
    c_delaywalkdirect(9, 644, 262, 15);
    c_delayfacing(25, "r");
    c_wait(30);
    c_sel(el);
    c_speaker("no_name");
    c_msgsetloc(0, "* Oh^1, Lanino^1? Well.../%", "obj_room_green_room_slash_Step_0_gml_1364_0");
    c_talk_wait();
    c_sel(el);
    c_autowalk(0);
    c_snd_play(snd_wing);
    c_snd_play(snd_ralsei_yell);
    c_sprite(spr_npc_elnina_gaming_cry);
    c_imagespeed(0.2);
    c_shakeobj();
    c_var_instance(pippins_npc, "visible", 0);
    c_sel(pip);
    c_autowalk(0);
    c_sprite(spr_npc_pippins_gaming_stop);
    c_halt();
    c_speaker("no_name");
    c_msgsetloc(0, "* My SUNSHINE IS GONE!!^1! My brilliant SUNSHINE!!!/%", "obj_room_green_room_slash_Step_0_gml_1384_0");
    c_talk_wait();
    c_sel(pip);
    c_imageindex(1);
    c_wait(12);
    c_imageindex(2);
    c_wait(6);
    c_imageindex(3);
    c_wait(6);
    c_sprite(spr_npc_pippins_gaming_leave);
    c_addxy(0, 10);
    c_snd_play(snd_bump);
    c_halt();
    c_wait(15);
    c_var_lerp_to("image_index", 5, 20);
    c_var_lerp_to("x", pip_actor.x + 20, 20);
    c_wait(35);
    c_snd_play(snd_jump);
    c_jump(1004, 133, 25, 15);
    c_sprite(spr_npc_pippins_jump);
    c_imageindex(4);
    c_wait(14);
    c_sprite(spr_npc_pippins);
    c_wait(5);
    c_var_lerp_to("x", camerax() + view_wport[0] + 100, 20, 3, "out");
    c_wait(15);
    c_snd_play(snd_escaped);
    c_wait(30);
    c_sel(el);
    c_halt();
    c_sprite(spr_npc_elnina_gaming_sneeze);
    c_snd_play_x(snd_wing, 1, 1.5);
    c_imageindex(0);
    c_imagespeed(0);
    c_wait(15);
    c_snd_play_x(snd_sneeze, 1, 1.5);
    c_imageindex(1);
    c_shakeobj();
    c_wait(15);
    c_sprite(spr_npc_elnina_gaming_postsneeze);
    c_wait(40);
    c_speaker("no_name");
    c_msgsetloc(0, "* Everything reminds me of him^1! Everything!/", "obj_room_green_room_slash_Step_0_gml_1434_0");
    c_msgnextloc("* The nighttime..^1. the DAYTIME..^1. I saw a big wheel of cheese and.../%", "obj_room_green_room_slash_Step_0_gml_1435_0");
    c_talk_wait();
    c_sprite(spr_npc_elnina_gaming_cry);
    c_snd_play(snd_wing);
    c_snd_play(snd_ralsei_yell);
    c_imagespeed(0.2);
    c_shakeobj();
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* I THOUGHT IT WAS HIS FACE!!!/%", "obj_room_green_room_slash_Step_0_gml_1448_0");
    c_talk_wait();
    c_wait(15);
    c_sprite(spr_npc_elnina_gaming_postsneeze);
    c_msc(1379);
    c_talk_wait();
    c_waitcustom();
}
if (con == 158 && !d_ex() && customcon == 1)
{
    con = 160;
    customcon = 0;
    with (obj_readable_room1)
    {
        if (extflag == "tv_right")
            read = 0;
    }
    c_waitcustom_end();
    if (global.choice == 0)
    {
        scr_flag_set(1210, 1);
        c_sprite(spr_npc_elnina_shocked_gaming);
        c_halt();
        c_speaker("no_name");
        c_msgsetloc(0, "* That's..^1. that's right^1! I'm the wave^1, aren't I!? I can weather any storm MYSELF!/%", "obj_room_green_room_slash_Step_0_gml_1476_0");
        c_talk_wait();
        c_sprite(spr_npc_elnina_gloat_gaming);
        c_speaker("no_name");
        c_msgsetloc(0, "* We'll see how far he gets without me to do his MAKEUP!/%", "obj_room_green_room_slash_Step_0_gml_1483_0");
        c_talk_wait();
        c_sprite(spr_npc_elnina_blush_gaming);
        c_speaker("no_name");
        c_msgsetloc(0, "* Thanks^1, Kris^1! You're a real cucumber^1, you know? Umm^1, not a cool one^1, but.../%", "obj_room_green_room_slash_Step_0_gml_1491_0");
        c_talk_wait();
    }
    else
    {
        scr_flag_set(1210, 2);
        c_sprite(spr_npc_elnina_shocked_gaming);
        c_halt();
        c_speaker("no_name");
        c_msgsetloc(0, "* That's..^1. that's right^1! Weather girls are the wave..^1. aren't they!?/%", "obj_room_green_room_slash_Step_0_gml_1502_0");
        c_talk_wait();
        c_sprite(spr_npc_elnina_gloat_gaming);
        c_speaker("no_name");
        c_msgsetloc(0, "* A cool cloud never stays alone in the sky for long^1! Heheh!/%", "obj_room_green_room_slash_Step_0_gml_1509_0");
        c_talk_wait();
        c_sprite(spr_npc_elnina_blush_gaming);
        c_speaker("no_name");
        c_msgsetloc(0, "* Thanks^1, Kris^1! You're a real cucumber^1, you know? Umm^1, not a cool one^1, but.../%", "obj_room_green_room_slash_Step_0_gml_1516_0");
        c_talk_wait();
    }
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(30);
    c_var_instance(elnina_npc, "visible", 1);
    c_sel(kr);
    c_facing("d");
    c_waitcustom();
}
if (con == 160 && !d_ex() && customcon == 1)
{
    con = 161;
    customcon = 0;
    c_waitcustom_end();
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 161 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
}
if (con == 170 && !d_ex() && global.interact == 0)
{
    con = 171;
    scr_delay_var("con", 172, 30);
    global.interact = 1;
    with (pippins_drink_marker)
        scr_lerpvar("y", y, 60, 10, 3, "out");
}
if (con == 172)
{
    con = 173;
    global.msc = 1403;
    scr_text(global.msc);
    d_make();
}
if (con == 173 && !d_ex())
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    var pippins_readable = instance_create(790, 140, obj_readable_room1);
    with (pippins_readable)
        extflag = "pippins_drink";
}
if (con == 180)
{
    con = 181;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(kr);
    c_setxy(1022, 90);
    c_walkdirect(1022, 110, 15);
    c_facing("d");
    c_sel(su);
    c_setxy(1076, 94);
    c_facing("d");
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_racing_play);
    c_imagespeed(0.2);
    c_setxy(850, 240);
    c_pannable(1);
    c_pan(721, cameray(), 1);
    c_wait(30);
    c_sel(su);
    c_facing("l");
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Took you long enough./%", "obj_room_green_room_slash_Step_0_gml_1448_0_b");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_facing("d");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EP* Susie^1! Susie^1, look^1! I made it to Level 2!/", "obj_room_green_room_slash_Step_0_gml_1458_0");
    c_facenext("susie", "A");
    c_msgnextloc("\\EA* Level 2^1, huh?/%", "obj_room_green_room_slash_Step_0_gml_1460_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_wait(15);
    c_sel(ra);
    c_imagespeed(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Kris^1, you're the tryhard. Whaddya you think?/%", "obj_room_green_room_slash_Step_0_gml_1472_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_racing_surprise);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* ..^1. K..^1. Kris?/%", "obj_room_green_room_slash_Step_0_gml_1481_0");
    c_talk_wait();
    c_snd_play(snd_jump);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("d");
    c_jump(852, 263, 26, 8);
    c_wait(15);
    c_autowalk(1);
    c_walkdirect(1056, 263, 20);
    c_delaywalkdirect(21, 1056, 145, 20);
    c_sel(su);
    c_delayfacing(21, "d");
    c_wait(20);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EO* I'm sorry^1, Kris^1! I..^1. I forgot all about you!/%", "obj_room_green_room_slash_Step_0_gml_1501_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_up_sad);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* I got so into playing games with Susie^1, I.../%", "obj_room_green_room_slash_Step_0_gml_1510_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Heh^1, you should have seen it^1, Kris!/%", "obj_room_green_room_slash_Step_0_gml_1518_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_laugh_dw);
    c_imagespeed(0.2);
    c_addxy(4, 4);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* He was actually RAGING at the falling arrow part./%", "obj_room_green_room_slash_Step_0_gml_1529_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_facing("d");
    c_addxy(-4, -4);
    c_halt();
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_glasses_adjust);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EX* I suppose I was^1, not very chuffed^1, by that dart./", "obj_room_green_room_slash_Step_0_gml_1548_0");
    c_msgnextloc("\\E1* But I..^1. I had fun./%", "obj_room_green_room_slash_Step_0_gml_1553_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_blush);
    c_halt();
    c_wait_talk();
    c_wait(30);
    c_sel(ra);
    c_facing("d");
    c_emote("!", 30);
    c_wait(30);
    c_facing("u");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* ..^1. s-sorry^1! Did you want to play^1, Kris?/", "obj_room_green_room_slash_Step_0_gml_1577_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* Dude^1, we need to seal the fountain./", "obj_room_green_room_slash_Step_0_gml_1582_0");
    c_facenext("ralsei", "K");
    c_msgnextloc("\\EK* Oh^1! Right^1! I.../%", "obj_room_green_room_slash_Step_0_gml_1585_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("r");
    c_halt();
    c_wait_box(4);
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("ralseinohat");
    c_facing("d");
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_sad);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* How did I..^1. forget about that...?/%", "obj_room_green_room_slash_Step_0_gml_1611_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_wait(1142, 145, 15);
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_walkdirect_wait(1142, 98, 15);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Let's go./%", "obj_room_green_room_slash_Step_0_gml_1627_0");
    c_talk_wait();
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(30);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 181 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(1192, 1);
}
if (border_switch)
{
    border_switch = false;
    with (obj_border_controller)
    {
        set_border(border_dw_green_room, 1);
        show_border(1);
    }
}
