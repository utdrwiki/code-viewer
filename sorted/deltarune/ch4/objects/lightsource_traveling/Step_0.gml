if (!init)
{
    init = true;
    var _centerx = room_width / 2;
    var _centery = room_height / 2;
    var _xdist = x - _centerx;
    var _ydist = y - _centery;
    minx = _centerx - abs(_xdist);
    maxx = _centerx + abs(_xdist);
    miny = _centery - abs(_ydist);
    maxy = _centery + abs(_ydist);
    if (sign(_xdist) == sign(_ydist))
    {
        if (clockwise)
            hspeed = -sign(_xdist) * travelspeed;
        else
            vspeed = -sign(_ydist) * travelspeed;
    }
    else if (clockwise)
    {
        vspeed = sign(_xdist) * travelspeed;
    }
    else
    {
        hspeed = sign(_ydist) * travelspeed;
    }
}
siner++;
smallerLight = (sin(siner / 30) * 10) + radius;
biggerLight = (sin((siner - 10) / 30) * 10) + radius + 40;
scr_depth();
