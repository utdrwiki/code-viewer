function scr_precise_hit(arg0 = 3, arg1 = false)
{
    arg0 /= 2;
    var _hx = obj_heart.x + 10;
    var _hy = obj_heart.y + 10;
    if (arg0 <= 0)
        return collision_point(_hx, _hy, id, true, false);
    else if (arg1)
        return collision_circle(_hx, _hy, arg0, id, true, false);
    else
        return collision_rectangle(_hx - arg0, _hy - arg0, _hx + arg0, _hy + arg0, id, true, false);
}
