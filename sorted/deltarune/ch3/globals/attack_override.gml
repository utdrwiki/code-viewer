function scr_attack_override(arg0, arg1, arg2, arg3 = false)
{
    var __attackdebug = arg0;
    if (arg1 > 10)
        arg1 = 10;
    if (sunkus_kb_check_pressed(110) || sunkus_kb_check_pressed(189))
    {
        __attackdebug = -1;
        if (arg3)
            scr_debug_print(arg2 + " is normal now.");
        else
            scr_debug_print(arg2 + " attack randomized.");
    }
    else
    {
        for (i = 0; i < arg1; i++)
        {
            if (sunkus_kb_check_pressed(ord(string(i))) || sunkus_kb_check_pressed(96 + i))
                __attackdebug = i;
        }
        for (i = arg1; i < 10; i++)
        {
            if (sunkus_kb_check_pressed(ord(string(i))) || sunkus_kb_check_pressed(96 + i))
                scr_debug_print(arg2 + " does not have an attack no. " + string(i));
        }
    }
    if (__attackdebug != arg0 && __attackdebug > -1)
        scr_debug_print(arg2 + " attack set to no. " + string(__attackdebug));
    if (sunkus_kb_check_pressed(9))
    {
        if (window_get_height() == 480)
        {
            var __screensize = floor(display_get_height() / 480);
            window_set_size(640 * __screensize, 480 * __screensize);
        }
        else
        {
            window_set_size(640, 480);
        }
    }
    return __attackdebug;
}
