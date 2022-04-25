scr_ease_inout = function(argument0, argument1) //gml_Script_scr_ease_inout
{
    if (argument1 < -3 || argument1 > 7)
        return argument0;
    if (argument1 == -3)
        return ease_inout_bounce(argument0, 0, 1, 1);
    else if (argument1 == -2)
        return ease_inout_elastic(argument0, 0, 1, 1);
    else if (argument1 == -1)
        return ease_inout_back(argument0, 0, 1, 1);
    else if (argument1 == 1)
        return (-0.5 * cos(((pi * argument0) - 1)));
    else if (argument1 == 0)
        return argument0;
    argument0 *= 2
    if (argument0 < 1)
        return (0.5 * scr_ease_in(argument0, argument1));
    else
    {
        argument0--
        return (0.5 * (scr_ease_out(argument0, argument1) + 1));
    }
}

