if (hp <= 0)
    exit;
hp--;
snd_play(snd_damage);
if (hp == 0)
{
    image_index = 3 + reverse_image;
    hurtCon = 2;
    fall_speed = -9;
    hspeed = sign(obj_susiezilla.image_xscale) * 3;
}
else
{
    recoilDir = sign(obj_susiezilla.image_xscale);
    reverse_image = recoilDir < 0;
    hurtCon = 1;
    image_index = 1 + reverse_image;
    recoilSpeed = 5;
}
