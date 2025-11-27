if (triginit == 0)
{
    with (obj_trigger)
    {
        if (extflag == "starttrig")
            other.wallswitch = scr_marker_ext(x, y, spr_dw_church_climb_wallswitch, 2, 2, 0, undefined, undefined, 99990);
    }
    with (obj_climb_destructableclimbarea)
    {
        array_push(other.destructableblockpos, [x, y, sprite]);
        safe_delete(climbarea);
        instance_destroy();
    }
    with (obj_climb_watergenerator)
    {
        if (!place_meeting(x, y, obj_floorTrigger))
        {
            array_push(other.water, id);
            remote = true;
            activetime = 30;
            watermoverate = 3;
        }
    }
    with (obj_floorTrigger)
        instance_destroy();
    array_sort(water, compare_by_x);
    triginit = 1;
}
scr_populatechars();
if (!init)
{
    with (obj_roomglow)
    {
        create_highlight(obj_treasure_room, true, true, -12);
        create_highlight(obj_climb_mover, true, false);
        create_highlight(other.wallswitch, true, false);
    }
    var prop = scr_genmarker("prop1");
    with (instance_create(prop.x + 150, prop.y + 90, obj_dw_church_prophecy))
    {
        extflag = "heavenandhell1";
        fade_edges = true;
    }
    prop = scr_genmarker("prop2");
    with (instance_create(prop.x + 150, prop.y + 90, obj_dw_church_prophecy))
    {
        extflag = "heavenandhell2";
        fade_edges = true;
    }
    prop = scr_genmarker("prop3");
    with (instance_create(prop.x + 150, prop.y + 90, obj_dw_church_prophecy))
    {
        extflag = "joke1";
        fade_edges = true;
    }
    with (roomglow)
        create_highlight(other.npc.marker, true, true, -16);
    init = 1;
}
if (con == 0)
{
    with (obj_climb_kris)
    {
        if (y >= (room_height + 40))
        {
            var proceed = 0;
            var mytrig = instance_place(x, y, obj_trigger);
            if (i_ex(mytrig))
            {
                proceed = 1;
                if (mytrig.extflag == "return")
                {
                    global.flag[1611] = 1;
                    proceed = 2;
                }
            }
            if (proceed == 0)
            {
                var pos = scr_heromarker("kris", "loc1_fall");
                setxy(pos[0], pos[1]);
            }
            if (proceed == 1)
            {
                other.timer = 0;
                other.con = 1;
            }
            if (proceed == 2)
            {
                other.timer = 0;
                other.con = 5;
            }
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, undefined, c_black, -99))
        {
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 15);
            extflag = "fade";
        }
    }
    if (timer == 16)
    {
        var pos = scr_heromarker("kris", "loc3_fall");
        setxy(pos[0], pos[1], 27);
    }
    if (timer == 24)
    {
        with (obj_marker)
        {
            if (variable_instance_exists(id, "extflag"))
            {
                if (extflag == "fade")
                {
                    scr_lerpvar("image_alpha", 1, 0, 15);
                    scr_doom(id, 15);
                }
            }
        }
        con = 0;
    }
}
if (con == 5)
{
    timer++;
    if (timer == 1)
    {
        with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, undefined, c_black, -99))
        {
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 8);
            extflag = "fade";
        }
    }
    if (timer == 9)
    {
        var pos = scr_heromarker("kris", "loc1_fall_notransition");
        setxy(pos[0], pos[1], 27);
    }
    if (timer == 17)
    {
        with (obj_marker)
        {
            if (variable_instance_exists(id, "extflag"))
            {
                if (extflag == "fade")
                {
                    scr_lerpvar("image_alpha", 1, 0, 8);
                    scr_doom(id, 8);
                }
            }
        }
        con = 0;
    }
}
var propact = scr_trigcheck("proptrig");
roomglow.active = propact;
with (obj_dw_church_prophecy)
    active = propact;
with (npc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Before the clock strikes midnight^1, the shadow will grow!/", "obj_dw_churchc_prophecies_slash_Step_0_gml_209_0");
        msgnextloc("* O^1, the shadow will grow^1, serpentine!/%", "obj_dw_churchc_prophecies_slash_Step_0_gml_210_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Even when the clock ran back^1, the shadow was growing!/", "obj_dw_churchc_prophecies_slash_Step_0_gml_215_0");
            msgnextloc("* A patch of shadow^1, slithering on^1, slithering on^1, serpentine!/", "obj_dw_churchc_prophecies_slash_Step_0_gml_216_0");
            msgnextloc("* ..^1. So sayeth our ancestors. Crazy fellows^1, the lot!/%", "obj_dw_churchc_prophecies_slash_Step_0_gml_217_0");
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
if (climbcon == 0)
{
    if (scr_trigcheck_ext("starttrig", 27))
    {
        climbcon = 1;
        var snd = snd_play_complex(0, 0, -1);
        snd_add_complex(snd, 0, 267, 0.85, 1, 0, -1, 0);
        snd_add_complex(snd, 1, 336, 1.3, 1, 0, -1, 0);
        with (obj_climb_destructableclimbarea)
        {
            safe_delete(climbarea);
            instance_destroy();
        }
        for (var i = 0; i < array_length(destructableblockpos); i++)
        {
            var block = instance_create(destructableblockpos[i][0], destructableblockpos[i][1], obj_climb_destructableclimbarea);
            block.sprite_index = spr_dw_church_climb_brittle;
            with (block)
            {
                dangerous = true;
                dangertime = 60;
                var lifetime = i + 4;
                image_alpha = 0;
                scr_lerpvar("image_alpha", image_alpha, 1, lifetime, -1, "out");
                with (scr_oflash_ext(undefined, undefined, undefined, undefined, 2, 2, undefined, -1, 1, 15381248))
                {
                    scr_lerpvar("image_alpha", 1, 0, lifetime, 2, "out");
                    scr_lerp_imageblend(id, image_blend, c_white, lifetime);
                }
            }
        }
    }
}
wallswitch.image_index = 0;
if (climbcon == 1)
{
    wallswitch.image_index = 1;
    if (!scr_trigcheck_ext("starttrig", 27))
        climbcon = 0;
}
if (i_ex(obj_climb_kris))
{
    if (scr_trigcheck_ext("resetmover", 27))
    {
        with (obj_climb_mover)
        {
            if (!scr_checklocation(undefined, xstart, ystart, 4))
            {
                debug_print("move me!");
                setxy(xstart, ystart);
            }
        }
    }
    if (scr_trigcheck_ext("watertelegraph", 27))
        water[0].makewater = 7;
    if (scr_trigcheck_ext("waterstart", 27))
    {
        var count = 0;
        water[count].makewater = 2;
        count++;
        water[count].makewater = 11;
        count++;
        water[count].makewater = 20;
        count++;
        water[count].makewater = 40;
        count++;
        water[count].makewater = 49;
        count++;
        water[count].makewater = 58;
        count++;
        water[count].makewater = 78;
        count++;
        water[count].makewater = 86;
        count++;
        water[count].makewater = 94;
        count++;
        water[count].makewater = 114;
        count++;
        water[count].makewater = 122;
        count++;
        water[count].makewater = 140;
        count++;
        water[count].makewater = 148;
        count++;
        water[count].makewater = 168;
        count++;
        water[count].makewater = 188;
        count++;
        water[count].makewater = 220;
        count++;
    }
}
