if (con == 0)
{
    image_angle = 0;
    if (i_ex(collision_rectangle(x - 4, y + 10, x + 4, y + 20, obj_climb_kris, true, true)))
        con = 1;
}
if (con == 1)
{
    if (doreset)
    {
        with (obj_climb_mover)
            reset = 1;
    }
    rung++;
    snd_play_pitch(sndtoplay, mypitch);
    con = 2;
    timer = 0;
}
if (con == 2)
{
    timer++;
    image_angle += (sin(timer) * 8);
    if (timer >= 10)
        con = 0;
}
