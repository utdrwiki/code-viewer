scr_itemcomment_ch1 = function(argument0, argument1) //gml_Script_scr_itemcomment_ch1
{
    talkx = scr_charbox_x_ch1(argument0)
    itemcomment = instance_create_ch1((talkx + xx), (yy + 460), obj_menuwriter_ch1)
    itemcomment.msg = argument1
    itemcomment.who = argument0
    if (global.flag[32] == 1)
    {
        with (itemcomment)
            instance_destroy()
    }
    return;
}

