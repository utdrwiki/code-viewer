if (x > maxx || x < minx)
{
    var _change = 0;
    if (x > maxx)
        _change = x - maxx;
    else
        _change = x - minx;
    x = clamp(x, minx, maxx);
    y += _change;
    if (clockwise)
        vspeed = hspeed;
    else
        vspeed = -hspeed;
    hspeed = 0;
}
else if (y < miny || y > maxy)
{
    var _change = 0;
    if (y > maxy)
        _change = y - maxy;
    else
        _change = y - miny;
    y = clamp(y, miny, maxy);
    x += _change;
    if (clockwise)
        hspeed = -vspeed;
    else
        hspeed = vspeed;
    vspeed = 0;
}
if (!variable_instance_exists(id, "collider") || !instance_exists(collider))
    exit;
var _scale = radius + 20;
collider.x = x;
collider.y = y;
collider.image_xscale = _scale / 10;
collider.image_yscale = _scale / 10;
