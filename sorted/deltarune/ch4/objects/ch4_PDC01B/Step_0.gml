if (skip_intro)
{
    if (global.interact == 0)
        global.interact = 1;
    if (skip_intro_con == 0 && !d_ex())
    {
        skip_intro_con = 1;
        scr_delay_var("skip_intro_con", 2, 15);
        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
        blackall.image_xscale = 999;
        blackall.image_yscale = 999;
        blackall.depth = 100;
        blackall.image_blend = c_black;
        blackall.image_alpha = 0;
        blackall.visible = 1;
        with (blackall)
            scr_lerpvar("image_alpha", 0, 1, 60);
        mus_fade(global.currentsong[1], 60);
    }
    if (skip_intro_con == 2)
    {
        skip_intro_con = 3;
        scr_speaker("no_name");
        msgsetloc(0, "* (Just looking at the chair^1, your eyes began to close...)/%", "obj_ch4_PDC01B_slash_Step_0_gml_34_0");
        d_make();
    }
    if (skip_intro_con == 3 && !d_ex() && blackall.image_alpha == 1)
    {
        skip_intro_con = 4;
        scr_delay_var("skip_intro_con", 5, 60);
    }
    if (skip_intro_con == 5)
    {
        skip_intro_con = -1;
        scr_flag_set(1628, 1);
        global.plot = 105;
        snd_free_all();
        scr_become_dark();
        room_goto(room_dw_church_intro1);
    }
}
if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    kris_marker = scr_marker(525, 108, spr_kris_chair_sleep);
    kris_marker.depth = 80000;
    toriel_marker = scr_marker(560, 109, spr_toriel_plate_left);
    toriel_marker.depth = kris_marker.depth - 10;
    blanket_marker = scr_marker(520, 120, spr_kris_chair_sleep_blanket_fly);
    blanket_marker.visible = 0;
}
if (con == 2)
{
    con = 3;
    obj_mainchara.y = -40;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    to = actor_count + 1;
    to_actor = instance_create(560, 109, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = spr_toriel_plate_left;
    c_sel(to);
    c_autodepth(0);
    c_depth(toriel_marker.depth);
    c_autowalk(0);
    c_sel(kr);
    c_autodepth(0);
    c_depth(kris_marker.depth);
    c_sprite(spr_kris_chair_sleep);
    c_setxy(kris_marker.x, kris_marker.y);
    c_var_instance(kris_marker, "visible", 0);
    c_var_instance(toriel_marker, "visible", 0);
    c_var_instance(id, "slow_writer", true);
    c_msgside("top");
    c_speaker("toriel");
    c_msgsetloc(0, "\\E0* Wake up!/%", "obj_ch4_PDC01B_slash_Step_0_gml_112_0");
    c_talk_wait();
    c_var_instance(id, "slow_writer", false);
    c_sel(to);
    c_halt();
    c_sprite(spr_toriel_plate_left_ruffle);
    c_imagespeed(0.2);
    c_wait(5);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Good morning^1, sleepyhead^1! Breakfast is waiting!/%", "obj_ch4_PDC01B_slash_Step_0_gml_124_0");
    c_talk_wait();
    c_halt();
    c_sprite(spr_toriel_plate_left);
    c_wait(15);
    c_sprite(spr_toriel_plate_down);
    c_addxy(4, 0);
    c_imagespeed(0.2);
    c_walkdirect_speed_wait(564, 120, 1);
    c_sprite(spr_toriel_plate_left);
    c_walkdirect_speed_wait(340, 120, 2);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Kris^1! Hurry up or someone else'll eat it!/%", "obj_ch4_PDC01B_slash_Step_0_gml_140_0");
    c_talk_wait();
    c_wait(15);
    c_sel(to);
    c_visible(0);
    c_snd_play(snd_wing);
    c_var_instance(id, "blanket_fly", true);
    c_sel(kr);
    c_autowalk(1);
    c_facing("d");
    c_setxy(535, 106);
    c_wait(10);
    c_walkdirect_speed_wait(535, 135, 1);
    c_walkdirect_wait(488, 135, 30);
    c_facing("d");
    c_var_instance(kris_marker, "sprite_index", spr_krisd);
    c_var_instance(kris_marker, "x", 488);
    c_var_instance(kris_marker, "y", 135);
    c_var_instance(kris_marker, "visible", 1);
    c_var_instance(id, "susie_sfx", true);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_mus2("initloop", "home.ogg", 0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 10;
    with (kris_marker)
        instance_destroy();
    blanket_marker.depth = 100000;
    if (can_sleep)
    {
        sparkle_marker = scr_marker(545, 135, spr_shine_white);
        sparkle_marker.depth = blanket_marker.depth - 10;
        with (sparkle_marker)
            image_speed = 0.1;
        sparkle_readable = instance_create(sparkle_marker.x - 10, sparkle_marker.y - 10, obj_readable_room1);
        with (sparkle_readable)
            extflag = "skip_intro";
    }
    con = -1;
}
if (blanket_fly)
{
    blanket_fly_timer++;
    if (blanket_fly_timer == 1)
    {
        blanket_marker.depth = kr_actor.depth + 10;
        blanket_marker.sprite_index = spr_kris_chair_sleep_blanket_fly;
        blanket_marker.visible = 1;
        with (blanket_marker)
        {
            vspeed = -10;
            gravity = 1;
        }
    }
    if (blanket_fly_timer == 20)
    {
        with (blanket_marker)
        {
            vspeed = 0;
            gravity = 0;
            sprite_index = spr_torhouse_chair_blanket;
            x = 525;
            y = 108;
        }
        blanket_fly = false;
    }
}
if (slow_writer && i_ex(obj_writer))
{
    with (obj_writer)
    {
        rate = 4;
        skippable = 0;
    }
}
if (susie_sfx)
{
    susie_sfx = false;
    with (obj_ch4_PDC01C)
        susie_sfx = true;
}
