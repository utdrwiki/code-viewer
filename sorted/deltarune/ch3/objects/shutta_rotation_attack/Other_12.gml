var _rotator = self;
if (surface_exists(snapshot))
    surface_free(snapshot);
var _xdif = 0;
var _ydif = 0;
if (difficulty >= 4 && timer < lerp_time)
{
    _xdif = pivotx;
    _ydif = pivoty;
    var _ease = scr_ease_inout(timer / lerp_time, 2);
    pivotx = lerp(x, targetx, _ease);
    pivoty = lerp(y, targety, _ease);
    _xdif = pivotx - _xdif;
    _ydif = pivoty - _ydif;
    timer++;
}
if (difficulty != 4)
    rotation += (rotspd * rotSign);
for (i = 0; i < listsize; i++)
{
    with (bullets[i])
    {
        x += _xdif;
        y += _ydif;
        if (other.difficulty != 4)
        {
            scr_orbitaroundpoint(other.pivotx, other.pivoty, other.rotspd * other.rotSign);
            image_angle += (other.rotspd * other.rotSign);
        }
        if (other.motion_blur && v_ex("afterimage"))
        {
            for (var _af = 0; _af < other.afterimage_count; _af++)
            {
                with (afterimage[_af])
                {
                    x += _xdif;
                    y += _ydif;
                    if (_rotator.difficulty != 4)
                    {
                        scr_orbitaroundpoint(_rotator.pivotx, _rotator.pivoty, _rotator.rotspd * _rotator.rotSign);
                        image_angle += (_rotator.rotspd * _rotator.rotSign);
                    }
                }
            }
        }
    }
}
with (border)
{
    x += _xdif;
    y += _ydif;
    if (other.difficulty != 4)
    {
        scr_orbitaroundpoint(other.pivotx, other.pivoty, other.rotspd * other.rotSign);
        image_angle += (other.rotspd * other.rotSign);
    }
}
with (hand_a)
{
    x += _xdif;
    y += _ydif;
    if (other.difficulty != 4)
    {
        scr_orbitaroundpoint(other.pivotx, other.pivoty, other.rotspd * other.rotSign);
        image_angle += (other.rotspd * other.rotSign);
    }
}
with (hand_b)
{
    x += _xdif;
    y += _ydif;
    if (other.difficulty != 4)
    {
        scr_orbitaroundpoint(other.pivotx, other.pivoty, other.rotspd * other.rotSign);
        image_angle += (other.rotspd * other.rotSign);
    }
}
if (instance_exists(extra_sprite_obj))
{
    with (extra_sprite_obj)
    {
        x += _xdif;
        y += _ydif;
        if (other.difficulty != 4)
        {
            scr_orbitaroundpoint(other.pivotx, other.pivoty, other.rotspd * other.rotSign);
            image_angle += (other.rotspd * other.rotSign);
        }
    }
}
if (difficulty != 4)
{
    if (con == 3 && rotspd > 0)
        rotspd = scr_movetowards(rotspd, 0, decel);
    else if (con == 2 && rotspd < max_rotate_speed)
        rotspd = scr_movetowards(rotspd, max_rotate_speed, accel);
}
