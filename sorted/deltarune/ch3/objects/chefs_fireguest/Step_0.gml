if (obj_chefs_game.gameover)
{
    alarm[0] = -1;
    alarm[1] = -1;
    speed = 0;
    exit;
}
t++;
if (mode == 0)
    x = xstart + (cos(t * 0.1) * amp);
else
    x = xstart - (sin(t * 0.075) * 70);
if (sprite_index != spr_shadowman_leave)
{
    if (x > xprevious)
        image_xscale = -2;
    else
        image_xscale = 2;
}
