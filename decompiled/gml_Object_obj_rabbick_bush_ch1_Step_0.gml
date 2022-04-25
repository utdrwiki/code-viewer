if instance_exists(obj_mainchara_ch1)
{
    mx = (obj_mainchara_ch1.x + (obj_mainchara_ch1.sprite_width / 2))
    ox = (x + (sprite_width / 2))
    if (abs((mx - ox)) <= radius && obj_mainchara_ch1.y >= y && con == 0)
    {
        snd_play_ch1(snd_wing_ch1)
        lo = snd_play_ch1(snd_wing_ch1)
        snd_pitch_ch1(lo, 0.8)
        con = 1
        visible = true
        rabbick = instance_create_ch1(x, y, obj_chaseenemy_ch1)
        rabbick.vspeed = 16
    }
}
