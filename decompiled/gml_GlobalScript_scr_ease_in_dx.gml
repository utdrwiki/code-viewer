scr_ease_in_dx = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_ease_in_dx
{
    if (argument4 < -3 || argument4 > 6)
        return argument0;
    switch argument4
    {
        case -3:
            return ease_in_bounce(argument0, argument1, argument2, argument3);
        case -2:
            return ease_in_elastic(argument0, argument1, argument2, argument3);
        case -1:
            var _s = 1.70158
            return ((argument0 * argument0) * (((_s + 1) * argument0) - _s));
        case 0:
            argument0 /= argument3
            return ((-(cos((argument0 * 1.5707963267948966)))) + 1);
        case 1:
            return power(2, (10 * (argument0 - 1)));
        case 6:
            return (-(sqrt((1 - sqr(argument0)))));
        default:
            return ((argument2 * power((argument0 / argument3), argument4)) + argument1);
    }

}

