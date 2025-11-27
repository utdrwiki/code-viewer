if (force_depth == -999999)
    depth = 10000 - (y + 45);
else
    depth = force_depth;
with (obj_susiezilla_gamecontroller)
{
    var sourcedude = other.id;
    if (gameover)
    {
        other.image_speed = 0;
        with (obj_lerpvar)
        {
            if (target == sourcedude)
                instance_destroy();
        }
        exit;
    }
}
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
if (y <= 140)
{
    y = 140;
    vspeed = -vspeed;
}
var lx = 0;
var rx = 1280;
with (obj_susiezilla_gamecontroller)
{
    lx = xorig;
    rx = xorig + width;
}
if (x < (lx - 64) || x > (rx + 64))
    instance_destroy();
if (friendly)
    exit;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
myxcenter = x;
myycenter = y;
if (object_index != obj_susiezilla_laser_segment)
    mask_index = spr_tennis_ball_bullet_extra_mask;
var _hit = instance_place(x, y, obj_susiezilla_player);
if (i_ex(_hit))
{
    var hitx = mean(x, _hit.x + 32);
    var hity = mean(y, _hit.y + 40);
    var hitdir = point_direction(x, y, _hit.x + 32, _hit.y + 40);
    if (_hit.canmove)
    {
        if ((_hit.hitactive && !unstoppable) || (_hit.dashcon == 3 && _hit.dashtimer < 5 && !unstoppable))
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
mask_index = -1;
