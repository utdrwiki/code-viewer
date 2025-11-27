if (con == 0 && obj_mainchara.x > 365 && (!sunkus_kb_check_pressed(1) && !scr_gamepad_check_any()) && global.interact == 0)
    timer++;
else if (timer > 0 && !can_getup)
    timer = 0;
if (timer >= 300 && con == 0)
{
    con = 1;
    timer = 0;
}
if (can_getup && customcon == 1)
{
    timer++;
    if (sunkus_kb_check_pressed(1) || scr_gamepad_check_any())
    {
        con = 20;
        exit;
    }
    if (getup_con == 0)
    {
        if (timer > 600)
        {
            timer = 0;
            can_getup = false;
            getup_con = 1;
            con = 4;
        }
    }
    if (getup_con == 1)
    {
        if (timer > 600)
        {
            timer = 0;
            can_getup = false;
            getup_con = 2;
            con = 6;
        }
    }
    if (getup_con == 2)
    {
        if (timer > 300)
        {
            timer = 0;
            can_getup = false;
            getup_con = 3;
            con = 8;
        }
    }
    if (getup_con == 3)
    {
        if (timer > 600)
        {
            timer = 0;
            can_getup = false;
            getup_con = 4;
            con = 10;
        }
    }
    if (getup_con == 4)
    {
        if (timer > 600)
        {
            timer = 0;
            can_getup = false;
            getup_con = 99;
            con = 14;
        }
    }
}
if (con == 1)
{
    con = 2;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    mus_volume(global.currentsong[1], 0, 60);
}
if (con == 2)
{
    con = 99;
    oceansong[0] = snd_init("ocean.ogg");
    oceansong[1] = mus_loop(oceansong[0]);
    mus_volume(oceansong[1], 0, 0);
    mus_volume(oceansong[1], 0.5, 150);
    c_sel(su);
    c_facing("susieunhappy");
    c_walkdirect(364, 122, 30);
    c_delayfacing(31, "r");
    c_sel(kr);
    c_walkdirect(362, 80, 30);
    c_delayfacing(31, "r");
    c_pannable(1);
    c_panspeed(1, 0, 40);
    c_wait(32);
    c_autowalk(0);
    c_sprite(spr_kris_sit_wind);
    c_imagespeed(0.1);
    c_sel(su);
    c_wait(5);
    c_autowalk(0);
    c_sprite(spr_susie_sit_wind_neutral);
    c_imagespeed(0.1);
    c_wait(15);
    c_var_instance(id, "can_getup", true);
    c_waitcustom();
}
if (con == 4)
{
    con = 5;
    customcon = 0;
    scr_flag_set(712, 1);
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_sit_wind_turn);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. You hear that?/", "obj_ch4_LWF02A_slash_Step_0_gml_151_0");
    c_msgnextloc("\\EV* ..^1. no?/%", "obj_ch4_LWF02A_slash_Step_0_gml_152_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../%", "obj_ch4_LWF02A_slash_Step_0_gml_158_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. sounds like someone's playing a song out there./", "obj_ch4_LWF02A_slash_Step_0_gml_164_0");
    c_msgnextloc("\\EV* .../", "obj_ch4_LWF02A_slash_Step_0_gml_165_0");
    c_msgnextloc("\\EV* Y'know..^1. on the other side of the lake./%", "obj_ch4_LWF02A_slash_Step_0_gml_166_0");
    c_talk_wait();
    c_wait(15);
    c_sprite(spr_susie_sit_wind_neutral);
    c_var_instance(id, "can_getup", true);
    c_waitcustom();
}
if (con == 6)
{
    con = 7;
    customcon = 0;
    scr_flag_set(712, 2);
    c_waitcustom_end();
    c_sel(kr);
    c_sprite(spr_kris_sit_wind_look_down);
    c_wait(60);
    c_var_instance(id, "can_getup", true);
    c_waitcustom();
}
if (con == 8)
{
    con = 9;
    customcon = 0;
    scr_flag_set(712, 3);
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_sit_wind_turn);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. what^1, I got something on my face or something?/%", "obj_ch4_LWF02A_slash_Step_0_gml_210_0");
    c_talk_wait();
    c_sel(kr);
    c_sprite(spr_kris_sit_wind);
    c_sel(su);
    c_sprite(spr_susie_sit_wind_neutral);
    c_var_instance(id, "can_getup", true);
    c_waitcustom();
}
if (con == 10)
{
    con = 11;
    customcon = 0;
    scr_flag_set(712, 4);
    c_waitcustom_end();
    c_msc(1302);
    c_talk_wait();
}
if (con == 12)
{
    con = 13;
    c_sel(su);
    c_sprite(spr_susie_sit_wind_turn);
    if (global.choice == 0)
    {
        scr_flag_set(713, 1);
        c_speaker("susie");
        c_msgsetloc(0, "\\EV* ..^1. huh?/", "obj_ch4_LWF02A_slash_Step_0_gml_249_0");
        c_msgnextloc("\\EV* ..^1. Why are you talking..^1. with your mouth closed?/%", "obj_ch4_LWF02A_slash_Step_0_gml_250_0");
        c_talk_wait();
    }
    else
    {
        scr_flag_set(713, 2);
        c_speaker("susie");
        c_msgsetloc(0, "\\EV* ..^1. \"Nothing\"?/", "obj_ch4_LWF02A_slash_Step_0_gml_257_0");
        c_msgnextloc("\\EV* ..^1. then why'd you wait so long to say it?/%", "obj_ch4_LWF02A_slash_Step_0_gml_258_0");
        c_talk_wait();
    }
    c_wait(15);
    c_sprite(spr_susie_sit_wind_neutral);
    c_var_instance(id, "can_getup", true);
    c_waitcustom();
}
if (con == 14)
{
    con = 20;
    customcon = 0;
    scr_flag_set(712, 5);
    c_waitcustom_end();
    c_sel(su);
    c_autowalk(1);
    c_sprite(spr_susie_walk_right_lw_unhappy);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../", "obj_ch4_LWF02A_slash_Step_0_gml_284_0");
    c_msgnextloc("\\EV* Guess we should go./", "obj_ch4_LWF02A_slash_Step_0_gml_285_0");
    c_msgnextloc("\\EV* .../", "obj_ch4_LWF02A_slash_Step_0_gml_289_0");
    c_msgnextloc("\\EV* Kris?/%", "obj_ch4_LWF02A_slash_Step_0_gml_290_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("u");
    c_wait_talk();
    c_wait(60);
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. C'mon^1, we can't just sit here forever./%", "obj_ch4_LWF02A_slash_Step_0_gml_307_0");
    c_talk_wait();
    c_sel(su);
    c_walk_wait("l", 2, 12);
    c_wait(60);
    c_facing("u");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Kris.../", "obj_ch4_LWF02A_slash_Step_0_gml_318_0");
    c_msgnextloc("\\EW* Don't howl./%", "obj_ch4_LWF02A_slash_Step_0_gml_319_0");
    c_talk_wait();
    c_wait(30);
    c_waitcustom();
}
if (con == 20 && customcon == 1)
{
    con = 21;
    customcon = 0;
    alarm[0] = 30;
    c_waitcustom_end();
    mus_volume(oceansong[1], 0, 90);
    mus_volume(global.currentsong[1], 1, 90);
    c_sel(kr);
    c_autowalk(1);
    c_sprite(spr_krisr);
    c_wait(5);
    c_sel(kr);
    c_facing("d");
    c_walk("l", 2, 22);
    c_facing("d");
    c_wait(10);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(345, 74, 15);
    c_facing("l");
    c_panobj(kr_actor, 60);
    c_wait(65);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 22 && !i_ex(obj_cutscene_master))
{
    con = -1;
    snd_free(oceansong[1]);
    obj_mainchara.cutscene = 0;
    global.interact = 0;
    global.facing = 0;
    instance_destroy();
}
