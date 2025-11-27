scr_populatechars();
if (!init)
{
    var pos = scr_heromarker(undefined, "prop1");
    prophecy1 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy1.extflag = "heroes3";
    prophecy1.fade_edges = true;
    var pos2 = scr_heromarker(undefined, "prop2");
    prophecy2 = instance_create(pos2[0] + 150, pos2[1] + 90 + 10, obj_dw_church_prophecy);
    prophecy2.extflag = "boss2";
    prophecy2.fade_edges = true;
    roomglow = instance_create(0, 0, obj_roomglow);
    if (global.flag[1543] == 1)
    {
        with (obj_dw_church_remotepianomove)
            instance_destroy();
        with (obj_bookshelf_destructable)
        {
            if (flagno == -1)
                instance_destroy();
        }
    }
    with (roomglow)
        create_highlight(other.npc1.marker, true, true, -12);
    init = 1;
}
if (global.interact == 0)
{
    with (obj_floorTrigger)
    {
        if (place_meeting(x, y, obj_mainchara))
        {
            var checkflag = extflag;
            with (obj_solid_temp)
            {
                if (extflag == checkflag)
                    active = true;
                else
                    active = false;
            }
            if (extflag == "FLOOR1")
                other.flooractive = 1;
            else
                other.flooractive = 2;
        }
    }
}
if (cutscene == 0)
{
    if (scr_trigcheck("cut1"))
    {
        cutscene = 1;
        global.interact = 1;
    }
}
if (cutscene == 1)
{
    cutscene = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (roomglow)
    {
        var actors = [];
        with (obj_actor)
            array_push(actors, id);
        for (var i = 0; i < array_length(actors); i++)
            create_highlight(actors[i]);
    }
    var campos = scr_heromarker(undefined, "campos1");
    var krpos = scr_heromarker("kris", "pos1");
    var supos = scr_heromarker("susie", "pos1");
    var krdist = scr_returnwait_instance(kris, krpos[2], 6);
    var sudist = scr_returnwait_instance(susie, supos[2], 6);
    var camdist = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 4);
    var camdistret = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 4);
    c_pannable(1);
    c_pan(campos[0], campos[1], camdist);
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], krdist);
    c_delayfacing(krdist + 1, "u");
    c_sel(su);
    c_walkdirect(supos[0], supos[1], sudist);
    c_delayfacing(sudist + 1, "u");
    c_wait(max(sudist, krdist, camdist));
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Hey^1, Kris^1! Look^1, it's Ralsei^1, when we first met him!/", "obj_dw_churchb_library_slash_Step_0_gml_156_0");
    c_msgnextloc("\\ED* ..^1. Guess..^1. all three of us have our own prophecies^1, too./", "obj_dw_churchb_library_slash_Step_0_gml_157_0");
    c_msgnextloc("\\E0* If Ralsei's the lonely prince.../", "obj_dw_churchb_library_slash_Step_0_gml_158_0");
    c_msgnextloc("\\ED* ..^1. Wonder what we are...?/", "obj_dw_churchb_library_slash_Step_0_gml_159_0");
    c_msgnextloc("\\E9* C'mon^1, there's gotta be another one ahead!/%", "obj_dw_churchb_library_slash_Step_0_gml_160_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait_box(4);
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_panobj(kr_actor, camdistret);
    c_wait(camdistret);
    c_customfunc(function()
    {
        scr_caterpillar_interpolate("all");
        global.facing = 0;
    });
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (cutscene == 2 && !instance_exists(obj_cutscene_master))
{
    global.plot = 238;
    global.interact = 0;
    global.facing = 0;
    cutscene = 3;
}
var propactive = scr_trigcheck("propact");
roomglow.active = propactive;
with (obj_dw_church_prophecy)
    active = propactive;
scr_walkntalk_action();
var trigint = 0;
if (global.interact == 0)
{
    with (obj_trigger_interact)
    {
        if (extflag == "book" && myinteract == 3)
        {
            trigint = 1;
            myinteract = 0;
        }
    }
}
if (trigint == 1)
{
    if (myinteract == 0)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* It is a pile of particularly sturdy books./%", "obj_dw_churchb_library_slash_Step_0_gml_237_0");
        d_make();
        myinteract = 999;
    }
}
if (myinteract == 999 && !d_ex())
{
    myinteract = 0;
    global.interact = 0;
}
if (i_ex(npc1))
{
    with (npc1)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* We know nothing.\nWe understand..^1. nothing./%", "obj_dw_churchb_library_slash_Step_0_gml_260_0");
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract > 3 && d_ex())
        {
            var trig = 0;
            if (!i_ex(obj_writer))
                trig = 1;
            with (obj_writer)
            {
                if (halt)
                    trig = 1;
            }
            if (!trig)
                marker.image_index += 0.25;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            marker.image_index = 0;
            global.interact = 0;
        }
    }
}
if (i_ex(npc2))
{
    with (npc2)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* We know everything.\nWe understand everything./%", "obj_dw_churchb_library_slash_Step_0_gml_295_0");
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract > 3 && d_ex())
        {
            var trig = 0;
            if (!i_ex(obj_writer))
                trig = 1;
            with (obj_writer)
            {
                if (halt)
                    trig = 1;
            }
            if (!trig)
                marker.image_index += 0.25;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            marker.image_index = 0;
            global.interact = 0;
        }
    }
}
if (i_ex(npc3))
{
    with (npc3)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* I am the philosopher./", "obj_dw_churchb_library_slash_Step_0_gml_330_0");
            var line2 = stringsetloc("* You sought to return the dream./", "obj_dw_churchb_library_slash_Step_0_gml_331_0");
            if (talked)
                msgsetloc(0, "* You sought to return the dream./", "obj_dw_churchb_library_slash_Step_0_gml_335_0");
            else
                msgnext(line2);
            msgnextloc("* But the lighting of the mind has changed. At best you can only see another side./%", "obj_dw_churchb_library_slash_Step_0_gml_341_0");
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract > 3 && d_ex())
        {
            var trig = 0;
            if (!i_ex(obj_writer))
                trig = 1;
            with (obj_writer)
            {
                if (halt)
                    trig = 1;
            }
            if (!trig)
                marker.image_index += 0.25;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            marker.image_index = 0;
            global.interact = 0;
        }
    }
}
