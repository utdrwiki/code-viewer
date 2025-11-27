with (behindshelf)
{
    if (i_ex(obj_dw_bluebook))
        myinteract = 0;
    if (myinteract == 3)
    {
        global.interact = 1;
        if (!talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You check the bookshelf..^1. huh? There's a book here!)/", "obj_dw_church_biblioxencounter_slash_Step_0_gml_14_0");
            msgnextloc("* (Actually^1, there are many books here.)/", "obj_dw_church_biblioxencounter_slash_Step_0_gml_15_0");
            msgnextloc("* (And^1, just generally around the room.)/", "obj_dw_church_biblioxencounter_slash_Step_0_gml_16_0");
            msgnextloc("* (Usually^1, you don't pay attention to them.)/", "obj_dw_church_biblioxencounter_slash_Step_0_gml_17_0");
            msgnextloc("* (This time^1, you did. That's all.)/%", "obj_dw_church_biblioxencounter_slash_Step_0_gml_18_0");
        }
        else
        {
            var small_text_a = stringsetloc("Yes, Kris! It's a book!", "obj_dw_church_biblioxencounter_slash_Step_0_gml_22_0");
            var small_text_b = stringsetloc("The hell are you so excited about?", "obj_dw_church_biblioxencounter_slash_Step_0_gml_23_0");
            var loc0 = [130, 34];
            var loc1 = [290, 70];
            if (global.lang == "ja")
            {
                loc0 = [70, 34];
                loc1 = [230, 70];
            }
            scr_smallface(0, "ralsei", 17, loc0[0], loc0[1], small_text_a);
            scr_smallface(1, "susie", 3, loc1[0], loc1[1], small_text_b);
            scr_speaker("noone");
            msgsetloc(0, "* (There's a book here!!!)\\f0\\f1/%", "obj_dw_church_biblioxencounter_slash_Step_0_gml_25_0");
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
