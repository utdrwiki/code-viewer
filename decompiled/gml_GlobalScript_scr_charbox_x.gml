scr_charbox_x = function(argument0) //gml_Script_scr_charbox_x
{
    if (argument0 == 0 && chartotal == 3)
        return 0;
    if (argument0 == 1 && chartotal == 3)
        return 212;
    if (argument0 == 2 && chartotal == 3)
        return 424;
    if (argument0 == 0 && chartotal == 2)
        return 106;
    if (argument0 == 1 && chartotal == 2)
        return 326;
    if (argument0 == 0 && chartotal == 1)
        return 212;
    return;
}

