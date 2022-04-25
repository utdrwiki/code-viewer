scr_getjumphspeed = function(argument0, argument1, argument2, argument3) //gml_Script_scr_getjumphspeed
{
    var __traveltime = sqrt(((2 * argument1) / argument0))
    var __downwardDistance = (argument3 - (y - argument1))
    __traveltime += sqrt(((2 * __downwardDistance) / argument0))
    return (argument2 / __traveltime);
}

