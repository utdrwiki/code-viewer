function scr_timer_check()
{
    for (var i = 2; i < argument_count; i++)
    {
        var __con = argument[0];
        var __timer = argument[1];
        if ((i - 2) == __con && __timer >= argument[i])
            return true;
    }
    return false;
}
