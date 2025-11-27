function scr_addvar_instance()
{
    __lerpvar = instance_create(0, 0, obj_addvar);
    __lerpvar.target = argument[0];
    __lerpvar.varname = argument[1];
    __lerpvar.pointa = argument[2];
    __lerpvar.pointb = argument[3];
    __lerpvar.maxtime = argument[4];
    if (argument_count >= 6)
        __lerpvar.easetype = argument[5];
    if (argument_count >= 7)
        __lerpvar.easeinout = argument[6];
    return __lerpvar;
}

function scr_add_var_instance()
{
    if (argument_count >= 6)
        return scr_addvar_instance(argument0, argument1, argument2, argument3, argument4, argument5);
    else if (argument_count >= 7)
        return scr_addvar_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    else
        return scr_addvar_instance(argument0, argument1, argument2, argument3, argument4);
}

function scr_add_instance_var()
{
    if (argument_count >= 6)
        return scr_addvar_instance(argument0, argument1, argument2, argument3, argument4, argument5);
    else if (argument_count >= 7)
        return scr_addvar_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    else
        return scr_addvar_instance(argument0, argument1, argument2, argument3, argument4);
}
