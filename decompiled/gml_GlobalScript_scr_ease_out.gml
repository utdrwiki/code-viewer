scr_ease_out = function(argument0, argument1) //gml_Script_scr_ease_out
{
    if (argument1 < -3 || argument1 > 7)
        return argument0;
    switch argument1
    {
        case -3:
            return ease_out_bounce(argument0, 0, 1, 1);
        case -2:
            return ease_out_elastic(argument0, 0, 1, 1);
        case -1:
            return ease_out_back(argument0, 0, 1, 1);
        case 0:
            return argument0;
        case 1:
            argument0 = sin((argument0 * 1.5707963267948966))
            return argument0;
        case 2:
            argument0 = ((-argument0) * (argument0 - 2))
            return argument0;
        case 6:
            argument0 = ((-(power(2, (-10 * argument0)))) + 1)
            return argument0;
        case 7:
            argument0--
            argument0 = sqrt((1 - (argument0 * argument0)))
            return argument0;
        default:
            argument0--
            if (argument1 == 4)
            {
                argument0 = (-1 * (power(argument0, argument1) - 1))
                return argument0;
            }
            else
            {
                argument0 = (power(argument0, argument1) + 1)
                return argument0;
            }
    }

}

