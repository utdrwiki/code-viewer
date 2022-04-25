scr_kingface = function(argument0, argument1) //gml_Script_scr_kingface
{
    if ((global.chapter == 1 && global.plot >= 235) || global.chapter >= 2)
        global.msg[argument0] = stringsetsubloc("\\TX \\F0 \\E~1 \\FK \\TK %", string(argument1), "scr_kingface_slash_scr_kingface_gml_3_0")
    else
        global.msg[argument0] = stringsetsubloc("\\TX \\F0 \\E~1 \\TK %", string(argument1), "scr_kingface_slash_scr_kingface_gml_7_0")
    return;
}

