scr_rotatetowards_unclamped = function(argument0, argument1, argument2) //gml_Script_scr_rotatetowards_unclamped
{
    var __diff = angle_difference(argument1, argument0)
    return (argument0 + (sign(__diff) * argument2));
}

