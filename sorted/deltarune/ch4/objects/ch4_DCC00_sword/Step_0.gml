if (!is_active)
    exit;
sword_timer++;
if (sword_timer == 1)
{
    snd_play_x(snd_knight_jump_quick, 1, 1.3);
    var _xpos = flip_side ? (camerax() + 600) : (camerax() + 40);
    sword_marker = scr_dark_marker(_xpos, target_y_pos, spr_roaringknight_sword3);
    sword_marker.image_angle = 0;
    sword_marker.image_xscale = flip_side ? -2 : 2;
    sword_marker.image_yscale = 2;
    with (sword_marker)
    {
        image_alpha = 0;
        depth = 5900;
    }
}
if (sword_timer == 2)
{
    with (sword_marker)
    {
        var _xpos2 = other.flip_side ? (camerax() + 560) : (camerax() + 80);
        scr_lerpvar("x", x, _xpos2, 10, -1, "out");
        scr_lerpvar("image_alpha", 0, 1, 20, 3, "out");
    }
}
if (sword_timer == 15)
{
    snd_play(motor_swing_down);
    with (sword_marker)
    {
        hspeed = -25 * (other.flip_side ? -1 : 1);
        gravity_direction = other.flip_side ? 180 : 360;
        gravity = 4;
    }
    scr_doom(sword_marker, 50);
}
if (sword_timer == 32)
{
    destroyed = true;
    instance_create(x, y, obj_shake);
    snd_play(snd_explosion_mmx3);
}
if (sword_timer == 38)
{
    is_active = false;
    sword_timer = 0;
    destroyed = false;
}
if (sword_timer == 75)
{
}
