var cx = camerax();
scr_populatechars();
if (!init)
{
    var _end = scr_heromarker(undefined, "blackend");
    var _start = scr_heromarker(undefined, "blackstart");
    blackloc[0] = _end[0];
    blackloc[1] = _start[0];
    init = 1;
    var lpo = scr_heromarker(undefined, "lockedinpoint");
    lockpoint = lpo[0];
    var pos = scr_heromarker(undefined, "germark");
    gerson = scr_marker_ext(pos[0], pos[1], spr_gerson_walk_armor_left, 2, 2, 0, 0, c_black, undefined, 1);
    if (global.tempflag[90] == 1)
    {
        pos = scr_heromarker("kris", "warp1");
        setxy(pos[0], pos[1], 1049);
        setxy(pos[0], pos[1], 1235);
        scr_caterpillar_interpolate("all");
        global.facing = pos[2].image_index;
        global.tempflag[90] = 0;
    }
}
if (dolock == 0 && cx > 0)
{
    if (cx <= lockpoint)
    {
        dolock = 1;
        layer_set_visible("ASSETS_HIDEME", 1);
        layer_set_visible("TILES_HIDEME", 1);
        var gen = scr_genmarker("blockoff");
        blockoff = instance_create(gen.x, gen.y, obj_solidblocksized);
        scr_sizeexact(gen.sprite_width, gen.sprite_height, blockoff);
    }
}
if (con == 0)
{
    if (scr_trigcheck("cut1"))
    {
        con = 1;
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        c_msgruncheck(1);
        c_speaker("susie");
        c_msgsetloc(0, "\\EC* Damn^1, it's dark in here.../%", "obj_dw_churchb_fireplace_slash_Step_0_gml_56_0");
        c_talk_wait();
        var campos = scr_heromarker(undefined, "cam1");
        var pantime = 30;
        c_pannable();
        c_pan(campos[0], campos[1], pantime);
        c_wait(pantime);
        c_wait(12);
        c_msgruncheck(0);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* Hey!/%", "obj_dw_churchb_fireplace_slash_Step_0_gml_69_0");
        c_talk();
        c_var_instance(gerson, "hspeed", -4);
        c_var_instance(gerson, "image_speed", 0.25);
        c_wait_talk();
        c_pan(cx, cameray(), pantime);
        c_wait(pantime);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* Hey^1, old man^1! The hell are you going!?/", "obj_dw_churchb_fireplace_slash_Step_0_gml_81_0");
        c_msgnextloc("\\EZ* C'mon^1, Kris^1! After him!/%", "obj_dw_churchb_fireplace_slash_Step_0_gml_82_0");
        c_talk_wait();
        c_actortocaterpillar();
        c_actortokris();
        c_pannable(0);
        c_wait(1);
        c_terminatekillactors();
    }
}
if (con == 1 && !instance_exists(obj_cutscene_master))
{
    with (gerson)
    {
        image_speed = 0;
        image_index = 0;
        hspeed = 0;
        var pos = scr_heromarker(undefined, "germark2");
        setxy(pos[0], pos[1]);
    }
    global.interact = 0;
    con = 2;
}
if (con == 2 && gerson.x > (cx + 60))
{
    gerson.hspeed = -8;
    gerson.image_speed = 0.25;
    con = 3;
}
