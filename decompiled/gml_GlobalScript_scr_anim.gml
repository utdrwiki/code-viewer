scr_anim = function(argument0, argument1) //gml_Script_scr_anim
{
    objanim = instance_create(x, y, obj_anim)
    objanim.target = id
    objanim.sprite_index = argument0
    objanim.framespeed = argument1
    with (objanim)
        event_user(0)
    return;
}

