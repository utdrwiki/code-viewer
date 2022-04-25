scr_itemshift = function(argument0, argument1) //gml_Script_scr_itemshift
{
    global.item[12] = argument1
    for (i = argument0; i < 12; i += 1)
        global.item[i] = global.item[(i + 1)]
    scr_iteminfo_all()
    scr_itemname()
    return;
}

