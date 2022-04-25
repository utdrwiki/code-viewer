ease_out_back = function(argument0, argument1, argument2, argument3) //gml_Script_ease_out_back
{
    var _s = 1.70158
    argument0 = ((argument0 / argument3) - 1)
    return ((argument2 * (((argument0 * argument0) * (((_s + 1) * argument0) + _s)) + 1)) + argument1);
}

