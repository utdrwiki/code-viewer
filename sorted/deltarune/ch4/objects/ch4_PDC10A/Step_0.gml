if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    with (sparkle_marker)
        instance_destroy();
}
if (con == 2)
{
    con = 3;
    global.facing = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect_wait(205, 95, 10);
    c_halt();
    c_wait(1);
    c_sprite(spr_kris_remove_soul_extended);
    c_addxy(-12, 0);
    c_halt();
    c_wait(4);
    c_imageindex(3);
    c_shakeobj();
    c_wait(2);
    c_imagespeed(0);
    c_wait(60);
    c_delaycmd(88, "imagespeed", 0.1);
    c_delaycmd(158, "imagespeed", 0);
    c_waitcustom();
}
if (con == 3 && customcon == 1)
{
    con = 4;
    scr_speaker("no_name");
    msgsetloc(0, "* (You leaned down to look inside the guitar.)/%", "obj_ch4_PDC10A_slash_Step_0_gml_58_0");
    var d = d_make();
    d.skippable = false;
    d.stay = 5;
}
if (con == 4 && !d_ex())
{
    con = 5;
    scr_speaker("no_name");
    msgsetloc(0, "* (You began to read the numbers in the pass code..^1. ^3 1 ^5 2 ^7 2 %%", "obj_ch4_PDC10A_slash_Step_0_gml_70_0");
    var d = d_make();
    d.skippable = false;
    scr_delay_var("border_hide", true, 70);
}
if (border_hide)
{
    border_hide = false;
    with (obj_border_controller)
        hide_border(0.015);
}
if (con == 5 && i_ex(obj_writer))
{
    con = 6;
    mus_volume(global.currentsong[1], 0, 100);
}
if (con == 6 && !d_ex())
{
    con = 7;
    c_waitcustom_end();
    c_mus("free_all");
    c_imagespeed(0.5);
    c_wait(4);
    c_imageindex(13);
    c_imagespeed(0.25);
    c_shake();
    c_soundplay(snd_damage);
    c_soundplay(snd_hurt1);
    c_wait(31);
    c_imagespeed(0);
    c_imageindex(20);
    c_wait(10);
    c_imagespeed(0.5);
    c_soundplay(snd_hurt1);
    c_imageindex(16);
    c_wait(10);
    c_imagespeed(0);
    c_instance(204, 116, 1273);
    c_soundplay(snd_break1);
    c_soundplay(snd_grab);
    c_imageindex(38);
    c_wait(3);
    c_imageindex(36);
    c_wait(1);
    c_imageindex(35);
    c_wait(60);
    c_imageindex(42);
    c_wait(10);
    c_imageindex(43);
    c_wait(10);
    c_imageindex(44);
    c_wait(30);
    c_sprite(spr_dkris_dl_soul_walk);
    c_addxy(4, 3);
    c_halt();
    c_wait(60);
    c_script_instance(id, snd_play, 15, snd_step1);
    c_script_instance(id, snd_play, 30, snd_step2);
    c_imagespeed(0.2);
    c_walkdirect_wait(135, 160, 110);
    c_walkdirect(135, 240, 50);
    c_wait(30);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(20);
    c_snd_play(snd_dooropen);
    c_script_instance_stop(id, snd_play);
    c_wait(30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 7 && !i_ex(obj_cutscene_master))
{
    global.interact = 3;
    global.entrance = 3;
    instance_create(0, 0, obj_persistentfadein);
    global.plot = 61;
    room_goto(room_lw_noellehouse_main);
    con = 99;
}
