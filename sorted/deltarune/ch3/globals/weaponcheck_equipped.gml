function scr_weaponcheck_equipped(arg0, arg1)
{
    var __equipped = 0;
    if (global.charweapon[arg0] == arg1)
        __equipped++;
    return __equipped;
}
