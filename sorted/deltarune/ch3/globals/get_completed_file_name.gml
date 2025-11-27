function scr_get_completed_file_name(arg0 = 0)
{
    var _file_name = "";
    switch (arg0)
    {
        case 1:
            _file_name = stringsetloc("Your Room", "scr_get_completed_file_name_slash_scr_get_completed_file_name_gml_9_0");
            break;
        case 2:
            _file_name = stringsetloc("Kris's House", "scr_get_completed_file_name_slash_scr_get_completed_file_name_gml_12_0");
            break;
        default:
            break;
    }
    var full_file_name = stringsetsubloc("~1 [Chapter ~2 END]", _file_name, string(arg0), "scr_get_completed_file_name_slash_scr_get_completed_file_name_gml_18_0");
    return full_file_name;
}
