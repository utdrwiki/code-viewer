if (global.plot >= 55 && global.plot < 95)
{
    if (leave_con == 0 && obj_mainchara.x >= 770)
        leave_con = 1;
}
if (leave_con == 1)
{
    leave_con++;
    global.interact = 1;
    obj_mainchara.x = 764;
    scr_speaker("noelle");
    msgsetloc(0, "\\E8* (Kris^1! This is my big chance^1, you know...!)/%", "obj_ch4_PDC09_slash_Step_0_gml_19_0");
    d_make();
}
if (leave_con == 2 && !d_ex())
{
    leave_con = 0;
    global.interact = 0;
    global.facing = 0;
}
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    kris_marker = scr_marker(700, 497, spr_krisd);
    kris_marker.visible = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_pan(551, 394, 1);
    c_wait(1);
    c_sel(kr);
    c_setxy(740, 497);
    c_walkdirect(700, 497, 30);
    c_sel(su);
    c_setxy(760, 491);
    c_walkdirect(728, 491, 30);
    c_sel(no);
    c_setxy(790, 488);
    c_walkdirect(759, 488, 30);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    c_wait(30);
    c_sel(no);
    c_facing("l");
    var small_talk = stringsetloc("Let's meet at the couch\nwhen you're done, searching?", "obj_ch4_PDC09_slash_Step_0_gml_81_0");
    var loc = [350, 230];
    if (global.lang == "ja")
        loc = [350, 238];
    var notalk = "noelle";
    if (global.lang == "ja")
        notalk = "noelle_cropped";
    scr_smallface(0, notalk, 13, loc[0], loc[1], small_talk);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* Welcome to my ho-ho-home..^1./", "obj_ch4_PDC09_slash_Step_0_gml_84_0");
    c_facenext("susie", "1");
    c_msgnextloc("\\E1* Kris. Let's start searching./", "obj_ch4_PDC09_slash_Step_0_gml_86_0");
    c_facenext("noelle", "4");
    c_msgnextloc("\\E4* Um^1, OK!\\f0/%", "obj_ch4_PDC09_slash_Step_0_gml_88_0");
    c_talk_wait();
    c_var_instance(kris_marker, "visible", 1);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 55;
    with (kris_marker)
        instance_destroy();
    global.currentsong[0] = snd_init("noelle_house_wip.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.9, 1);
    con = 99;
}
