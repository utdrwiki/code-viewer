timer++;
if (timer == rate)
{
    timer = 0;
    var _vspeed = choose(verticalspeed, verticalspeed * -1);
    for (var i = 0; i < bulletcount; i++)
    {
        inst = instance_create(obj_growtangle.x + 300, (obj_growtangle.y - 100) + (gapsize * i), obj_diagonal_bullet);
        inst.hspeed = horizontalspeed;
        inst.vspeed = _vspeed;
        if (_vspeed > 0)
            inst.y = (inst.y - (bulletcount * gapsize)) + 300;
    }
    rate -= 4;
    if (rate < 8)
        rate = 8;
}
