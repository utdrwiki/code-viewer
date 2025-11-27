scr_afterimage();
afterimage.fadeSpeed = 0.2;
if (con == 0 && i_ex(obj_heart) && x < obj_heart.x)
{
    if (global.turntimer < 990 && !i_ex(obj_spearblocker))
        snd_play(snd_smallswing);
    instance_create(x, y, obj_spearblocker);
    con = 1;
}
timer++;
if (timer == 100)
    instance_destroy();
draw_self();
