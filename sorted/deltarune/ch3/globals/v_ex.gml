function v_ex()
{
    if (argument_count == 1)
        return variable_instance_exists(id, argument[0]);
    else if (argument_count >= 2)
        return iv_ex(argument[0], argument[1]);
}

function iv_ex(arg0, arg1)
{
    if (i_ex(arg0))
        return variable_instance_exists(arg0, arg1);
    else
        return false;
}

function v_de(arg0)
{
    return !is_undefined(arg0);
}
