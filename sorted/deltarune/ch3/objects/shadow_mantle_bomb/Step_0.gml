if (init == 0)
{
    if (con == 0)
    {
        snd_stop(snd_board_throw);
        snd_play_x(snd_board_throw, 0.7, 0.8);
    }
    init = 1;
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        timer = 0;
        con = 1;
        distancex = xstart - targetx;
        distancey = ystart - targety;
    }
    depth = -9999999999999;
    if (kris != 0)
        depth = kris.depth - 1;
}
if (con == 1)
{
    timer += 2;
    x = lerp(xstart, targetx, timer / 60);
    y = lerp(ystart, targety, timer / 60);
    fakey = -15 + (sin(timer / 19) * 100 * -1);
    if (timer == 60)
    {
        depth = savedepth;
        timer = 0;
        con = 2;
        snd_stop(snd_bump);
        snd_play(snd_bump);
    }
}
if (con == 2)
{
    scr_depth_board();
    timer++;
    if (timer > 10)
        image_index++;
    if (timer == 20)
    {
        cloud = instance_create((x - 16) + 4, y - 20 - 10, obj_shadow_mantle_cloud);
        cloud.type = type;
        cloud.depth = depth - 10;
        snd_stop(snd_board_bomb);
        snd_play(snd_board_bomb);
        instance_destroy();
    }
}
