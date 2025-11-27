if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1 && global.interact == 1)
{
    con = 2;
    global.facing = 0;
    c_sel(kr);
    c_visible(0);
    c_setxy(288, 284);
    c_sel(su);
    c_sprite(spr_susie_leaning_down);
    c_setxy(332, 287);
    c_pannable(1);
    c_pan(139, 203, 1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(30);
    c_snd_play(snd_dooropen);
    c_var_instance(door_marker, "image_index", 1);
    c_sel(kr);
    c_visible(0);
    c_setxy(288, 284);
    c_autodepth(0);
    c_depth(88990);
    c_var_instance(kr_actor, "color_blend", merge_color(c_white, make_color_hsv(0, 0, 0), kris_shadow));
    c_visible(1);
    c_sel(kr);
    c_walkdirect(288, 306, 30);
    c_var_instance(id, "kris_show", true);
    c_wait(8);
    c_snd_play(snd_doorclose);
    c_var_instance(door_marker, "image_index", 0);
    c_var_instance(door_marker, "visible", 0);
    c_wait(22);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../%", "obj_ch4_LWF02_slash_Step_0_gml_71_0");
    c_talk_wait();
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("d");
    c_addxy(-2, 0);
    c_wait(30);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(310, 301, 30);
    c_halt();
    c_sel(kr);
    c_facing("d");
    c_var_instance(kris_marker, "visible", 1);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    with (obj_mainchara)
        cutscene = 0;
    with (kris_marker)
        instance_destroy();
    con = 10;
}
if (con == 10)
{
    if (obj_mainchara.x <= 80 || obj_mainchara.y >= 450 || obj_mainchara.y < 200)
    {
        global.interact = 1;
        con = 11;
    }
}
if (con == 11 && global.interact == 1)
{
    con = 15;
    scr_speaker("susie");
    msgsetloc(0, "\\EV* .../", "obj_ch4_LWF02_slash_Step_0_gml_128_0");
    msgnextloc("\\EV* It smells nice./", "obj_ch4_LWF02_slash_Step_0_gml_129_0");
    msgnextloc("\\EV* ..^1. after the rain./%", "obj_ch4_LWF02_slash_Step_0_gml_130_0");
    d_make();
}
if (con == 15 && !d_ex())
{
    con = -1;
    global.plot = 300;
    global.interact = 0;
}
if (kris_show)
{
    kris_shadow = clamp(kris_shadow - 0.2, 0, 1);
    var shadow = kris_shadow;
    with (kr_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (kris_shadow <= 0)
        kris_show = false;
}
