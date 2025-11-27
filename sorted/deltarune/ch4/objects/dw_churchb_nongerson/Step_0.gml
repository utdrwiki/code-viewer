if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
    rippler = instance_create(camerax() + 400, cameray() + 260, obj_church_old_man_ripple);
}
if (con == 2)
{
    con = 10;
    customcon = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (scr_debug() && keyboard_check(ord("V")))
        global.tempflag[99] = 0;
    if (scr_debug() && keyboard_check(ord("B")))
    {
        con = 46;
        customcon = 1;
        debug_print("skip to midbattle cutscene");
    }
    else if (scr_debug() && keyboard_check(ord("N")))
    {
        con = 304;
        customcon = 1;
        debug_print("skip to endbattle cutscene");
    }
    else if (global.tempflag[99] == 1)
    {
        con = 38;
        debug_print("skip intro");
    }
    else
    {
        c_speaker("susie");
        c_fefc(0, 0);
        c_msgsetloc(0, "* Damn^1, the hell am I gonna find a way back...?/", "obj_dw_churchb_nongerson_slash_Step_0_gml_50_0");
        c_msgnextloc("* Maybe if I just.../", "obj_dw_churchb_nongerson_slash_Step_0_gml_51_0");
        c_msgnextloc("* Try and listen what's around me...?/%", "obj_dw_churchb_nongerson_slash_Step_0_gml_52_0");
        c_talk_wait();
        c_wait(30);
        c_var_instance(id, "ripple_con", 0);
        c_waitcustom();
    }
}
if (con == 10 && !d_ex() && customcon == 1)
{
    con = 11;
    alarm[0] = 40;
}
if (con == 12 && !d_ex() && customcon == 1)
{
    customcon = 0;
    con = 19;
    alarm[0] = 30;
    c_waitcustom_end();
    c_var_instance(id, "susie_timer", 10);
    c_var_instance(id, "force_ripple", true);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* ..^1. Old..^1. man?/", "obj_dw_churchb_nongerson_slash_Step_0_gml_81_0");
    c_msgnextloc("* Old man^1, that's you^1, right...?/%", "obj_dw_churchb_nongerson_slash_Step_0_gml_82_0");
    c_talk();
    c_wait_box_end(0);
    c_var_instance(id, "susie_timer", 0);
    c_var_instance(id, "force_ripple", false);
    c_waittalk();
    c_var_lerp_add_instance(rippler, "image_index", 2, 30);
    c_var_lerp_add_instance(rippler, "distance", -30, 30);
    c_wait(30);
    c_var_instance(id, "ripple_con", 0);
    c_waitcustom();
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = 21;
    alarm[0] = 30;
}
if (con == 22 && !d_ex() && customcon == 1)
{
    customcon = 0;
    con = 29;
    alarm[0] = 30;
    c_waitcustom_end();
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Old man^1, hey^1! We've been looking for you!/", "obj_dw_churchb_nongerson_slash_Step_0_gml_114_0");
    c_msgnextloc("* There's like..^1. this door code^1, and.../", "obj_dw_churchb_nongerson_slash_Step_0_gml_115_0");
    c_msgnextloc("* I thought you might know the.../%", "obj_dw_churchb_nongerson_slash_Step_0_gml_116_0");
    c_talk_wait();
    c_var_lerp_add_instance(rippler, "image_index", 2, 30);
    c_var_lerp_add_instance(rippler, "distance", -30, 30, 2, "in");
    c_wait(30);
    c_var_instance(id, "ripple_con", 0);
    c_wait(10);
    c_var_lerp_add_instance(rippler, "image_index", 2, 30);
    c_var_lerp_to_instance(rippler, "distance", 0, 30, 2, "in");
    c_wait(30);
    c_var_instance(id, "ripple_con", 0);
    c_waitcustom();
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 31;
    alarm[0] = 20;
}
if (con == 32 && !d_ex() && customcon == 1)
{
    con++;
    alarm[0] = 20;
}
if (con == 34 && !d_ex() && customcon == 1)
{
    customcon = 0;
    con = 38;
    c_waitcustom_end();
    c_var_instance(rippler, "susie_sprite", 5197);
    c_var_instance(id, "susie_timer", 10);
    c_var_instance(id, "force_ripple", true);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* ..^1. Hey..^1. old man.../", "obj_dw_churchb_nongerson_slash_Step_0_gml_167_0");
    c_msgnextloc("* Are you..^1. okay?/%", "obj_dw_churchb_nongerson_slash_Step_0_gml_168_0");
    c_talk();
    c_wait_box_end(0);
    c_var_instance(id, "susie_timer", 0);
    c_var_instance(id, "force_ripple", false);
    c_waittalk();
    c_wait(26);
    c_var_instance(rippler, "shiner", 0);
    c_wait(32);
    c_var_lerp_instance(rippler, "image_index", 0, 6, 15, 2, "out");
    c_var_instance(id, "ripple_con", 1);
    c_wait(180);
}
if (con == 38)
{
    con = 39;
    alarm[0] = 40;
    c_var_instance(rippler, "x", camerax() + 456);
    c_var_instance(id, "ripple_con", 2);
    c_wait(70);
    c_waitcustom();
}
if (con == 40 && !d_ex() && customcon == 1)
{
    if (global.tempflag[99] == 0)
        global.tempflag[99] = 1;
    with (blackall)
        visible = false;
    global.cinstance[0].x = 78;
    global.cinstance[0].y = 149;
    global.char[0] = 2;
    global.char[1] = 0;
    global.char[2] = 0;
    with (obj_church_old_man_ripple)
    {
        x += 100;
        y -= 25;
        version = 1;
        susie_timer = 0;
    }
    con = 41;
    alarm[0] = 30;
    if (global.tempflag[30] == 0)
        global.tempflag[30] = 1;
    snd_free_all();
    gerson_marker = scr_marker_ext(room_width, room_height, spr_gerson_laugh, 2, 2, undefined, undefined, c_black, 5000);
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("statue_chord_basic.ogg");
    encounterflag = 176;
    global.flag[54] = encounterflag;
    scr_battle(176, 1, gerson_marker, 0, 0);
    global.flag[9] = 1;
    with (obj_actor)
        visible = 0;
}
if (con == 42 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 43;
        alarm[0] = 30;
        snd_volume(global.batmusic[1], 0, 25);
        snd_volume(global.batmusic[3], 0, 25);
    }
}
if (con == 44)
{
    con = 45;
    alarm[0] = 1;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
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
    if (i_ex(obj_heart))
    {
        with (obj_heart)
            instance_destroy();
    }
    if (i_ex(obj_battlecontroller))
    {
        with (obj_battlecontroller)
            instance_destroy();
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (blackall)
        visible = true;
    with (kr_actor)
    {
        x = 80;
        y = 52;
        sprite_index = spr_krisr_dark;
    }
    with (su_actor)
    {
        x = 86;
        y = 150;
        sprite_index = spr_susie_surprised_step_back;
    }
}
if (con == 46 && !d_ex() && customcon == 1)
{
    customcon = 0;
    con = 47;
    alarm[0] = 40;
    with (blackall)
        visible = true;
    c_waitcustom_end();
    c_fefc(0, 0);
    c_wait(26);
    c_var_instance(rippler, "susie_sprite", 1535);
    c_var_instance(rippler, "variant", 1);
    c_var_instance(rippler, "shiner", 0);
    c_wait(32);
    c_var_lerp_instance(rippler, "image_index", 0, 6, 15, 2, "out");
    c_var_instance(rippler, "variant", 1);
    c_var_instance(id, "ripple_con", 1);
    c_wait(10);
    c_wait(45);
    c_var_instance(rippler, "susie_sprite", 1551);
    c_wait(85);
    c_var_instance(rippler, "x", camerax() + 180);
    c_var_instance(rippler, "variant", 2);
    c_var_instance(rippler, "shiner", 0);
    c_wait(30);
    c_var_instance(id, "ripple_con", 3);
    c_wait(50);
    c_var_instance(id, "ripple_con", 4);
    c_wait(60);
    c_waitcustom();
}
if (con == 48 && !d_ex() && customcon == 1)
{
    global.char[0] = 1;
    con = 49;
    alarm[0] = 30;
    if (global.tempflag[30] == 0)
        global.tempflag[30] = 1;
    snd_free_all();
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("statue_chord_basic.ogg");
    with (blackall)
        visible = false;
    if (i_ex(gerson_marker))
    {
        with (gerson_marker)
            instance_destroy();
    }
    gerson_marker = scr_marker_ext(room_width, room_height, spr_gerson_laugh, 2, 2, undefined, undefined, c_black, 5000);
    encounterflag = 186;
    global.flag[54] = encounterflag;
    scr_battle(186, 1, gerson_marker, 0, 0);
    global.flag[9] = 1;
    with (obj_actor)
        visible = 0;
}
if (con == 50 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 301;
        alarm[0] = 30;
        snd_volume(global.batmusic[1], 0, 25);
    }
}
if (con == 100)
{
}
if (con == 302)
{
    con = 303;
    alarm[0] = 1;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
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
    if (i_ex(obj_gerson_darkness_overlay))
    {
        with (obj_gerson_darkness_overlay)
            instance_destroy();
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (blackall)
        visible = true;
    with (su_actor)
    {
        x = 333;
        y = 1635;
        color_blend = c_white;
        sprite_index = spr_susie_surprised_step_back;
    }
    with (kr_actor)
    {
        x = 260;
        y = 1651;
        sprite_index = spr_krisr_dark;
    }
    with (obj_actor)
        visible = 1;
}
if (con == 304)
{
    con = 305;
    c_waitcustom_end();
    c_customfunc(function()
    {
        scr_actor_setup(ra, ra_actor, "ralsei");
        ra_actor.x = camerax() + 670;
        ra_actor.y = rippler.y - 86;
        ra_actor.lsprite = spr_ralsei_running_left;
        ra_actor.auto_depth = 0;
        ra_actor.depth = rippler.depth + 1;
        ra_actor.visible = true;
        ra_actor.color_blend = c_black;
    });
    var _riplx = camerax() + 440;
    c_wait(20);
    c_var_instance(id, "ripple_con", 2);
    c_var_instance(rippler, "x", _riplx);
    c_var_instance(rippler, "variant", 1);
    c_sel(ra);
    c_walkdirect(_riplx + 100, rippler.y - 86, 20);
    c_wait(20);
    c_autowalk(false);
    c_customfunc(function()
    {
        ra_actor.image_xscale = -2;
        ra_actor.image_speed = 0;
        ra_actor.image_index = 0;
        ra_actor.sprite_index = spr_ralsei_attack;
        ra_actor.x = camerax() + 440 + 130;
    });
    c_var_lerp_instance(ra_actor, "x", _riplx + 130, _riplx + 110, 6, 2, "out");
    c_var_lerp_instance(ra_actor, "image_index", 0, 3, 8);
    c_wait(9);
    c_sprite(spr_ralsei_attack_alt);
    c_var_instance(id, "ripple_con", 5);
    c_wait(20);
    c_sprite(spr_ralsei_attack);
    c_imageindex(3);
    c_var_instance(id, "ripple_con", 6);
    c_wait(4);
    c_var_lerp_instance(ra_actor, "image_index", 3, 7, 20);
    c_wait(16);
    c_var_instance(id, "ripple_con", 7);
    c_wait(118);
    c_var_instance(id, "con", 306);
}
if (con == 306)
{
    con = 400;
    room_goto(room_dw_churchb_nongerson_post);
}
if (susie_timer > 0)
    susie_timer--;
if (i_ex(obj_dialoguer) && i_ex(obj_dialoguer.writer))
{
    if (msgno != obj_dialoguer.writer.msgno)
    {
        msgno = obj_dialoguer.writer.msgno;
        susie_ripple = true;
    }
}
else
{
    msgno = -1;
}
if (ripple_con >= 0)
{
    rippler.type = ripple_con;
    rippler.play = true;
    if (ripple_con >= 5)
        scr_shakescreen(2, 2);
    if (ripple_con == 5)
    {
        var _punch_index = punch % 2;
        if (punch != 0)
        {
            if (_punch_index == 0)
            {
                ra_actor.sprite_index = spr_ralsei_attack;
                ra_actor.image_index = 3;
            }
            else if (_punch_index == 1)
            {
                ra_actor.sprite_index = spr_ralsei_attack_alt;
                ra_actor.image_index = 0;
            }
        }
        punch++;
    }
    if (ripple_con == 6)
    {
        var _shatter = instance_create(rippler.x - 80, rippler.y - 114, obj_church_statue_shatter);
        _shatter.depth = rippler.depth;
        _shatter.shatter = true;
    }
    if (ripple_con == 7)
    {
    }
    ripple_con = -1;
}
