if (npctext == 0)
{
    with (obj_trigger)
    {
        if (extflag == "climbed")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                other.npctext = 1;
                other.helpnpctalked = 0;
            }
        }
    }
}
if (npctext < 2)
{
    with (obj_trigger)
    {
        if (extflag == "topreached")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                other.npctext = 2;
                other.helpnpctalked = 0;
            }
        }
    }
}
with (helpnpc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Well hey dere^1! If you want to continue^1, you'll have ta climb!/%", "obj_dw_church_climbtut_slash_Step_0_gml_33_0");
        if (other.helpnpctalked > 0)
            msgsetsubloc(0, "* You can climb by holdin' ~1 when near a climbable area!/%", scr_get_input_name(2), "obj_dw_church_climbtut_slash_Step_0_gml_37_0");
        if (other.npctext == 1)
        {
            msgsetsubloc(0, "* Did ya get stuck? Hold ~1 to charge up a jump to leap across an area!/%", scr_get_input_name(4), "obj_dw_church_climbtut_slash_Step_0_gml_42_0");
            if (other.helpnpctalked > 0)
                msgsetsubloc(0, "* You can hold ~1 to charge up a jump to leap across an area!/%", scr_get_input_name(4), "obj_dw_church_climbtut_slash_Step_0_gml_46_0");
        }
        if (other.npctext == 2)
        {
            msgsetloc(0, "* That was a mighty fine leap y'did there!/", "obj_dw_church_climbtut_slash_Step_0_gml_52_0");
            msgnextloc("* Don't forget that you can jump up to two spaces using a charged jump!/%", "obj_dw_church_climbtut_slash_Step_0_gml_53_0");
            if (other.helpnpctalked > 0)
                msgsetloc(0, "* A real pro strat is to use the momentum to help you cross even faster!/%", "obj_dw_church_climbtut_slash_Step_0_gml_57_0");
        }
        other.helpnpctalked++;
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
        global.interact = 0;
}
