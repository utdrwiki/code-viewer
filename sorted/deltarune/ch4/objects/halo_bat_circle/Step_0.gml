if (!i_ex(obj_growtangle))
    exit;
if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (con == 0)
{
    animtimer++;
    if (animtimer == 10)
    {
        animtimer = 0;
        con = 1;
    }
    else
    {
        exit;
    }
}
if (con == 2 && animtimer < 10)
    animtimer++;
timer++;
move_factor = scr_approach_curve(move_factor, 0, 15);
targangle -= turnrate;
var xtarg, ytarg;
if (reset)
{
    con = 2;
    xtarg = xstart;
    ytarg = ystart;
}
else
{
    xtarg = obj_growtangle.x + lengthdir_x(targdist, targangle);
    ytarg = obj_growtangle.y + lengthdir_y(targdist, targangle);
}
if (con == 2)
    move_factor = 4;
x = scr_approach_curve(x, xtarg, move_factor);
y = scr_approach_curve(y, ytarg, move_factor);
if (timer == (timer_shoot - 10) && global.turntimer >= 28)
{
    flash_alpha = 1.4;
    snd_play_volume(snd_bell_bounce_short, 0.5);
}
if (i_ex(obj_heart))
{
    if (timer >= floor(timer_shoot / (1 + (scr_monsterpop() == 1))) && global.turntimer >= 18)
    {
        snd_play(motor_swing_down);
        var dir = scr_at_player(x, y);
        if (scr_monsterpop() == 1 && ((shoot_counter > 0 && irandom(2)) || shoot_counter > 2))
        {
            dir += choose(-35, -20, 20, 35);
            shoot_counter = -1;
        }
        scr_fire_bullet(x, y, obj_halo_bat_ring_bullet, dir, 7.5, spr_bullet_ring);
        with (obj_halo_bat_ring_bullet)
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 4;
        }
        timer = 0;
        shoot_counter++;
    }
}
if (global.turntimer < 18 && !reset)
{
    reset = true;
    move_factor = 12;
}
