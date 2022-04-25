scr_ease_in = function(argument0, argument1) //gml_Script_scr_ease_in
{
    if (argument1 < -3 || argument1 > 7)
        return argument0;
    switch argument1
    {
        case -3:
            return ease_in_bounce(argument0, 0, 1, 1);
        case -2:
            return ease_in_elastic(argument0, 0, 1, 1);
        case -1:
            var _s = 1.70158
            return ((argument0 * argument0) * (((_s + 1) * argument0) - _s));
        case 0:
            return argument0;
        case 1:
            argument0 = ((-(cos((argument0 * 1.5707963267948966)))) + 1)
            return argument0;
        case 6:
            argument0 = power(2, (10 * (argument0 - 1)))
            return argument0;
        case 7:
            argument0 = (-((sqrt((1 - sqr(argument0))) - 1)))
            return argument0;
        default:
            argument0 = power(argument0, argument1)
            return argument0;
    }

}

