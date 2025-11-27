if (hit || stomped)
    exit;
snd_play(snd_punchmed);
hit = true;
alarm[1] = 30;
alarm[0] = -1;
hspeed = 0;
vspeed = 10;
instance_destroy(other);
