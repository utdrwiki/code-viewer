if (place_meeting(x, y, obj_board_lawnmower))
{
    instance_create(x, bbox_bottom - 32, obj_board_smokepuff);
    safe_delete(mysolid);
    with (obj_board_lawnmower)
        speed *= 0.99;
    snd_play(snd_board_splash);
    snd_play_x(snd_noise, 0.5, 0.2);
    instance_destroy();
}
