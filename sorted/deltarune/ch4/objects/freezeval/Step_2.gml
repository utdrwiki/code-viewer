if (i_ex(target))
    variable_instance_set(target, variablename, val);
else
    instance_destroy();
if (lifetime != -1)
{
    timer++;
    if (timer >= lifetime)
        instance_destroy();
}
