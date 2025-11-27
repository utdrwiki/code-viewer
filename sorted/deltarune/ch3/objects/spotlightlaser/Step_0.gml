if (change_sides)
{
    if (i_ex(obj_susiezilla_player))
    {
        if (obj_susiezilla_player.myxcenter < x)
            facing = 0;
        else
            facing = 1;
    }
}
var lx = 0;
var rx = 1280;
with (obj_susiezilla_gamecontroller)
{
    lx = xorig;
    rx = xorig + width;
}
if (friendly)
    exit;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
myxcenter = x;
myycenter = y;
var _hit = instance_place(x, y, obj_susiezilla_player);
if (i_ex(_hit) && con == 1)
{
    var hitx = mean(x, _hit.x + 32);
    var hity = mean(y, _hit.y + 40);
    var hitdir = point_direction(x, y, _hit.x + 32, _hit.y + 40);
    if (_hit.canmove)
    {
        if (_hit.hitactive && !unstoppable)
        {
            friendly = true;
            snd_stop(snd_rudebuster_hit);
            snd_play_x(snd_rudebuster_hit, 0.5, 1);
            speed = 16;
            with (instance_create_depth(x, y, depth - 100, obj_susiezilla_parry_effect))
                image_angle = hitdir + 90;
            direction = point_direction(_hit.oldxcenter, _hit.oldycenter, xprevious, yprevious);
        }
        else if (!_hit.invuln)
        {
            mask_index = -1;
            if (instance_place(x, y, obj_susiezilla_player))
            {
                snd_stop(snd_punchmed);
                snd_play_pitch(snd_punchmed, 0.75);
                scr_susiezilla_hiteffect(_hit);
                if (unstoppable)
                {
                    _hit.take_hit_unblockable(facing, damage, knockback);
                }
                else
                {
                    _hit.take_hit(sign(_hit.oldxcenter - x), damage, knockback);
                    if (destroy_onhit && !friendly)
                    {
                        bounce_off_dir = -sign(_hit.oldxcenter - x);
                        bounce_off();
                        instance_destroy();
                    }
                }
            }
        }
    }
}
