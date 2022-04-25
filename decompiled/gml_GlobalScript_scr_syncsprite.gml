scr_syncsprite = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_syncsprite
{
    var _instance = instance_create_depth(argument1, argument2, argument5, obj_sprite_musicsync)
    with (_instance)
    {
        sprite_index = argument0
        bpm = argument3
        loopsPerBeat = argument4
    }
    return _instance;
}

