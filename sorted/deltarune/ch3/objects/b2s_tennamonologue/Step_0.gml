scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        with (obj_board_trigger)
        {
            if (extflag == "b2s_tennamonologue")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                    other.con = 1;
            }
        }
    }
    if (con == 1)
    {
        global.flag[1058] = 1;
        scr_speaker("no_name");
        msgsetloc(0, "PHEW^1! FINALLY^1, SOME\nPEACE AND QUIET!/", "obj_b2s_tennamonologue_slash_Step_0_gml_29_0");
        msgnextloc("..^1. I WONDER…\nIF THEY EVEN \nLIKE THE GAME...?/", "obj_b2s_tennamonologue_slash_Step_0_gml_30_0");
        msgnextloc("I'M TRYING MY BEST\nTO MAKE IT FUN^1, BUT.../", "obj_b2s_tennamonologue_slash_Step_0_gml_31_0");
        msgnextloc("HERE AND THERE^1, \nSTRANGE THINGS ARE \nSHOWING THROUGH.../", "obj_b2s_tennamonologue_slash_Step_0_gml_32_0");
        msgnextloc("OH^1, WHY DID I BASE \nIT OFF THIS STUPID \nOLD THING!!/", "obj_b2s_tennamonologue_slash_Step_0_gml_33_0");
        msgnextloc("..^1. KRIS^1, OH^1, KRIS \nIF YOU COULD JUST \nSMILE..^1. LAUGH.../", "obj_b2s_tennamonologue_slash_Step_0_gml_34_0");
        msgnextloc("TELL ME I'M DOING \nSOMETHING RIGHT... \nPLEASE.../%", "obj_b2s_tennamonologue_slash_Step_0_gml_35_0");
        bw_make();
        global.interact = 1;
        con = 2;
    }
    if (con == 2 && !bw_ex())
    {
        kx = kris.x;
        ky = kris.y;
        global.interact = 0;
        con = 3;
    }
    if (con == 3)
    {
        if (kx != obj_mainchara_board.x || ky != obj_mainchara_board.y)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "WHAT THE? I HEAR \nFOOTSTEPS!/", "obj_b2s_tennamonologue_slash_Step_0_gml_54_0");
            msgnextloc("NO GOOD\nI NEED TO MAKE \nMY GETAWAY/%", "obj_b2s_tennamonologue_slash_Step_0_gml_55_0");
            bw_make();
            con = 4;
        }
    }
    if (con == 4 && !bw_ex())
    {
        snd_play_pitch(snd_board_escaped, 1.2);
        with (obj_board_marker)
        {
            if (sprite_index == spr_board_npc_tenna_back)
                instance_destroy();
        }
        global.interact = 0;
        con++;
    }
}
else
{
}
