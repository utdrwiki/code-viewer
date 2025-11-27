if (used == false)
{
    if (place_meeting(x, y, obj_pushableblock_board))
        pressed = 1;
    else
        pressed = 0;
}
else
{
    exit;
}
if (pressed)
{
    image_index = 1;
    if (soundplayed == 0)
    {
        soundplayed = 1;
        snd_play_pitch(snd_noise, 1.4);
    }
}
if (!pressed)
{
    image_index = 0;
    if (soundplayed == 1)
    {
        soundplayed = 0;
        snd_play_pitch(snd_noise, 1.1);
    }
}
