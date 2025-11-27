if (!init)
{
    scr_populatechars();
    with (obj_dw_church_prophecy)
    {
        if (extflag == "1")
            other.prop1 = id;
        if (extflag == "2")
            other.prop2 = id;
    }
    if (movetocutscene == 1)
    {
        global.plot = 0;
        cutscene = 0;
        var debugmarker = scr_heromarker("kris", "debugmarker");
        if (i_ex(debugmarker[2]))
            setxy(debugmarker[0], debugmarker[1], kris);
        with (obj_caterpillarchara)
        {
            setxy(other.kris.x, other.kris.y);
            scr_caterpillar_interpolate_old();
        }
    }
    var ger = scr_heromarker("gen", "germarkloc");
    germark = scr_marker_ext(ger[0], ger[1], spr_gerson_outfit_walk_cane_right, 2, 2, 0, undefined, c_black, undefined, 1);
    init = 1;
}
var prophecyactive = 0;
var whichproph = -1;
with (obj_trigger)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        if (extflag == "1")
        {
            whichproph = 1;
            prophecyactive = 1;
        }
        if (extflag == "2")
        {
            whichproph = 2;
            prophecyactive = 1;
        }
    }
}
roomglow.active = prophecyactive;
with (obj_dw_church_prophecy)
    active = false;
if (whichproph == 1)
    prop1.active = true;
if (whichproph == 2)
    prop2.active = true;
if (cutscene == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "line2")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        global.interact = 1;
        cutscene = 1;
    }
}
if (cutscene == 1)
{
    cutscene++;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    kris.visible = true;
    ralsei.visible = true;
    susie.visible = true;
    with (kris)
        scr_delay_var("visible", false, 1);
    with (ralsei)
        scr_delay_var("visible", false, 1);
    with (susie)
        scr_delay_var("visible", false, 1);
    with (obj_roomglow)
        create_highlight(obj_actor);
    c_wait(1);
    c_pannable(1);
    var campos = scr_heromarker("gen", "cam1");
    c_pan(campos[0], campos[1], 20);
    c_sel(su);
    var supos = scr_heromarker("su", "1");
    c_walkdirect(supos[0], supos[1], 20);
    c_sel(kr);
    var krpos = scr_heromarker("kr", "1");
    c_walkdirect(krpos[0], krpos[1], 20);
    c_sel(ra);
    var rapos = scr_heromarker("ra", "1");
    c_walkdirect(rapos[0], rapos[1], 20);
    c_wait(21);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_wait(15);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Hahaha^1! Dude^1, that totally happened!/", "obj_dw_church_shadowgerson_slash_Step_0_gml_134_0");
    c_msgnextloc("\\E2* Didn't know the prophecy was supposed to be this accurate./", "obj_dw_church_shadowgerson_slash_Step_0_gml_135_0");
    c_facenext("ralsei", "0");
    c_msgnextloc("\\E0* It..^1. it is^1, Susie./", "obj_dw_church_shadowgerson_slash_Step_0_gml_137_0");
    c_msgnextloc("\\EQ* Everything it says..^1. will come to pass./", "obj_dw_church_shadowgerson_slash_Step_0_gml_138_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* Damn..^1. So it like^1, actually predicts the future?/", "obj_dw_church_shadowgerson_slash_Step_0_gml_140_0");
    c_msgnextloc("\\E7* Dude^1, that's actually like a big deal./", "obj_dw_church_shadowgerson_slash_Step_0_gml_141_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* Yes..^1. it is^1, a big deal^1, Susie!/", "obj_dw_church_shadowgerson_slash_Step_0_gml_143_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* ..^1. there^1, uh^1, aren't any where I do anything cool^1, right?/", "obj_dw_church_shadowgerson_slash_Step_0_gml_145_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* Umm.../%", "obj_dw_church_shadowgerson_slash_Step_0_gml_147_0");
    c_talk();
    c_wait_box(0);
    c_sel(su);
    c_sprite(spr_susie_laugh_dw);
    c_autowalk(0);
    c_imagespeed(0.16666666666666666);
    c_setxy((supos[0] + 12) - 4, supos[1] + 2);
    c_wait_box_end(0);
    c_sel(su);
    c_imagespeed(0);
    c_wait_box(1);
    c_imageindex(0);
    c_imagespeed(0);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw);
    c_setxy(supos[0], supos[1]);
    c_wait_box(2);
    c_sel(kr);
    c_facing("l");
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_sel(su);
    c_facing("l");
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_setxy(supos[0], supos[1]);
    c_wait_box(11);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw);
    c_wait_talk();
    c_wait(15);
    c_var_instance(id, "dogerson", 1);
    c_sel(su);
    c_sprite(spr_susie_sheeh);
    c_shakeobj();
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_unhappy);
    c_wait(11);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* H-hey!/", "obj_dw_church_shadowgerson_slash_Step_0_gml_211_0");
    c_msgnextloc("\\EP* Dude^1, did you see that? Someone's sneaking around.../", "obj_dw_church_shadowgerson_slash_Step_0_gml_212_0");
    c_msgnextloc("\\E1* Kris^1, keep your guard up.../%", "obj_dw_church_shadowgerson_slash_Step_0_gml_213_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_sel(kr);
    c_facing("l");
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_wait_talk();
    c_pan(1029, 220, 12);
    c_wait(12);
    c_sel(kr);
    c_facing("r");
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (dogerson == 1)
{
    var offset = -20;
    var pos = scr_heromarker(undefined, "gerfron");
    with (scr_marker_ext(pos[0], pos[1] + offset, spr_gerson_outfit_walk_cane_right, 2, 2, 0.25, undefined, c_black, undefined, 1))
    {
        hspeed = 8;
        scr_doom(id, 60);
    }
    pos = scr_heromarker(undefined, "gerfron");
    with (scr_marker_ext(pos[0], (pos[1] + offset + 240) - 8, spr_gerson_outfit_walk_cane_right, 2, -4, 0.25, undefined, c_black, undefined, 1))
    {
        hspeed = 8;
        scr_doom(id, 60);
    }
    snd_play(snd_step1);
    snd_play_delay(snd_step2, 4, 0.7);
    snd_play_delay(snd_step1, 8, 0.4);
    snd_play_delay(snd_step2, 12, 0.2);
    dogerson = 2;
}
if (cutscene == 2 && !i_ex(cutscene_master))
{
    global.interact = 0;
    global.plot = 128;
    cutscene++;
}
