function scr_board_marker()
{
    var _thismarker = instance_create(argument0, argument1, obj_board_marker);
    _thismarker.sprite_index = argument2;
    _thismarker.image_xscale = 2;
    _thismarker.image_yscale = 2;
    if (argument_count >= 4)
        _thismarker.image_speed = argument3;
    if (argument_count >= 5)
    {
        if (argument4 != -1)
            _thismarker.depth = argument4;
    }
    if (argument_count >= 6)
        _thismarker.image_xscale = argument5;
    if (argument_count >= 6)
        _thismarker.image_yscale = argument5;
    if (argument_count >= 7)
        _thismarker.animateonce = argument6;
    return _thismarker;
}
