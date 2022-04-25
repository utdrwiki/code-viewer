scr_anim_ch1 = function(argument0, argument1) //gml_Script_scr_anim_ch1
{
    objanim = instance_create_ch1(x, y, obj_anim_ch1)
    objanim.target = id
    objanim.sprite_index = argument0
    objanim.framespeed = argument1
    with (objanim)
        event_user(0)
    return;
}

