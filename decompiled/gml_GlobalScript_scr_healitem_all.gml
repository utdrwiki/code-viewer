scr_healitem_all = function(argument0) //gml_Script_scr_healitem_all
{
    scr_healall(argument0)
    for (i = 0; i < chartotal; i += 1)
    {
        healx = scr_charbox_x(i)
        healtext = instance_create(((healx + 70) + xx), (yy + 430), obj_healwriter)
        healtext.healamt = argument0
    }
    return;
}

