function scr_weaponremove(arg0)
{
    var __inventorysize = array_length_1d(global.weapon);
    for (var __i = 0; __i < __inventorysize; __i++)
    {
        if (global.weapon[__i] == arg0)
        {
            global.weapon[__i] = 0;
            break;
        }
    }
    script_execute(scr_weaponinfo_all);
}
