if (con == 0)
{
    if (sndcon == 0)
    {
        snd_stop_ch1(snd_swing_ch1)
        snd_play_ch1(snd_swing_ch1)
        sndcon = 1
    }
    image_index = 0
    if (image_xscale < 2)
        image_xscale += 0.4
    else
    {
        image_xscale = 2
        con = 1
        timer = 0
    }
}
if (con == 1)
{
    timer += 1
    if (timer >= 8)
    {
        if (sndcon == 1 && type < 3)
        {
            snd_play_ch1(snd_joker_oh_ch1)
            sndcon = 2
        }
        image_index = 1
        con = 2
        timer = 0
        if (type == 0)
        {
            bullet = instance_create_ch1(x, y, obj_collidebullet_ch1)
            bullet.sprite_index = spr_diamondbullet_ch1
            bullet.active = true
            scr_bullet_inherit_ch1(bullet)
            with (bullet)
            {
                move_towards_point((obj_heart_ch1.x + 10), (obj_heart_ch1.y + 10), 8)
                image_angle = direction
                image_xscale = 0.7
                image_yscale = 0.7
            }
        }
        if (type == 1)
        {
            for (i = 0; i < 5; i += 1)
            {
                bullet = instance_create_ch1(x, y, obj_collidebullet_ch1)
                bullet.sprite_index = spr_spadebullet_ch1
                bullet.active = true
                bullet.offset = (18 * i)
                scr_bullet_inherit_ch1(bullet)
                with (bullet)
                {
                    move_towards_point((obj_heart_ch1.x + 10), (obj_heart_ch1.y + 10), 4.5)
                    direction = ((direction - 36) + offset)
                    image_angle = direction
                    image_xscale = 0.4
                    image_yscale = 0.4
                }
            }
        }
    }
}
if (con == 2)
{
    timer += 1
    if (timer >= 10)
    {
        con = 4
        timer = 0
    }
}
if (con == 4)
{
    if (sndcon == 2)
    {
        snd_stop_ch1(snd_swing_ch1)
        snd_play_ch1(snd_swing_ch1)
        sndcon = 3
    }
    if (image_xscale > 0)
    {
        image_xscale -= 0.4
        image_yscale += 0.2
    }
    else
    {
        image_xscale = 0
        con = 0
        instance_destroy()
    }
}
