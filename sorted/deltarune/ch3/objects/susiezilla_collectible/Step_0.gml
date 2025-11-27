scr_depth_pivot();
if (jump == 1)
    depth = -9999999;
timer++;
var _ystart = ystart;
if (_ystart < 200)
    _ystart = 200;
if (forcey != 0)
    _ystart = forcey;
if (jump == 1 && vspeed > 0 && (y + vspeed) > _ystart)
{
    jump = 0;
    y = _ystart;
    vspeed = 0;
    gravity = 0;
    hspeed = 0;
    friction = 0;
}
if (timer > 180)
{
    if (visible == true)
        visible = false;
    else
        visible = true;
}
if (timer == 270)
    instance_destroy();
