function c_var_lerp_instance()
{
    if (argument_count < 6)
        c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], 0);
    else if (argument_count == 6)
        c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
    else if (argument_count == 7)
        c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], string(argument[5]) + string(argument[6]));
}

function c_lerp_var_instance()
{
    if (argument_count >= 6)
        c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5);
    else if (argument_count >= 7)
        c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    else
        c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4);
}

function c_lerpvar_instance()
{
    if (argument_count >= 6)
        c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5);
    else if (argument_count >= 7)
        c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    else
        c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4);
}
