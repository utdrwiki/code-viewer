function scr_resetgameshowcharacter_delay()
{
    var _x_smooth = 0;
    if (argument_count == 3)
        _x_smooth = 1;
    return scr_script_delayed(scr_resetgameshowcharacter, argument1, argument0, _x_smooth);
}
