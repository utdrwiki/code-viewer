scr_rotatearoundobject = function(argument0, argument1) //gml_Script_scr_rotatearoundobject
{
    var __theta = point_direction(argument0.x, argument0.y, x, y)
    var __radius = point_distance(argument0.x, argument0.y, x, y)
    __theta += argument1
    x = (argument0.x + lengthdir_x(__radius, __theta))
    y = (argument0.y + lengthdir_y(__radius, __theta))
    direction += argument1
    return;
}

