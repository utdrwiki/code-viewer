scr_move_to_point_over_time_ch1 = function(argument0, argument1, argument2) //gml_Script_scr_move_to_point_over_time_ch1
{
    _mmm = instance_create_ch1(x, y, obj_move_to_point_ch1)
    _mmm.target = id
    _mmm.movex = argument0
    _mmm.movey = argument1
    _mmm.movemax = argument2
    return;
}

