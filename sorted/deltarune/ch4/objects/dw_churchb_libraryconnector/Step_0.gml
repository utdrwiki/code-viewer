if (!init)
{
    var pos = scr_heromarker(undefined, "prop1");
    prophecy1 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy1.extflag = "heroes3";
    pos = scr_heromarker(undefined, "prop2");
    prophecy2 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy2.extflag = "heroes4";
    pos = scr_heromarker(undefined, "prop3");
    prophecy3 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy3.extflag = "rudebuster";
    roomglow = instance_create(0, 0, obj_roomglow);
    var makeglow = [];
    with (npc1)
        marker.sprite_index = spr_npc_organik_2_talk;
    with (npc3)
    {
        marker.sprite_index = spr_npc_organik_0_talk;
        array_push(makeglow, marker);
    }
    with (npc4)
    {
        marker.sprite_index = spr_npc_organik_1_talk;
        array_push(makeglow, marker);
    }
    if (array_length(makeglow) > 0)
    {
        with (roomglow)
        {
            for (var i = 0; i < array_length(makeglow); i++)
                create_highlight(makeglow[i], undefined, undefined, -18);
        }
    }
    if (global.tempflag[90] == 1)
    {
        pos = scr_heromarker("kris", "warp1");
        setxy(pos[0], pos[1], 1049);
        setxy(pos[0], pos[1], 1235);
        global.facing = pos[2].image_index;
        global.tempflag[90] = 0;
        global.plot = 238;
        scr_caterpillar_interpolate("all");
    }
    if (global.tempflag[90] == 2)
    {
        pos = scr_heromarker("kris", "warp2");
        setxy(pos[0], pos[1], 1049);
        setxy(pos[0], pos[1], 1235);
        global.facing = pos[2].image_index;
        global.tempflag[90] = 0;
        scr_caterpillar_interpolate("all");
    }
    init = 1;
}
if (global.fighting == true)
    didfight = true;
scr_populatechars();
var propactive = scr_trigcheck("propact");
roomglow.active = propactive;
with (obj_dw_church_prophecy)
    active = propactive;
if (cutscene == 0)
{
    global.plot = max(global.plot, 238.1);
    cutscene = 3;
}
if (cutscene == 1)
{
}
if (cutscene == 3)
{
    if (scr_trigcheck("cut2"))
    {
        cutscene++;
        global.interact = 1;
    }
}
if (cutscene == 4)
{
    cutscene++;
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
    var campos = scr_heromarker(undefined, "cut2");
    var krpos = scr_heromarker("kris", "cut2");
    var supos = scr_heromarker("susie", "cut2");
    var krdist = scr_returnwait_instance(kris, krpos[2], 6);
    var sudist = scr_returnwait_instance(susie, supos[2], 6);
    var walkdist = max(krdist, sudist);
    var camdist = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 6);
    var camdistret = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 8);
    c_pannable(1);
    c_pan(campos[0], campos[1], camdist);
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], walkdist);
    c_delayfacing(walkdist + 1, "u");
    c_sel(su);
    c_walkdirect(supos[0], supos[1], walkdist);
    c_delayfacing(walkdist + 1, "u");
    c_wait(max(sudist, krdist, camdist));
    c_wait(30);
    c_speaker("susie");
    c_msgside("bottom");
    c_msgsetloc(0, "\\E7* Hey^1, this has gotta be you...!/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_333_0");
    c_msgnextloc("\\EK* ..^1. weird illustration^1, though./", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_334_0");
    c_msgnextloc("\\E6* Plus^1, why's it calling you a \"cage\"...?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_335_0");
    c_msgnextloc("\\EQ* Shouldn't you be something more like.../", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_336_0");
    c_msgnextloc("\\EA* \"The cool\"? Then for the picture^1, they can like.../", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_339_0");
    if (global.flag[701])
        c_msgnextloc("\\E9* Use my drawing where you're saying \"Susie rulez\". Heh./%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_343_0");
    else
        c_msgnextloc("\\E2* Show you^1, like^1, doing a flip or something. Heh./%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_347_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_up_look_left);
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_up_look_left);
    c_wait_box(5);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait_talk();
    c_sel(su);
    c_facing("u");
    c_panobj(kr_actor, camdistret);
    c_wait(camdistret);
    c_customfunc(function()
    {
        scr_caterpillar_interpolate("all");
        global.facing = 2;
    });
    c_wait(1);
    c_actortokris();
    c_actortocaterpillar();
    c_pannable(0);
    c_terminatekillactors();
}
if (cutscene == 5 && !instance_exists(obj_cutscene_master))
{
    global.facing = 0;
    global.plot = 238.2;
    global.interact = 0;
    cutscene++;
}
if (cutscene == 6)
{
    if (scr_trigcheck("cut3"))
    {
        cutscene++;
        global.interact = 1;
    }
}
if (cutscene == 7)
{
    cutscene++;
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
    var campos = scr_heromarker(undefined, "cut3");
    var krpos = scr_heromarker("kris", "cut3");
    var supos = scr_heromarker("susie", "cut3");
    var krdist = scr_returnwait_instance(kris, krpos[2], 6);
    var sudist = scr_returnwait_instance(susie, supos[2], 6);
    var walkdist = max(krdist, sudist);
    var camdist = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 6);
    var camdistret = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 6);
    c_pannable(1);
    c_pan(campos[0], campos[1], camdist);
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], walkdist);
    c_delayfacing(walkdist + 1, "u");
    c_sel(su);
    c_walkdirect(supos[0], supos[1], walkdist);
    c_delayfacing(walkdist + 1, "u");
    c_wait(max(sudist, krdist, camdist));
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. The girl.../", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_449_0");
    c_msgnextloc("\\ET* You think that..^1. means me?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_450_0");
    c_msgnextloc("\\ED* Like^1, my prophecy's next.../", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_451_0");
    c_msgnextloc("\\EN* ..^1. heh^1, I..^1. I wonder what it says./", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_452_0");
    c_msgnextloc("\\E2* C'mon./%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_453_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_up_look_right);
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
if (cutscene == 8 && !instance_exists(obj_cutscene_master))
{
    global.plot = 238.3;
    global.interact = 0;
    global.facing = 0;
    cutscene++;
}
if (econ == 0)
{
    if (scr_trigcheck("angy"))
    {
        econ = 1;
        var enemy = instance_create(npc2.x, npc2.y, obj_dw_church_organikchaser);
        enemy.encounterflag = encounterflag;
        enemy.encounterno = encounterno;
        safe_delete(npc2);
    }
}
if (econ == 1)
{
    if (didfight)
        econ = 40;
    var resetbaddy = false;
    with (obj_solidenemy)
    {
        if (place_meeting(x, y, obj_mainchara))
            resetbaddy = true;
    }
    if (resetbaddy == true)
    {
        with (obj_dw_church_organikchaser)
        {
            scr_afterimage();
            instance_destroy();
        }
        econ = 0;
        var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 4929)
                npc2 = scr_marker_fromasset(spritesArray[i], undefined, 1);
        }
    }
}
if (econ == 40)
{
    if (global.fighting)
    {
        if (global.flag[encounterflag] == 1)
        {
            safe_delete(npc1.marker);
            safe_delete(npc1);
            safe_delete(npc2);
            safe_delete(npc3.marker);
            safe_delete(npc3);
            safe_delete(npc4.marker);
            safe_delete(npc4);
            safe_delete(npc_wing.marker);
            safe_delete(npc_wing);
            econ = 2;
        }
    }
}
with (npc_wing)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* I heard there's something inside the acorn./", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_577_0");
        msgnextloc("* But I don't know where to find an acorn./", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_578_0");
        msgnextloc("* Or even what one is in the first place./%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_579_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* We must find a way./", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_583_0");
            msgnextloc("* We must find a way to use alchemy to make this acorn./%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_584_0");
        }
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
var notalking = false;
if (instance_exists(obj_dw_church_organikchaser) || instance_exists(obj_chaseenemy) || global.fighting)
    notalking = true;
if (ccon == 0)
{
    if (notalking)
    {
        with (npc1)
            myinteract = 0;
        with (npc3)
            myinteract = 0;
        with (npc4)
            myinteract = 0;
    }
    var trig = 0;
    with (npc1)
    {
        if (myinteract == 3)
            trig = 1;
    }
    with (npc3)
    {
        if (myinteract == 3)
            trig = 1;
    }
    with (npc4)
    {
        if (myinteract == 3)
            trig = 1;
    }
    if (trig)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Whose dream is this?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_633_0");
        msgnextloc("* Kris's dream?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_634_0");
        msgnextloc("* Susie's dream?/%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_635_0");
        if (talked == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Whose dream is this?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_640_0");
            msgnextloc("* Knight's dream?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_641_0");
            msgnextloc("* My dream?/%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_642_0");
        }
        if (talked > 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Whose dream is this?/", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_647_0");
            msgnextloc("* ..^1. you left it here./%", "obj_dw_churchb_libraryconnector_slash_Step_0_gml_648_0");
        }
        d_make();
        talked++;
        ccon = 1;
    }
}
if (ccon == 1 && d_ex())
{
    with (npc1)
    {
        if (myinteract >= 3)
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
    }
    with (npc3)
    {
        if (myinteract >= 3)
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
    }
    with (npc4)
    {
        if (myinteract >= 3)
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
    }
}
if (ccon == 1 && !d_ex())
{
    with (npc1)
    {
        myinteract = 0;
        marker.image_index = 0;
    }
    with (npc3)
    {
        myinteract = 0;
        marker.image_index = 0;
    }
    with (npc4)
    {
        myinteract = 0;
        marker.image_index = 0;
    }
    ccon = 0;
    global.interact = 0;
}
