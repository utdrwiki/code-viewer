scr_itemremove_anytype = function(argument0, argument1) //gml_Script_scr_itemremove_anytype
{
    if (argument1 == "item")
        scr_itemremove(argument0)
    if (argument1 == "weapon")
        scr_weaponremove(argument0)
    if (argument1 == "armor")
        scr_armorremove(argument0)
    if (argument1 == "key")
        scr_keyitemremove(argument0)
    return;
}

