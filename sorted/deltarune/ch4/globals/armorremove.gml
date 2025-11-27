function scr_armorremove(arg0)
{
    var __inventorysize = array_length_1d(global.armor);
    for (var __i = 0; __i < __inventorysize; __i++)
    {
        if (global.armor[__i] == arg0)
        {
            global.armor[__i] = 0;
            break;
        }
    }
    script_execute(scr_armorinfo_all);
}
