function c_var_lerp()
{
    if (argument_count < 5)
        c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], 0);
    else if (argument_count == 5)
        c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], argument[4]);
    else
        c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], string(argument[4]) + string(argument[5]));
}
