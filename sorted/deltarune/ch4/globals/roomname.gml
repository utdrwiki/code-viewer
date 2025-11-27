function scr_roomname(arg0)
{
    roomname = stringsetloc("Dark World?", "scr_roomname_slash_scr_roomname_gml_1_0");
    if (arg0 == 0)
        roomname = stringsetloc("---", "scr_roomname_slash_scr_roomname_gml_2_0");
    if (arg0 == 15)
        roomname = stringsetloc("Kris's Room", "scr_roomname_slash_scr_roomname_gml_4_0_b");
    if (arg0 == 24)
        roomname = stringsetloc("Hometown", "scr_roomname_slash_scr_roomname_gml_5_0_b");
    if (arg0 == 49)
        roomname = stringsetloc("Noelle's House", "scr_roomname_slash_scr_roomname_gml_6_0");
    if (arg0 == 65)
        roomname = stringsetloc("My Castle Town", "scr_roomname_slash_scr_roomname_gml_5_0");
    var church_name_a = stringsetloc("Dark Sanctuary", "scr_roomname_slash_scr_roomname_gml_7_0_b");
    if (arg0 == 108)
        roomname = stringsetsubloc("~1 - Atrium", church_name_a, "scr_roomname_slash_scr_roomname_gml_8_0_c");
    if (arg0 == 177)
        roomname = stringsetsubloc("~1 - Lower Left", church_name_a, "scr_roomname_slash_scr_roomname_gml_9_0_c");
    if (arg0 == 227)
        roomname = stringsetsubloc("~1 - Lower Right", church_name_a, "scr_roomname_slash_scr_roomname_gml_10_0");
    if (arg0 == 115)
        roomname = stringsetsubloc("~1 - Study", church_name_a, "scr_roomname_slash_scr_roomname_gml_11_0_b");
    if (arg0 == 219)
        roomname = stringsetsubloc("~1 - Library", church_name_a, "scr_roomname_slash_scr_roomname_gml_12_0");
    if (arg0 == 218)
        roomname = stringsetsubloc("~1 - Small Piano", church_name_a, "scr_roomname_slash_scr_roomname_gml_13_0");
    var church_name_b = stringsetloc("2nd Sanctuary", "scr_roomname_slash_scr_roomname_gml_15_0");
    if (arg0 == 247)
        roomname = stringsetsubloc("~1 - Atrium", church_name_b, "scr_roomname_slash_scr_roomname_gml_16_0");
    if (arg0 == 251)
        roomname = stringsetsubloc("~1 - Floor", church_name_b, "scr_roomname_slash_scr_roomname_gml_17_0");
    if (arg0 == 257)
        roomname = stringsetsubloc("~1 - Study", church_name_b, "scr_roomname_slash_scr_roomname_gml_18_0");
    if (arg0 == 304)
        roomname = stringsetsubloc("~1 - Study", church_name_b, "scr_roomname_slash_scr_roomname_gml_19_0");
    var church_name_c = stringsetloc("3rd Sanctuary", "scr_roomname_slash_scr_roomname_gml_21_0");
    if (arg0 == 270)
        roomname = church_name_c;
    if (arg0 == 277)
        roomname = stringsetsubloc("~1 - Stairs", church_name_c, "scr_roomname_slash_scr_roomname_gml_23_0");
    if (arg0 == 280)
        roomname = stringsetsubloc("~1 - Last Chamber", church_name_c, "scr_roomname_slash_scr_roomname_gml_24_0");
    if (arg0 == 322)
        roomname = stringsetloc("MIKE ZONE", "scr_roomname_slash_scr_roomname_gml_29_0");
    if (arg0 == 298)
        roomname = stringsetloc("Castle Town - TV Building", "scr_roomname_slash_scr_roomname_gml_30_0");
    return roomname;
}
