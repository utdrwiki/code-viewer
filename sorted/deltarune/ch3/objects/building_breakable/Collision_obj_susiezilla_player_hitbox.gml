if (con == 3)
    exit;
if (con == 4)
    exit;
if (con == 1)
{
    con = 2;
    timer = 0;
    hp -= other.damage;
    image_index++;
    if (image_index > 2)
        image_index = 2;
    repeat (3)
        event_user(0);
    shakeobj = instance_create(x, y, obj_shakeobj_susiezilla);
    shakeobj.target = id;
    shakeobj.shakeamt = 12;
    shakeobj.shakereduct = 1;
    with (shakeobj)
        event_user(0);
    snd_stop(snd_damage);
    snd_play(snd_damage);
    with (other)
        event_user(0);
}
if (hp < 1)
{
    con = 3;
    repeat (3)
        event_user(0);
}
