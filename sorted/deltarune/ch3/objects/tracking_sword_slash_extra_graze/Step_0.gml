if (global.inv < 0)
{
    if (place_meeting(x, y, obj_heart))
    {
        var _grazetpfactor = grazetpfactor;
        var _grazetimefactor = grazetimefactor;
        if (i_ex(obj_tracking_swords_manager) && obj_tracking_swords_manager.variant == 1)
            scr_tensionheal(4 * _grazetpfactor);
        else if (i_ex(obj_sword_vortex_manager))
            scr_tensionheal(4 * _grazetpfactor);
        else
            scr_tensionheal(7 * _grazetpfactor);
        if (global.turntimer >= 10)
            global.turntimer -= ((1/30) * _grazetimefactor);
        instance_destroy();
    }
}
