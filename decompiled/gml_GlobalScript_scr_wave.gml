scr_wave = function(argument0, argument1, argument2, argument3) //gml_Script_scr_wave
{
    var a4 = ((argument1 - argument0) * 0.5)
    return ((argument0 + a4) + (sin(((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi))) * a4));
}

