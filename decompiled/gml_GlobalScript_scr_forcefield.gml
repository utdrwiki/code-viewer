scr_forcefield = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_forcefield
{
    field = instance_create(argument0, argument1, obj_forcefield)
    field.image_xscale = argument2
    field.image_yscale = argument3
    field.skip = argument4
    field.stayVisible = argument5
    with (field)
        scr_depth()
    return field;
}

