if (ball == -4)
{
    scr_minishakeobj();
    snd_play(snd_noise);
    ball = instance_create(x + 10, y + 15, obj_homealone_present_fallen_ball);
    ball.auto_depth = false;
    ball.depth = 39900;
    with (ball)
        scr_move_to_point_over_time(x + 30, y, 10);
}
alarm[10] = 1;
