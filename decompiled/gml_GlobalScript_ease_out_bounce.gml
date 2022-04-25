ease_out_bounce = function(argument0, argument1, argument2, argument3) //gml_Script_ease_out_bounce
{
    argument0 /= argument3
    if (argument0 < 0.36363636363636365)
        return ((argument2 * ((7.5625 * argument0) * argument0)) + argument1);
    else if (argument0 < 0.7272727272727273)
    {
        argument0 -= 0.5454545454545454
        return ((argument2 * (((7.5625 * argument0) * argument0) + 0.75)) + argument1);
    }
    else if (argument0 < 0.9090909090909091)
    {
        argument0 -= 0.8181818181818182
        return ((argument2 * (((7.5625 * argument0) * argument0) + 0.9375)) + argument1);
    }
    else
    {
        argument0 -= 0.9545454545454546
        return ((argument2 * (((7.5625 * argument0) * argument0) + 0.984375)) + argument1);
    }
}

