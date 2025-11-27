timer++;
var timelimit = 8;
turn = (timer * 1) / timelimit;
if (timer > (timelimit - 1) && triggered < 1)
{
    triggered++;
    timer = 0;
}
if (!triggered)
    dist = mydist;
else
    dist = mydist - (timer * (mydist / timelimit));
if (dist < 0)
    dist = 0;
if (timer > ((timelimit * 2) + 10))
{
    snd_stop(loopsnd);
    snd_play(snd_board_shine_get);
    instance_destroy();
}
for (var i = 0; i < 4; i++)
    draw_sprite_ext(spr_board_sparkle, timer * 0.125, scr_even(x + lengthdir_x(dist, (i + turn) * 90)), scr_even(y + lengthdir_y(dist, (i + turn) * 90)), 2, 2, 0, c_white, 1);
