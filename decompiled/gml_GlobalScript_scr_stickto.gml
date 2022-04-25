scr_stickto = function(argument0, argument1) //gml_Script_scr_stickto
{
    _stickto = instance_create(0, 0, obj_stickto)
    _stickto.stickingobj = id
    _stickto.stucktoobj = argument0
    _stickto.relativedepth = argument1
    with (_stickto)
        event_user(0)
    return;
}

