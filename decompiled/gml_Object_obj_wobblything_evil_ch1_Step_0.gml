if (wobbled == 0)
{
    if (instance_exists(obj_mainchara_ch1) && global.interact == 0)
    {
        if (obj_mainchara_ch1.x > (x - 20) && obj_mainchara_ch1.x < (x + 50))
        {
            if (!instance_exists(obj_battlealphaer_ch1))
            {
                d = instance_create_ch1(0, 0, obj_battlealphaer_ch1)
                d.depth = 800000
            }
            with (obj_mainchara_ch1)
            {
                battlemode = 1
                threebuffer = 2
            }
            s = snd_play_ch1(snd_wobbler_ch1)
            snd_pitch_ch1(s, (0.5 + random(0.2)))
            s2 = snd_play_ch1(snd_wobbler_ch1)
            snd_pitch_ch1(s2, (0.9 + random(0.2)))
            image_speed = 0.2
            wobbled = 1
            for (i = 0; i < 3; i += 1)
            {
                dbullet = instance_create_ch1(x, y, obj_overworld_spade_ch1)
                with (dbullet)
                {
                    damage = 15
                    sprite_index = spr_wobblebullet_ch1
                    image_alpha = 0.7
                    image_xscale = 2
                    image_yscale = 2
                }
                dbullet.speed = 10
                dbullet.direction = (250 + (i * 20))
            }
        }
    }
}
