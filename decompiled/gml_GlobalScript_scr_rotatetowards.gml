scr_rotatetowards = function(argument0, argument1, argument2) //gml_Script_scr_rotatetowards
{
    var __diff = angle_difference(argument1, argument0)
    if (abs(__diff) > argument2)
        return (argument0 + (sign(__diff) * argument2));
    else
        return argument1;
}

scr_angle_lerp = function(argument0, argument1, argument2) //gml_Script_scr_angle_lerp
{
    __diff = angle_difference(argument1, argument0)
    return (argument0 + lerp(0, __diff, argument2));
}

