scr_healitem_ch1 = function(argument0, argument1) //gml_Script_scr_healitem_ch1
{
    scr_heal_ch1(argument0, argument1)
    healx = scr_charbox_x_ch1(argument0)
    healtext = instance_create_ch1(((healx + 70) + xx), (yy + 430), obj_healwriter_ch1)
    healtext.healamt = argument1
    return;
}

