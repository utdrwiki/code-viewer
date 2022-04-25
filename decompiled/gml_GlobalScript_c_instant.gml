c_instant = function(argument0) //gml_Script_c_instant
{
    if scr_debug()
        c_cmd_x("var", instance_find(obj_cutscene_master, 0), "instant", argument0, 0, 0, 0)
    return;
}

