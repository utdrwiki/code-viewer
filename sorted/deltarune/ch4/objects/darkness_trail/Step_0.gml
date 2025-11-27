if (!init)
{
    init = true;
    sizer = size;
    base_speed = speed;
}
if (target != -4)
{
    ylast = y;
    xlast = x;
    x = target.x + xoff;
    y = target.y + yoff;
}
if (!active)
    exit;
if (burst)
{
    burst = false;
    var _basedir = point_direction(xlast, ylast, x, y) - 40;
    var _base_angle = 270;
    var _count = 0;
    repeat (4)
    {
        var _subtrail = instance_create(xlast + random_range(-10, 10), ylast + random_range(-10, 10), obj_darkness_trail);
        _subtrail.size = 1.5;
        _subtrail.lifetime = 4 + irandom(2);
        _subtrail.direction = _base_angle + random_range(-15, 15);
        if (_count == 1 || _count == 2)
            _subtrail.speed = random_range(30, 50);
        else
            _subtrail.speed = random_range(10, 25);
        _subtrail.active = true;
        _subtrail.burst = false;
        _subtrail.subtrail = true;
        _subtrail.depth = (target != -4) ? (target.depth - 4) : depth;
        _subtrail.speed_scale = true;
        _count++;
    }
}
var _length = array_length(points);
if ((!subtrail && last_orb != -4) && point_distance(last_orb.x, last_orb.y, x, y) >= (sizer * 100))
{
    var _xx = lerp(last_orb.x, x, 0.5);
    var _yy = lerp(last_orb.y, y, 0.5);
    siner -= 0.125;
    make_trail_ball(_xx, _yy);
    sizer -= (size / lifetime / 2);
    siner -= 0.125;
    last_orb = make_trail_ball(x, y);
    sizer -= (size / lifetime / 2);
}
else
{
    last_orb = make_trail_ball(x, y);
    sizer -= (size / lifetime);
}
if (sizer <= 0)
    instance_destroy();
if (speed_scale)
    speed = min(base_speed, sizer * 1.5 * base_speed);
