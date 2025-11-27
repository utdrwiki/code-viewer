function scr_become_light()
{
    if (scr_litemcheck(5) == 0)
        scr_litemget(5);
    if (scr_keyitemcheck(2))
    {
        if (scr_litemcheck(8) == 0)
            scr_litemget(8);
    }
    else
    {
        scr_litemremove(8);
    }
    if (scr_keyitemcheck(13))
    {
        if (scr_litemcheck(11) == 0)
            scr_litemget(11);
    }
    else
    {
        scr_litemremove(11);
    }
    global.lhp = ceil((global.hp[1] / global.maxhp[1]) * global.lmaxhp);
    if (global.lhp < 1)
        global.lhp = 1;
    if (global.lhp > global.lmaxhp)
        global.lhp = global.lmaxhp;
    scr_equip_lw_weapon_by_dw_id(global.charweapon[1]);
    global.lwstrength = get_lw_weapon_strength(global.lweapon);
    if (scr_weaponcheck_inventory(26) > 0 || scr_weaponcheck_equipped_any(26) > 0)
    {
        if (!scr_litemcheck(17) && global.lweapon != 17)
            scr_litemget(17);
    }
    var armorconverted = 0;
    if (scr_armorcheck_equipped(1, 14) > 0)
    {
        armorconverted = 1;
        global.larmor = 14;
    }
    if (armorconverted == 1)
        global.ladef = 1;
    else
        global.ladef = 0;
    global.darkzone = 0;
}
