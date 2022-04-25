scr_itemget_anytype = function(argument0, argument1) //gml_Script_scr_itemget_anytype
{
    noroom = false
    if (argument1 == "item")
        scr_itemget(argument0)
    if (argument1 == "weapon")
        scr_weaponget(argument0)
    if (argument1 == "armor")
        scr_armorget(argument0)
    if (argument1 == "key")
        scr_keyitemget(argument0)
    if (argument1 == "money")
        global.gold += argument0
    return;
}

