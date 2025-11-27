if (used == false)
{
    if (place_meeting(x, y, obj_mainchara_board) || place_meeting(x, y, obj_board_enemy_deer) || place_meeting(x, y, obj_pushableblock_board))
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
    if (soundplayed == 0)
    {
        soundplayed = 1;
        snd_play_pitch(snd_noise, 1.4);
    }
}
if (!pressed)
{
    if (soundplayed == 1)
    {
        soundplayed = 0;
        snd_play_pitch(snd_noise, 1.1);
    }
}
