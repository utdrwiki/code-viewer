if (!destroyinit)
{
    with (obj_church_piano_hint)
        instance_destroy();
    with (obj_church_secretpiano_playable)
        instance_destroy();
    with (obj_solidblock)
    {
        if (image_blend == c_red)
            instance_destroy();
    }
    con = 200;
    var makeenemy = true;
    if (global.flag[encounterflag] == 1)
        makeenemy = false;
    if (makeenemy)
    {
        var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 4549)
                chaseloc = scr_assetgetinfo(spritesArray[i]);
        }
        chaseenemy = instance_create(chaseloc[2], chaseloc[3], obj_dw_churchb_bellchaser);
        scr_size(2, 2, chaseenemy);
        chaseenemy.con = 0.5;
        chaseenemy.encounterno = encounterno;
        chaseenemy.encounterflag = encounterflag;
        chaseenemy.sprite_index = spr_bell_enemy;
        chaseenemy.autodepth = 1;
        destroyinit = 1;
    }
}
if (con == 0)
{
    var trig = 0;
    with (obj_church_secretpiano_playable)
    {
        if (solved)
            trig = 1;
    }
    if (trig == 1)
        con = 1;
}
if (con == 1)
{
    global.interact = 1;
    con = 10;
    blackall = scr_dark_marker(-10, -100, spr_pixel_white);
    blackall.image_xscale = room_width;
    blackall.image_yscale = room_height;
    blackall.depth = 100;
    blackall.image_alpha = 0;
    blackall.image_blend = c_black;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(90);
    c_waitcustom();
}
if (con == 10 && customcon == 1)
{
    con = 30;
    global.tempflag[90] = 400;
    room_persistent = true;
    room_goto(room_dw_church_gersonstudy);
    exit;
}
if (con == 30 && customcon == 1 && !d_ex())
{
    con = 50;
    global.tempflag[90] = 0;
    room_persistent = false;
}
if (con == 50 && customcon == 1)
{
    global.flag[7] = 0;
    con = 55;
    customcon = 0;
    c_waitcustom_end();
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_imagespeed(0.2);
    c_addxy(0, -6);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* ..^1. Did you just hear something?/", "obj_dw_church_secretpiano_slash_Step_0_gml_128_0");
    c_facenext("ralsei", "K");
    c_msgnextloc("\\EK* It sounded a bit like a fireplace opening up./", "obj_dw_church_secretpiano_slash_Step_0_gml_130_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* Dude^1, too specific. But yeah./%", "obj_dw_church_secretpiano_slash_Step_0_gml_132_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_halt();
    c_sel(ra);
    c_sprite(spr_ralsei_turn_right_subtle);
    c_wait_box(4);
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_addxy(0, 6);
    c_sel(ra);
    c_facing("u");
    c_wait_talk();
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    c_waitcustom();
}
if (con == 55 && customcon == 1)
{
    con = 58;
    with (obj_caterpillarchara)
        visible = 1;
}
if (con == 58 && customcon == 1)
{
    con = 60;
    c_waitcustom_end();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 60 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    scr_flag_set(1547, 1);
    scr_flag_set(851, 1);
    with (obj_church_secretpiano_playable)
        cantuse = true;
    global.currentroom = room;
    scr_tempsave();
}
with (plaque)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Melodies three^1, there be.&* Two in the southern towers&* One where gold strikes water./%", "obj_dw_church_secretpiano_slash_Step_0_gml_209_0");
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
