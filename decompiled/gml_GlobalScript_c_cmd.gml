c_cmd = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_c_cmd
{
    if instance_exists(obj_cutscene_master)
    {
        __cs_i = (obj_cutscene_master.maximum_command - 1)
        obj_cutscene_master.command[__cs_i] = argument0
        obj_cutscene_master.command_arg1[__cs_i] = argument1
        obj_cutscene_master.command_arg2[__cs_i] = argument2
        obj_cutscene_master.command_arg3[__cs_i] = argument3
        obj_cutscene_master.command_arg4[__cs_i] = argument4
        with (obj_cutscene_master)
            maximum_command++
    }
    return;
}

