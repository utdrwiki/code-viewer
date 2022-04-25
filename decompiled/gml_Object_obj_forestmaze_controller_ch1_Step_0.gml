if (lancercon == 1)
{
    if (obj_mainchara_ch1.y <= 480)
    {
        vspeed = -10
        lancercon = 2
        if (susie_side >= 0)
        {
            with (susie)
            {
                vspeed = -10
                sprite_index = spr_susieu_dark_ch1
                image_speed = 0.2
            }
        }
    }
}
if (battlemoder == true)
{
    if (room == room_forest_maze1_ch1)
    {
        if (obj_mainchara_ch1.y <= 480)
            obj_mainchara_ch1.battlemode = 1
    }
    if (room == room_forest_maze2_ch1)
    {
        if (obj_mainchara_ch1.y <= 640)
            obj_mainchara_ch1.battlemode = 1
    }
}
if (gen == 1)
{
    with (obj_scissordancer_ch1)
    {
        if (x <= -100)
            x += 740
    }
}
if (gen == 2)
{
    if (obj_mainchara_ch1.y <= 60 || obj_mainchara_ch1.y >= 720)
    {
        battlemode = 0
        with (obj_overworldbulletparent_ch1)
            instance_destroy()
    }
}
