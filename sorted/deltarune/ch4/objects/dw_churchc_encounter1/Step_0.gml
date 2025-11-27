with (obj_floorshadow)
    instance_destroy();
scr_populatechars();
if (!init)
{
    if (global.flag[1791] == 0)
    {
        with (obj_dw_bluebook_straight)
        {
            encounterno = other.encounterno;
            encounterflag = other.encounterflag;
        }
    }
    else if (global.flag[1791] == 1)
    {
        with (obj_dw_bluebook_straight)
            instance_destroy();
    }
    else
    {
        with (obj_dw_bluebook_straight)
            easy = true;
    }
    init = 1;
    if (global.plot >= 244)
        con = 2;
}
if (con == 0)
{
    if (scr_trigcheck("cut1"))
        con = 0.5;
}
if (con == 0.5)
{
    global.interact = 1;
    con = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var krpos1 = scr_heromarker("kris", "cut1");
    var supos1 = scr_heromarker("susie", "cut1");
    var rapos1 = scr_heromarker("ralsei", "cut1");
    var campos1 = scr_heromarker(undefined, "cam1");
    var campos2 = scr_heromarker(undefined, "cam2");
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* Do you hear that?/%", "obj_dw_churchc_encounter1_slash_Step_0_gml_61_0");
    c_talk();
    c_wait_talk();
    with (roomglow)
        create_highlight(obj_actor, true, false);
    var krdist1 = max(round(point_distance(kr_actor.x, kr_actor.y, krpos1[0], krpos1[1]) / 4), 1);
    var sudist1 = max(round(point_distance(su_actor.x, su_actor.y, supos1[0], supos1[1]) / 6), 1);
    var radist1 = max(round(point_distance(ra_actor.x, ra_actor.y, rapos1[0], rapos1[1]) / 6), 1);
    var longdist = max(krdist1, sudist1, radist1);
    c_pannable(1);
    c_pan(campos1[0], campos1[1], longdist);
    c_sel(kr);
    c_walkdirect(krpos1[0], krpos1[1], longdist);
    c_delayfacing(krdist1 + 1, "u");
    c_sel(su);
    c_walkdirect(supos1[0], supos1[1], longdist);
    c_delayfacing(longdist + 1, "u");
    c_sel(ra);
    c_walkdirect(rapos1[0], rapos1[1], longdist);
    c_delayfacing(longdist + 1, "u");
    c_wait(sudist1);
    c_wait(15);
    c_sel(kr);
    c_facing("u");
    c_pannable(1);
    c_pan(campos2[0], campos2[1], 30);
    c_wait(45);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E4* The second Fountain.../", "obj_dw_churchc_encounter1_slash_Step_0_gml_103_0");
    c_msgnextloc("\\E8* It's calling us./%", "obj_dw_churchc_encounter1_slash_Step_0_gml_104_0");
    c_msgside("bottom");
    c_talk();
    c_wait_talk();
    c_pannable(1);
    c_pan(campos1[0], campos1[1], 30);
    c_wait(45);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* The Knight must already be over there.../%", "obj_dw_churchc_encounter1_slash_Step_0_gml_115_0");
    c_talk();
    c_wait_talk();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EE* Kris... let's go./%", "obj_dw_churchc_encounter1_slash_Step_0_gml_119_0");
    c_talk();
    c_wait_talk();
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 1)
{
    if (!instance_exists(obj_cutscene_master))
    {
        global.plot = 244;
        global.facing = 0;
        global.interact = 0;
        scr_caterpillar_interpolate();
        con = 2;
    }
}
if (bellcount < 11 && !i_ex(obj_battlecontroller))
{
    timer++;
    if ((timer % 120) == 15)
    {
        bellcount++;
        snd_play(snd_playablebell, 100, 0.2);
    }
}
if (con <= 2 && i_ex(obj_battlecontroller))
    con = 3;
if (con == 3 && !i_ex(obj_battlecontroller))
{
    if (global.flag[1791] != 1)
    {
        var bulletarea = instance_create(720, 560, obj_overworld_bulletarea);
        bulletarea.image_xscale = 42;
        bulletarea.image_yscale = 1500;
        bulletarea.visible = false;
        bulletarea.onlyActiveIfBulletsExist = true;
        con = 4;
    }
    else
    {
        con = 4;
        with (obj_dw_bluebook_straight)
            instance_destroy();
    }
}
