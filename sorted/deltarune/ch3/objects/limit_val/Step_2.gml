if (i_ex(target))
{
    if (limittype == 0)
    {
        var curval = variable_instance_get(target, variablename);
        if (curval < vallimit)
            variable_instance_set(target, variablename, vallimit);
    }
    if (limittype == 1)
    {
        var curval = variable_instance_get(target, variablename);
        if (curval > vallimit2)
            variable_instance_set(target, variablename, vallimit2);
    }
    if (limittype == 2)
    {
        var curval = variable_instance_get(target, variablename);
        variable_instance_set(target, variablename, clamp(curval, vallimit, vallimit2));
    }
}
else
{
    instance_destroy();
}
if (lifetime != -1)
{
    timer++;
    if (timer >= lifetime)
        instance_destroy();
}
