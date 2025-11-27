if (used == false)
{
    if (place_meeting(x, y, obj_mainchara_board) || place_meeting(x, y, obj_pushableblock_board))
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
    if (pressinit == 0)
        snd_play_pitch(snd_noise, 1.4);
    pressinit = 1;
    var a = 0;
    for (var i = 0; i < instance_number(obj_board_glacier_switch); i++)
    {
        button[i] = instance_find(obj_board_glacier_switch, i);
        if (button[i].pressed == true)
            a++;
    }
    if (a == 2 && used == false)
    {
        used = true;
        with (obj_board_enemy_spawner)
        {
            if (x >= 128 && x <= 480 && y >= 64 && y <= 288)
            {
                if (image_index == 19 && type == 0)
                    instance_destroy();
            }
        }
        with (obj_board_enemy_spawner)
        {
            if (x > 128 && x < 480 && y > 64 && y < 288 && image_index == 20)
                instance_destroy();
        }
        with (obj_board_icepuzzle_wall)
            con = 1;
        snd_play(snd_impact);
    }
}
else
{
    if (pressinit == 1)
        snd_play_pitch(snd_noise, 1.1);
    pressinit = 0;
}
