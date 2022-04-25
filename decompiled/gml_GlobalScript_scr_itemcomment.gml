scr_itemcomment = function(argument0, argument1) //gml_Script_scr_itemcomment
{
    talkx = scr_charbox_x(argument0)
    itemcomment = instance_create((talkx + xx), (yy + 460), obj_menuwriter)
    itemcomment.msg = argument1
    itemcomment.who = argument0
    if (global.flag[32] == 1)
    {
        with (itemcomment)
            instance_destroy()
    }
    return;
}

