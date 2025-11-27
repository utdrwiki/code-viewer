if (place_meeting(x, y, obj_mainchara_board))
    pressed = 1;
else
    pressed = 0;
if (disabled == true)
    pressed = 2;
if (pressed == 1)
{
    if (pressinit == 0)
    {
        snd_play_pitch(snd_noise, 1.4);
        if (!aesthetic)
        {
            pot1 = instance_create_board(1, 5, obj_board_grabbleObject);
            pot2 = instance_create_board(1, 6, obj_board_grabbleObject);
            instance_create_board(1, 5, obj_board_smokepuff);
            instance_create_board(1, 6, obj_board_smokepuff);
        }
    }
    pressinit = 1;
}
else
{
    if (pressinit == 1)
    {
        snd_play_pitch(snd_noise, 1.1);
        if (!aesthetic)
        {
            if (i_ex(pot1))
            {
                instance_create(pot1.x, pot1.y, obj_board_smokepuff);
                with (pot1)
                    instance_destroy();
            }
            if (i_ex(pot2))
            {
                instance_create(pot2.x, pot2.y, obj_board_smokepuff);
                with (pot2)
                    instance_destroy();
            }
        }
    }
    pressinit = 0;
}
