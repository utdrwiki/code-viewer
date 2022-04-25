scr_jump_to_point_sprite = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_jump_to_point_sprite
{
    __jump_to_point = instance_create(x, y, obj_jump_to_point)
    __jump_to_point.target = id
    with (__jump_to_point)
    {
        startx = x
        starty = y
        endx = argument0
        endy = argument1
        jumpspeed = argument2
        jumptime = argument3
        jumpsprite = argument4
        landsprite = argument5
        if (argument4 > 0)
            usesprites = 1
        drawshadow = false
    }
    return __jump_to_point;
}

