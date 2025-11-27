function scr_become_dark()
{
    global.darkzone = 1;
    scr_equip_dw_weapon_by_lw_id(global.lweapon);
    for (var i = 0; i < 8; i++)
    {
        var weapon = get_weapon_by_lw_id(global.litem[i]);
        if (weapon != -4)
        {
            if (!scr_weaponcheck_inventory(weapon.dw_id) && !scr_weaponcheck_equipped_any(weapon.dw_id))
                scr_weaponget(weapon.dw_id);
        }
    }
    global.hp[1] = ceil((global.lhp / global.lmaxhp) * global.maxhp[1]);
    if (global.hp[1] < 1)
        global.hp[1] = 1;
    if (global.hp[1] > global.maxhp[1])
        global.hp[1] = global.maxhp[1];
}
