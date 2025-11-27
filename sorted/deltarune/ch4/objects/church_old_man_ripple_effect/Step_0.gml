active = true;
if (active && timer == 1 && type >= 3 && type < 7)
{
    var _count = (type == 3) ? 8 : 16;
    var _angle = 360 / _count;
    var _start_angle = 0;
    if (type >= 5)
    {
        if (type == 6)
            _count = 32;
        _angle = 120 / _count;
        _start_angle = (180 + random_range(-30, 30)) - 30;
    }
    var _half = false;
    for (var i = 0; i < _count; i++)
    {
        var _spark = instance_create(x, y, obj_church_parry_sparks);
        with (_spark)
        {
            direction = _start_angle + (i * _angle) + random_range(-_angle / 2, _angle / 2);
            image_angle = direction;
            image_blend = other.color;
            if (!_half && other.type >= 5 && i > (_count / 2))
            {
                _start_angle -= (180 + (i * _angle));
                _half = true;
            }
            depth = other.depth + 1;
            if (other.type == 3)
            {
                friction = 0.5;
                speed = random_range(5, 12);
                image_xscale = 2;
            }
            else if (other.type >= 5)
            {
                friction = 0.5;
                speed = random_range(5, 12);
                image_xscale = 2;
            }
            else
            {
                image_xscale = 3;
                friction = 1;
                speed = random_range(10, 30);
                image_xscale = speed / 10;
            }
            if (_half)
            {
                speed /= 2;
            }
            else if (other.type >= 5)
            {
            }
        }
    }
}
