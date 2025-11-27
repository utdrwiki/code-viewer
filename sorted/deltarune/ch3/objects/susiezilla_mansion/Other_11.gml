hp--;
if (hp < 45)
    image_index = 1;
if (hp < 24)
    image_index = 2;
flashtimer = 3;
hittimer = 9;
snd_stop(snd_damage);
snd_play(snd_damage);
shakeobj = instance_create(x, y, obj_shakeobj_susiezilla);
shakeobj.target = id;
shakeobj.shakeamt = 6;
shakeobj.shakereduct = 1;
with (shakeobj)
    event_user(0);
if (image_xscale > 0)
    piece = instance_create((x - 50) + random(75), (y - 100) + random(50), obj_susiezilla_building_piece);
else
    piece = instance_create(((x - 50) + random(75)) - 80, (y - 100) + random(50), obj_susiezilla_building_piece);
piece.vspeed = -8;
piece.hspeed = -2 + random(4);
piece.gravity_direction = 270;
piece.gravity = 0.5;
piece.depth = depth - 10;
if (hp < (hpmax * 0.9) && trasurecon == 0)
{
    trasurecon = 1;
    collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
    collectible.itemtype = 4;
    with (collectible)
        event_user(0);
    with (collectible)
        event_user(1);
}
if (hp < (hpmax * 0.8) && trasurecon == 1)
{
    trasurecon = 2;
    collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
    collectible.itemtype = 9;
    with (collectible)
        event_user(0);
    with (collectible)
        event_user(1);
}
if (hp < (hpmax * 0.7) && trasurecon == 2)
{
    repeat (5)
    {
        trasurecon = 3;
        collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
        with (collectible)
            event_user(1);
    }
}
if (hp < (hpmax * 0.6) && trasurecon == 3)
{
    repeat (3)
    {
        trasurecon = 4;
        collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
        with (collectible)
            event_user(1);
    }
}
if (hp < (hpmax * 0.5) && trasurecon == 4)
{
    trasurecon = 5;
    collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
    collectible.itemtype = 4;
    with (collectible)
        event_user(0);
    with (collectible)
        event_user(1);
}
if (hp < (hpmax * 0.4) && trasurecon == 5)
{
    repeat (3)
    {
        trasurecon = 6;
        collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
        with (collectible)
            event_user(1);
    }
}
if (hp < (hpmax * 0.3) && trasurecon == 6)
{
    repeat (7)
    {
        trasurecon = 7;
        collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
        with (collectible)
            event_user(1);
    }
}
if (hp < (hpmax * 0.2) && trasurecon == 7)
{
    repeat (10)
    {
        trasurecon = 8;
        collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
        with (collectible)
            event_user(1);
    }
}
if (hp < (hpmax * 0.1) && trasurecon == 8)
{
    repeat (10)
    {
        trasurecon = 9;
        collectible = instance_create(x, y - 40, obj_susiezilla_collectible);
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
        with (collectible)
            event_user(1);
    }
}
