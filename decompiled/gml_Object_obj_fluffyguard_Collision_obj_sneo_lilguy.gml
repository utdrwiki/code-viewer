if (active == false)
    return;
with (other)
{
    snd_play_pitch(snd_bomb, (1.1 + random(0.2)))
    scr_afterimage_cut()
    instance_destroy()
}
if (alarm[0] > 0)
    return;
snd_play(snd_damage)
hp -= 10
alarm[0] = 10
snd_play(snd_hurt1)
