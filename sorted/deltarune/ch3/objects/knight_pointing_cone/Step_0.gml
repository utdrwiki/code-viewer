timerb++;
if (timerb == 3)
{
    snd_play_x(snd_knight_drawpower, 1, 1.3);
    snd_play_x(snd_knight_drawpower, 1, 1.3);
    snd_play_x(snd_knight_drawpower, 1, 1.3);
}
if (timerb == 120)
{
    var a = 2;
    var b = 0.7;
    snd_play_x(snd_knight_star_explosion_close, a, b);
    snd_play_x(snd_knight_star_explosion_close, a, b);
    snd_play_x(snd_knight_star_explosion_close, a, b);
}
if (con == 4)
{
    x = lerp(x, obj_knight_enemy.x, 0.15);
    y = lerp(y, obj_knight_enemy.y, 0.15);
    if (tween == 0)
    {
        con = 5;
        if (i_ex(obj_knight_enemy))
        {
            obj_knight_enemy.visible = true;
            obj_knight_enemy.aetimer = aetimer;
        }
    }
}
else if (tween < 1)
{
    tween = scr_movetowards(tween, 1, 0.05);
    var _ease = scr_ease_out(tween, 4);
    x = lerp(xstart, obj_growtangle.x + 115, _ease);
    y = lerp(ystart, obj_growtangle.y - 56, _ease);
}
if (con < 2)
{
    exit;
}
else if (global.turntimer <= endtimer)
{
    if (angle_lerp == 1)
    {
        var _count = 0;
        with (obj_knight_pointing_star)
        {
            other.starlist[_count] = self;
            con = 1;
            _count++;
        }
        for (i = 0; i < _count; i++)
        {
            with (starlist[i])
            {
                timer = -other.i;
                if ((other.i % 2) == 1)
                    playSound = false;
            }
        }
        knockback = 10;
    }
    if (angle_lerp == 0 && con < 3)
    {
        timer = 10;
        con = 3;
        yoff = 120 + irandom_range(-60, 60);
    }
    angle_lerp = scr_movetowards(angle_lerp, 0, 0.1);
    angle = lerp(0, target_angle, scr_ease_in(angle_lerp, 6));
}
else if (angle < target_angle)
{
    angle_lerp = scr_movetowards(angle_lerp, 1, 0.025);
    angle = lerp(0, target_angle, scr_ease_out(angle_lerp, 6));
}
else
{
    x += 0.25;
}
if (knockback != 0)
{
    var _knockback = scr_ease_in(knockback / 10, 5) * 10;
    gt_x -= _knockback;
    knockback = scr_movetowards(knockback, 0, 0.5);
    fake_gt.xoffset = random_range(-1, 1) * (_knockback / 10);
    fake_gt.yoffset = random_range(-1, 1) * (_knockback / 10);
}
else
{
    gt_x -= (angle / target_angle / 2);
    fake_gt.xoffset = random_range(-1, 1) * (angle / target_angle);
    fake_gt.yoffset = random_range(-1, 1) * (angle / target_angle);
}
obj_growtangle.x = round(gt_x);
obj_heart.x = min(obj_heart.x, gt_maxx() - 22);
