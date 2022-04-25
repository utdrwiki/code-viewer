scr_healitem = function(argument0, argument1) //gml_Script_scr_healitem
{
    scr_heal(argument0, argument1)
    healx = scr_charbox_x(argument0)
    healtext = instance_create(((healx + 70) + xx), (yy + 430), obj_healwriter)
    healtext.healamt = argument1
    return;
}

