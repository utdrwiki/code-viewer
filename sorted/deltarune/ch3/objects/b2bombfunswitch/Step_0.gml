if (place_meeting(x, y, obj_mainchara_board))
{
    if (pressed == 0)
    {
        snd_play(snd_board_splash);
        pressed = 1;
    }
}
image_index = pressed;
