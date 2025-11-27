if (doorinit == 0)
{
    with (obj_doorAny)
    {
        if (doorRoom == room_dw_church_pianopiece_left)
        {
            doorRoom = room_dw_church_pianopiece_left_b;
            other.doorinit = 1;
        }
    }
}
if (global.plot >= 242)
{
    with (cup)
    {
        if (global.fighting)
            myinteract = 0;
        marker.image_index += 0.25;
        if (myinteract == 3)
        {
            global.interact = 1;
            var gerstate = 0;
            if (global.flag[851] > 0)
                gerstate = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* O^1, there once was a great fortepiano up above^1! How it sang in gold.../", "obj_dw_church_tallbookcases_slash_Step_0_gml_39_0");
            msgnextloc("* Until the Grand Door opened^1, releasing a cacophony of ancient witches./", "obj_dw_church_tallbookcases_slash_Step_0_gml_40_0");
            var nextline = stringsetloc("* They did away with its fine timbres..^1. leaving naught but dissonance./", "obj_dw_church_tallbookcases_slash_Step_0_gml_41_0");
            if (gerstate == 0)
                msgnext(nextline + "%");
            if (gerstate == 1)
            {
                msgnext(nextline);
                msgnextloc("* But^1, Warriors^1! I heard rumor you did solve \\cYthe piano's mystery\\cW./", "obj_dw_church_tallbookcases_slash_Step_0_gml_50_0");
                msgnextloc("* Though the piano be gone^1, its song may play on in our hearts.../%", "obj_dw_church_tallbookcases_slash_Step_0_gml_51_0");
            }
            if (talked)
            {
                if (gerstate == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* O^1, that \\cYthe mystery of the piano\\cW was not solved!/", "obj_dw_church_tallbookcases_slash_Step_0_gml_59_0");
                    msgnextloc("* And now..^1. \\cRit shall never be\\cW./%", "obj_dw_church_tallbookcases_slash_Step_0_gml_60_0");
                }
                if (gerstate == 1)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* O^1, the Pianosong^1, it plays on in my heart./", "obj_dw_church_tallbookcases_slash_Step_0_gml_65_0");
                    msgnextloc("* Duh duh duh^1, doo doo doo^1, dee dee dah..^1. and stuffs./%", "obj_dw_church_tallbookcases_slash_Step_0_gml_66_0");
                }
            }
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            global.interact = 0;
        }
    }
}
if (gueicheck == true)
{
    if (gueitoskip == -1)
    {
        var ent1 = -4;
        var ent3 = -4;
        var ent4 = -4;
        var ent14 = -4;
        with (obj_markerAny)
        {
            if (image_index == 1)
                ent1 = id;
            if (image_index == 3)
                ent3 = id;
            if (image_index == 4)
                ent4 = id;
            if (image_index == 14)
                ent14 = id;
        }
        if (i_ex(obj_climb_kris))
        {
            gueitoskip = 4;
        }
        else
        {
            if (scr_checklocation(1049, ent1.x, ent1.y, 40))
                gueitoskip = 2;
            if (scr_checklocation(1049, ent3.x, ent3.y, 40))
                gueitoskip = 2;
            if (scr_checklocation(1049, ent4.x, ent4.y, 40))
                gueitoskip = 0;
            if (scr_checklocation(1049, ent14.x, ent14.y, 40))
                gueitoskip = 4;
        }
        if (gueitoskip == -1)
            gueitoskip = -2;
        printval("gueitoskip");
    }
    var version = 0;
    if (global.flag[encounterflag] != 0)
        version = 1;
    var gueicount = 5;
    if (version == 1)
    {
        depth = 96340;
        gueicount = 3;
        gueitoskip = 99;
    }
    var xspace = 320;
    if (con == 0)
    {
        if (global.interact == 0)
        {
            for (var i = 0; i < gueicount; i++)
            {
                var side = 1;
                if ((i % 2) == 0)
                    side = -1;
                var yloc = 382;
                var range = 140;
                var bonusspace = 0;
                if (version == 1)
                {
                    yloc -= 48;
                    range = 60;
                    if (i == 2)
                        bonusspace = 320;
                    movespeed = 15;
                }
                var xloc = 320 + (sin(siner / movespeed) * range * side) + (xspace * i) + bonusspace;
                if (i != gueitoskip)
                {
                    var docats = false;
                    var gotem = false;
                    if (i_ex(collision_rectangle(xloc - 10, yloc - 8, xloc + 10, yloc + 20, obj_mainchara, 0, true)))
                        gotem = true;
                    if (docats)
                    {
                        if (i_ex(collision_rectangle(xloc - 10, yloc - 8, xloc + 10, yloc + 20, obj_caterpillarchara, 0, true)))
                            gotem = true;
                    }
                    if (gotem)
                    {
                        dontdraw = i;
                        chaser = scr_marker_ext(xloc, yloc, spr_guei_chase, 2, 2, 0);
                        chaser.alpha = 1;
                        chaser.image_alpha = 0;
                        snd_play(snd_cough, 1, 1.4);
                        snd_play(snd_paper_rise, 0.7, 1.2);
                        snd_play(snd_paper_rise, 0.4, 1.8);
                        snd_play(snd_ghostappear, undefined, 1.6);
                        global.interact = 1;
                        speed = 0;
                        other.con = 2;
                        with (chaser)
                            scr_lerpvar("x", x, obj_mainchara.x + 80, 20, 4, "out");
                        with (chaser)
                            scr_lerpvar("y", y, obj_mainchara.y - 40 - 12, 20, 2, "out");
                    }
                }
            }
        }
    }
    if (con == 2)
    {
        timer++;
        if (timer == 1)
            scr_lerpvar("image_alpha", image_alpha, -1.35, 20, 2, "in");
        if (timer > 1 && chaser.x > obj_mainchara.x)
            global.facing = 1;
        if (timer == 35)
        {
            snd_play(snd_tensionhorn);
            snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
        }
        if (timer == 59)
        {
            chaser.image_alpha = 1;
            chaser.depth = 500;
            global.flag[54] = encounterflag;
            scr_battle(encounterno, 0, chaser);
            con = 3;
            scr_var_delay("guiecheck", false, 120);
        }
    }
}
