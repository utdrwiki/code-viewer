if (!init)
    init = 1;
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("1")))
    {
        var pos = scr_heromarker("kris", "holywaterexit");
        setxy(pos[0], pos[1], 1049);
    }
}
with (npc)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        if (global.flag[other.encounterflag] == 0)
        {
            if (!talked)
            {
                msgsetloc(0, "* Above she waits^1, our beloved Holiness..^1. Surely pining for the salvation of a great hero./", "obj_dw_church_holywatercooler_slash_Step_0_gml_32_0");
                msgnextloc("* But^1, our legs^1, small and sweaty in excitement^1, find no hold in this accursed wall^1,/", "obj_dw_church_holywatercooler_slash_Step_0_gml_33_0");
                msgnextloc("* And so we fall^1, tumbling a'gain and a'gain./%", "obj_dw_church_holywatercooler_slash_Step_0_gml_34_0");
            }
            else
            {
                msgsetloc(0, "* Doomed are we^1, who thirst for love just out of reach!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_38_0");
            }
        }
        else if (global.flag[other.encounterflag] == 1)
        {
            msgsetloc(0, "* Artless^1, heartless^1, and a blasphemer are you!/", "obj_dw_church_holywatercooler_slash_Step_0_gml_43_0");
            msgnextloc("* When you drink^1, let the last drop taunt you everlasting!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_44_0");
        }
        else
        {
            msgsetloc(0, "* Blessed are you^1, who walks with our Lady!/", "obj_dw_church_holywatercooler_slash_Step_0_gml_48_0");
            msgnextloc("* And blessed be your legs^1, for they have nary a bead of sweat./%", "obj_dw_church_holywatercooler_slash_Step_0_gml_49_0");
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
with (npc2)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        if (global.flag[other.encounterflag] == 0)
        {
            if (!talked)
            {
                msgsetloc(0, "* Oh^1, Holy Princess far above^1! If you would spare but a drop of your love.../", "obj_dw_church_holywatercooler_slash_Step_0_gml_79_0");
                msgnextloc("* I promise I should never spill it^1,/", "obj_dw_church_holywatercooler_slash_Step_0_gml_80_0");
                msgnextloc("* Or mix it with powders to modify its flavor./%", "obj_dw_church_holywatercooler_slash_Step_0_gml_81_0");
            }
            else
            {
                msgsetloc(0, "* Excepting^1, of course^1, such flavors of sweet Lemon and Orange^1,/", "obj_dw_church_holywatercooler_slash_Step_0_gml_85_0");
                msgnextloc("* Which are clean to the taste and invigorate the Humours./%", "obj_dw_church_holywatercooler_slash_Step_0_gml_86_0");
            }
        }
        else if (global.flag[other.encounterflag] == 1)
        {
            msgsetloc(0, "* Oh^1, I heard it^1! The clash!/", "obj_dw_church_holywatercooler_slash_Step_0_gml_91_0");
            msgnextloc("* You brute.../", "obj_dw_church_holywatercooler_slash_Step_0_gml_92_0");
            msgnextloc("* May your powders be acrid^1, green^1, and ectoplasmic!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_93_0");
        }
        else
        {
            msgsetloc(0, "* To think our Holy Princess would join your court..^1. oh^1, joy!/", "obj_dw_church_holywatercooler_slash_Step_0_gml_97_0");
            msgnextloc("* I shall rejoice^1, and throw my greatest powders.../", "obj_dw_church_holywatercooler_slash_Step_0_gml_98_0");
            msgnextloc("* Electrolytic^1, and few in calorie!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_99_0");
        }
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
with (npc3)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        if (global.flag[other.encounterflag] == 0)
        {
            if (!talked)
            {
                msgsetloc(0, "* Ah^1, my legs^1! So they tremble^1, I'm afeared I cannot clamber any further./", "obj_dw_church_holywatercooler_slash_Step_0_gml_130_0");
                msgnextloc("* Young soldier^1, if you should meet her^1, could you tell her of my exploits.../", "obj_dw_church_holywatercooler_slash_Step_0_gml_131_0");
                msgnextloc("* That I may earn so much as a small thimble of her love./%", "obj_dw_church_holywatercooler_slash_Step_0_gml_132_0");
            }
            else
            {
                msgsetloc(0, "* Go on^1, young soldier^1! I am but too sweaty to continue.../%", "obj_dw_church_holywatercooler_slash_Step_0_gml_136_0");
            }
        }
        else if (global.flag[other.encounterflag] == 1)
        {
            if (!talked)
            {
                msgsetloc(0, "* You brute...^1! You coward...!/", "obj_dw_church_holywatercooler_slash_Step_0_gml_143_0");
                msgnextloc("* Spilling a woman's tears..^1. you have no sense of water conservation!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_144_0");
            }
            else
            {
                msgsetloc(0, "* I should knock you^1, if my legs were not so sweaty and small!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_148_0");
            }
        }
        else if (!talked)
        {
            msgsetloc(0, "* Oh^1, so you found her^1! Did she have any extra thimbles of her love?/", "obj_dw_church_holywatercooler_slash_Step_0_gml_155_0");
            msgnextloc("* No...? Well^1, I hope she knows I could have also recruited her.../", "obj_dw_church_holywatercooler_slash_Step_0_gml_156_0");
            msgnextloc("* ..^1. If I had just climbed up there..^1. you see./%", "obj_dw_church_holywatercooler_slash_Step_0_gml_157_0");
        }
        else
        {
            msgsetloc(0, "* ..^1. well done and all that!/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_161_0");
        }
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
with (npc4)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a regular container of water.)/", "obj_dw_church_holywatercooler_slash_Step_0_gml_205_0");
        msgnextloc("* (..^1. There's no reason to expect interacting with it to do anything.)/%", "obj_dw_church_holywatercooler_slash_Step_0_gml_206_0");
        d_make();
        other.basintalk = true;
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        myinteract = 0;
    }
}
if (watercoolerfight == 0)
{
    var trig = 0;
    if (basintalk && !d_ex())
    {
        with (obj_trigger)
        {
            if (extflag == "watercoolertrig")
            {
                if (place_meeting(x, y, obj_mainchara))
                    trig = 1;
            }
        }
    }
    if (trig)
    {
        npc4.myinteract = 99;
        watercoolerfight = 1;
        watermarker = scr_marker_ext(camerax() + 640 + 120, obj_mainchara.y - 12, spr_watercooler, 2, 2, 0, undefined, undefined, 5000);
        with (watermarker)
        {
            con = 0;
            hsp = -0.25;
        }
    }
}
if (watercoolerfight == 1)
{
    with (watermarker)
    {
        if (con == 0)
        {
            if (global.interact == 0)
            {
                hsp = lerp(hsp, -24, 0.16666666666666666);
                x += hsp;
            }
        }
    }
    var trig = 0;
    watermarker.y = scr_even(obj_mainchara.y - 12);
    with (watermarker)
    {
        if (place_meeting(x, y, obj_mainchara))
            trig = 1;
    }
    if (trig)
    {
        global.interact = 1;
        global.facing = 1;
        with (watermarker)
        {
            con = 1;
            hspeed = 0;
            scr_lerpvar("x", x, obj_mainchara.x + 80, 10, -1, "out");
        }
        npc4.myinteract = 9999;
        npc3.talked = 0;
        npc2.talked = 0;
        npc.talked = 0;
        watercoolerfight = 2;
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
        scr_delay_var("watercoolerfight", 3, 24);
    }
}
if (watercoolerfight == 3)
{
    global.flag[54] = encounterflag;
    scr_battle(183, 0, watermarker);
    watermarker = 0;
    watercoolerfight++;
}
if (watercoolerfight == 4 && !i_ex(obj_battleback))
{
    scr_tempsave();
    watercoolerfight++;
}
if (hintinit == 0)
{
    if (global.flag[encounterflag] != 0)
    {
        hintinit = 1;
        debug_message("battle completed");
        alarm[0] = 1;
    }
}
if (slidecon == 0)
{
    if (scr_trigcheck("slideEnter"))
    {
        global.interact = 1;
        slidetimer = 0;
        slidecon = 1;
        obj_mainchara.cutscene = 1;
        fade = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, undefined, c_black, -99, undefined, undefined, 0);
        with (fade)
        {
            extflag = "fade";
            scr_lerpvar("image_alpha", 0, 1, 15);
        }
    }
}
if (slidecon == 1)
{
    slidetimer++;
    if (slidetimer == 16)
    {
        camera_setxy(1459, 3268);
        obj_mainchara.y = 3080;
        with (fade)
        {
            scr_lerpvar("image_alpha", 1.25, 0, 18);
            scr_doom(id, 19);
        }
        fade = -4;
    }
    if (slidetimer > 16)
    {
        if (global.interact == 0)
        {
            global.facing = 0;
            obj_mainchara.cutscene = 0;
            slidecon = 0;
            slidetimer = 0;
        }
    }
}
