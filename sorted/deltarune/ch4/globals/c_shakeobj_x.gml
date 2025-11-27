function c_shakeobj_x()
{
    if (argument_count == 1)
        c_cmd("shakeobj", argument[0], 0, 0, 0);
    if (argument_count == 2)
        c_cmd("shakeobj", argument[0], argument[1], 0, 0);
    if (argument_count == 3)
        c_cmd("shakeobj", argument[0], argument[1], argument[2], 0);
}
