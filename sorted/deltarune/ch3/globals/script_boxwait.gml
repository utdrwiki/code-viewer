function scr_script_boxwait()
{
    var __boxscript = instance_create(0, 0, obj_script_boxwaiter);
    __boxscript.script = argument[0];
    __boxscript.msgno = argument[1];
    __boxscript.target = id;
    for (var __i = 0; __i < (argument_count - 2); __i++)
        __boxscript.script_arg[__i] = argument[__i + 2];
    __boxscript.arg_count = argument_count - 2;
    return __boxscript;
}

function scr_script_boxwait_end()
{
    var __boxscript = instance_create(0, 0, obj_script_boxwaiter);
    __boxscript.script = argument[0];
    __boxscript.msgno = argument[1];
    __boxscript.target = id;
    for (var __i = 0; __i < (argument_count - 2); __i++)
        __boxscript.script_arg[__i] = argument[__i + 2];
    __boxscript.arg_count = argument_count - 2;
    __boxscript.waitend = true;
    return __boxscript;
}

function scr_var_set_boxwait(arg0, arg1, arg2)
{
    scr_script_boxwait(variable_instance_set, arg0, id, arg1, arg2);
}

function scr_var_set_boxwait_end(arg0, arg1, arg2)
{
    scr_script_boxwait_end(variable_instance_set, arg0, id, arg1, arg2);
}

function scr_globalvar_boxwait(arg0, arg1, arg2)
{
    scr_script_boxwait(variable_global_set, arg0, arg1, arg2);
}

function scr_globalvar_boxwait_end(arg0, arg1, arg2)
{
    scr_script_boxwait_end(variable_global_set, arg0, arg1, arg2);
}
