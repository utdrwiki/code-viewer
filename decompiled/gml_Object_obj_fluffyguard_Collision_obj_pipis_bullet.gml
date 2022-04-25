if (active == false)
    return;
with (other)
    event_user(1)
if (alarm[0] > 0)
    return;
hp -= 10
alarm[0] = 10
snd_play(snd_hurt1)
