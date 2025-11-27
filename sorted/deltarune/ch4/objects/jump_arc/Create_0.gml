master = -1;
origx = 0;
origy = 0;
goalx = 0;
goaly = 0;
zheight = 0;
time = 1;
timer = 1;

jump_start = function()
{
    _hspeed = (goalx - origx) / time;
    _vspeed = (goaly - origy) / time;
};

tick = function()
{
    if (!i_ex(master))
        instance_destroy();
    with (master)
    {
        x += other._hspeed;
        y += other._vspeed;
        z = sin((pi / other.time) * other.timer) * other.zheight;
    }
    timer++;
    if (timer > time)
        instance_destroy();
};
