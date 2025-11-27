if (active)
{
    if (visitinit == 0 && obj_board_camera.con == 0)
    {
        var open = false;
        with (obj_mainchara_board)
        {
            if (boat == true)
                open = true;
        }
        if (open)
            depth = 100000;
        else
            depth = 999990;
        if (image_index == 0)
        {
            if (open == true)
            {
                doopen = true;
                doclose = false;
            }
        }
        else if (open == false)
        {
            doopen = false;
            doclose = true;
        }
        visitinit = 1;
    }
}
else
{
    visitinit = 0;
}
if (doopen)
{
    if (image_index < 3)
    {
        image_index += 0.25;
        if (image_index >= 3)
        {
            snd_play(snd_board_door_close);
            image_index = 3;
            doopen = false;
        }
    }
}
if (doclose)
{
    if (image_index > 0)
    {
        image_index -= 0.25;
        if (image_index < 1)
        {
            snd_play(snd_board_splash);
            image_index = 0;
            doclose = false;
        }
    }
}
image_index = clamp(image_index, 0, 3);
