function scr_lweapon_can_equip(arg0)
{
    var weapon = get_weapon_by_lw_id(arg0);
    var have_dw_weapon = false;
    if (weapon == -4)
        show_debug_message("Error: couldn't find light world weapon by id " + string(arg0));
    else
        have_dw_weapon = scr_weaponcheck_inventory(weapon.dw_id) == 1 || scr_weaponcheck_equipped_any(weapon.dw_id) >= 1;
    return have_dw_weapon;
}

function scr_equip_dw_weapon_by_lw_id(arg0)
{
    var weapon = get_weapon_by_lw_id(arg0);
    var old_equip = global.charweapon[1];
    global.charweapon[1] = weapon.dw_id;
    for (var i = 0; i < array_length_1d(global.weapon); i++)
    {
        if (global.weapon[i] == weapon.dw_id)
        {
            global.weapon[i] = old_equip;
            break;
        }
    }
    scr_weaponinfo_mine();
    scr_weaponinfo_all();
}

function scr_equip_lw_weapon_by_dw_id(arg0)
{
    var weapon = get_weapon_by_dw_id(arg0);
    global.lweapon = weapon.lw_id;
    var weapon_list = get_lw_dw_weapon_list();
    for (var i = 0; i < array_length_1d(global.litem); i++)
    {
        for (var j = 0; j < array_length_1d(weapon_list); j++)
        {
            if (global.litem[i] == weapon_list[j].lw_id)
                scr_litemremove(global.litem[i]);
        }
    }
}

function get_weapon_by_lw_id(arg0)
{
    var weapon = -4;
    var weapon_id = arg0;
    var weapon_list = get_lw_dw_weapon_list();
    for (var i = 0; i < array_length_1d(weapon_list); i++)
    {
        if (weapon_id == weapon_list[i].lw_id)
        {
            weapon = weapon_list[i];
            break;
        }
    }
    if (weapon == -4)
        weapon = weapon_list[0];
    return weapon;
}

function get_weapon_by_dw_id(arg0)
{
    var weapon = -4;
    var weapon_id = arg0;
    var weapon_list = get_lw_dw_weapon_list();
    for (var i = 0; i < array_length_1d(weapon_list); i++)
    {
        if (weapon_id == weapon_list[i].dw_id)
        {
            weapon = weapon_list[i];
            break;
        }
    }
    if (weapon == -4)
        weapon = weapon_list[0];
    return weapon;
}

function get_lw_weapon_strength(arg0)
{
    return get_weapon_by_lw_id(arg0).lw_strength;
}

function get_lw_dw_weapon_list()
{
    var weapon_list = [new lw_dw_weapon(2, 1), new lw_dw_weapon(6, 5), new lw_dw_weapon(7, 8), new lw_dw_weapon(12, 14), new lw_dw_weapon(13, 16), new lw_dw_weapon(16, 23, 2), new lw_dw_weapon(17, 26, 16), new lw_dw_weapon(15, 50), new lw_dw_weapon(18, 53)];
    return weapon_list;
}

function lw_dw_weapon(arg0, arg1, arg2 = 1) constructor
{
    lw_id = arg0;
    dw_id = arg1;
    lw_strength = arg2;
}
