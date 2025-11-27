function scr_roomname(arg0)
{
    roomname = stringsetloc("Dark World?", "scr_roomname_slash_scr_roomname_gml_1_0");
    if (arg0 == 0)
        roomname = stringsetloc("---", "scr_roomname_slash_scr_roomname_gml_2_0");
    if (arg0 == 98)
        roomname = stringsetloc("Dark World", "scr_roomname_slash_scr_roomname_gml_4_0");
    if (arg0 == 135)
        roomname = stringsetloc("Green Room", "scr_roomname_slash_scr_roomname_gml_6_0_b");
    if (arg0 == 194)
        roomname = stringsetloc("TV World - Before the Show", "scr_roomname_slash_scr_roomname_gml_7_0");
    if (arg0 == 109)
        roomname = stringsetloc("Cold Place", "scr_roomname_slash_scr_roomname_gml_8_0");
    if (arg0 == 195)
        roomname = stringsetloc("TV World - Entrance", "scr_roomname_slash_scr_roomname_gml_8_0_b");
    if (arg0 == 177)
        roomname = stringsetloc("TV World - Goulden Sam", "scr_roomname_slash_scr_roomname_gml_9_0_b");
    if (arg0 == 208)
        roomname = stringsetloc("TV World - Concert", "scr_roomname_slash_scr_roomname_gml_9_0");
    if (arg0 == 213)
        roomname = stringsetloc("TV World - Cooking Show", "scr_roomname_slash_scr_roomname_gml_11_0");
    return roomname;
}
