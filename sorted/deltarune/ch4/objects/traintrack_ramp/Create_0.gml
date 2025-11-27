for (var i = 0; i < 3; i++)
{
    var _tx = x + (i * 10);
    var _ty = y;
    var _track = instance_create_depth(_tx, _ty, depth - 1, obj_traintrack_straight_horizontal);
    _track.visible = false;
}
