scr_move_to_point_over_time = function(argument0, argument1, argument2) //gml_Script_scr_move_to_point_over_time
{
    _mmm = instance_create(x, y, obj_move_to_point)
    _mmm.target = id
    _mmm.movex = argument0
    _mmm.movey = argument1
    _mmm.movemax = argument2
    return _mmm;
}

