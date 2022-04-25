if (wobbled == 0)
{
    if instance_exists(obj_mainchara_ch1)
    {
        if (obj_mainchara_ch1.x > (x - 10) && obj_mainchara_ch1.x < (x + 50))
        {
            s = snd_play_ch1(snd_wobbler_ch1)
            snd_pitch_ch1(s, (0.8 + random(0.3)))
            image_speed = 0.2
            wobbled = 1
        }
    }
}
