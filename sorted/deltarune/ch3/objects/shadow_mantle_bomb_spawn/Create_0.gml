timer = 0;
con = 0;
move_type = 0;
_arrayindex = 0;
_arraylength = 0;
_x = 175;
_y = 109;
for (var i = 0; i < 11; i++)
{
    for (var ii = 0; ii < 7; ii++)
    {
        if (!instance_position(_x, _y, obj_board_solid) && !instance_position(_x, _y, obj_spawn_pos))
            instance_create(_x, _y, obj_spawn_pos);
        _y += 32;
    }
    _x += 32;
    _y = 109;
}
with (obj_spawn_pos)
{
    if (distance_to_object(obj_mainchara_board) < 80)
        instance_destroy();
    if (y < 128)
        instance_destroy();
    if (y > 192)
        instance_destroy();
}
for (var i = 0; i < instance_number(obj_spawn_pos); i++)
    pos[i] = instance_find(obj_spawn_pos, i);
