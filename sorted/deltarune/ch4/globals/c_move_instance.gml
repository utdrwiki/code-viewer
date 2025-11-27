function c_move_instance()
{
    if (argument_count < 7)
    {
        c_cmd_x("var", argument[0], "x", argument[1], argument[3], argument[5], 0);
        c_cmd_x("var", argument[0], "y", argument[2], argument[4], argument[5], 0);
    }
    else if (argument_count == 7)
    {
        c_cmd_x("var", argument[0], "x", argument[1], argument[3], argument[5], argument[6]);
        c_cmd_x("var", argument[0], "y", argument[2], argument[4], argument[5], argument[6]);
    }
    else if (argument_count == 8)
    {
        c_cmd_x("var", argument[0], "x", argument[1], argument[3], argument[5], string(argument[6]) + string(argument[7]));
        c_cmd_x("var", argument[0], "y", argument[2], argument[4], argument[5], string(argument[6]) + string(argument[7]));
    }
    else if (argument_count == 9)
    {
        c_cmd_x("var", argument[0], "x", argument[1], argument[3], argument[5], string(argument[6]) + string(argument[7]));
        c_cmd_x("var", argument[0], "y", argument[2], argument[4], argument[5], string(argument[8]) + string(argument[7]));
    }
    else if (argument_count == 10)
    {
        c_cmd_x("var", argument[0], "x", argument[1], argument[3], argument[5], string(argument[6]) + string(argument[7]));
        c_cmd_x("var", argument[0], "y", argument[2], argument[4], argument[5], string(argument[8]) + string(argument[9]));
    }
}
