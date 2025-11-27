var _channelnumber = obj_lightemup_controller.channelnumber % 5;
if (_channelnumber == 1)
    targetsprite = 229;
if (_channelnumber == 2)
    targetsprite = 3065;
if (_channelnumber == 3)
    targetsprite = 3860;
if (_channelnumber == 4)
    targetsprite = 4760;
if (_channelnumber == 0)
    targetsprite = 667;
if (sprite_index == spr_ball_collision_full_3xscale)
{
    if (_channelnumber == 1)
        targetsprite = 4670;
    if (_channelnumber == 2)
        targetsprite = 3897;
    if (_channelnumber == 3)
        targetsprite = 510;
    if (_channelnumber == 4)
        targetsprite = 3986;
    if (_channelnumber == 0)
        targetsprite = 3360;
}
