function c_var_add(arg0, arg1)
{
    c_cmd_x("varadd", 0, arg0, 0, arg1, 0, 0);
}

function c_var_add_instance(arg0, arg1, arg2)
{
    c_cmd_x("varadd", arg0, arg1, 0, arg2, 0, 0);
}

function c_var_lerp_add()
{
    if (argument_count < 4)
        c_cmd_x("varadd", 0, argument[0], 0, argument[1], argument[2], 0);
    else if (argument_count == 4)
        c_cmd_x("varadd", 0, argument[0], 0, argument[1], argument[2], argument[3]);
    else if (argument_count == 5)
        c_cmd_x("varadd", 0, argument[0], 0, argument[1], argument[2], string(argument[3]) + string(argument[4]));
}

function c_var_lerp_add_instance()
{
    if (argument_count < 5)
        c_cmd_x("varadd", argument[0], argument[1], 0, argument[2], argument[3], 0);
    else if (argument_count == 5)
        c_cmd_x("varadd", argument[0], argument[1], 0, argument[2], argument[3], argument[4]);
    else if (argument_count == 6)
        c_cmd_x("varadd", argument[0], argument[1], 0, argument[2], argument[3], string(argument[4]) + string(argument[5]));
}

function c_var_lerp_to()
{
    if (argument_count < 4)
        c_cmd_x("varto", 0, argument[0], 0, argument[1], argument[2], 0);
    else
        c_cmd_x("varto", 0, argument[0], 0, argument[1], argument[2], argument[3]);
}

function c_var_lerp_to_instance()
{
    if (argument_count < 5)
        c_cmd_x("varto", argument[0], argument[1], 0, argument[2], argument[3], 0);
    else if (argument_count == 5)
        c_cmd_x("varto", argument[0], argument[1], 0, argument[2], argument[3], argument[4]);
    else if (argument_count == 6)
        c_cmd_x("varto", argument[0], argument[1], 0, argument[2], argument[3], string(argument[4]) + string(argument[5]));
}
