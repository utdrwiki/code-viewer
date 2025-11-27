t++;
if (instance_exists(fixate))
{
    t = fixate.t;
    f = fixate.f;
    a = fixate.a;
}
x = xstart + (cos(t * f) * a);
for (var i = 0; i < length; i++)
{
    with (flame[i])
    {
        var _t = other.t - (i * other.delay);
        x = xstart + (cos(_t * other.f) * other.a);
        y = ystart;
        speed = 0;
    }
}
