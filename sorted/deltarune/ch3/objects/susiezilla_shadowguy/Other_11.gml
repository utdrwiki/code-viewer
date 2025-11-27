if (state == UnknownEnum.Value_7)
    exit;
snd_stop(snd_damage);
snd_play(snd_damage);
if (hp == 0)
{
    state = UnknownEnum.Value_7;
    event_user(0);
    fall_speed = -9;
    px = image_xscale * -2;
}
else
{
    state = UnknownEnum.Value_6;
    event_user(0);
    sprite_index = spr_susiezilla_shadowguy_hurt;
    image_index = 0;
    image_speed = 0;
    timer = 5;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_7
}
