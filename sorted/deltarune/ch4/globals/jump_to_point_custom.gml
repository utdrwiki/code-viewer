function scr_jump_to_point_custom(arg0, arg1, arg2, arg3)
{
    __jump_to_point = instance_create(x, y, obj_jump_to_point);
    __jump_to_point.target = id;
    with (__jump_to_point)
    {
        startx = x;
        starty = y;
        endx = arg0;
        endy = arg1;
        jumpspeed = arg2;
        jumptime = arg3;
        jumpsprite = argument4;
        landsprite = argument5;
        if (argument4 > 0)
            usesprites = 1;
        drawshadow = 0;
        customsprite = true;
    }
    return __jump_to_point;
}
