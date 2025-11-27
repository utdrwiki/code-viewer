function scr_in_light(arg0 = self, arg1 = 0, arg2 = 0)
{
    var _inLight = false;
    _inLight = collision_point(arg0.x + arg1, arg0.y + arg2, obj_light_collider, true, true);
    return _inLight != -4;
}
