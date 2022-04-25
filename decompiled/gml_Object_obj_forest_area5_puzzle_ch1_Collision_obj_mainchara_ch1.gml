qualify = 0
if (type == 0)
{
    if (obj_mainchara_ch1.y >= (y + 200) && last_touched != 1)
    {
        qualify = 1
        last_touched = 1
    }
    if (obj_mainchara_ch1.y <= (y + 200) && last_touched != 0)
    {
        qualify = 1
        last_touched = 0
    }
}
if (type == 1 && last_touched != -1)
{
    if (obj_mainchara_ch1.x >= (x + 200) && last_touched != 3)
    {
        qualify = 1
        last_touched = 3
    }
    if (obj_mainchara_ch1.x <= (x + 200) && last_touched != 2)
    {
        qualify = 1
        last_touched = 2
    }
}
if (qualify == 1)
{
    with (object_index)
    {
        if (last_touched == -1)
            last_touched = 4
    }
    if (obj_darkponman_ow_ch1.max_battlealpha < 1.9)
    {
        snd_play_ch1(snd_wing_ch1)
        with (obj_darkponman_ow_ch1)
        {
            max_battlealpha += 0.12
            if (max_battlealpha > 1.9)
                max_battlealpha = 1.9
        }
    }
}
