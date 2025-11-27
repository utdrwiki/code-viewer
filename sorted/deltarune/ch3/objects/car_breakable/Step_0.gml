if (hitted == 1 && hittype == 0)
{
    rottimer--;
    if (rottimer < 0)
    {
        image_angle += 90;
        rottimer = 4;
    }
}
if (hitted == 1 && hittype == 1)
{
    hittimer++;
    if (hittimer == 5)
    {
        direction = dirsave;
        speed = 24;
        audio_play_sound(snd_smallcar_yelp, 0, 0);
        audio_play_sound(snd_hitcar_little, 0, 0);
    }
    if (hittimer > 5)
    {
        image_angle += 25;
        speed += 0.5;
        if (speed > explodetime)
        {
            instance_destroy();
            snd_play_pitch(snd_badexplosion, 1.3);
            repeat (8)
            {
                anim = instance_create(x, y, obj_animation);
                anim.sprite_index = spr_realisticexplosion;
                anim.image_index = 0;
                anim.speed = 10 + irandom(5);
                anim.friction = 0.5 + (random(4) / 2);
                anim.direction = random(359);
                anim.image_xscale = 1;
                anim.image_yscale = 1;
            }
            collectible = instance_create(x + 16, y + 12, obj_susiezilla_collectible);
            collectible.depth = depth - 100;
            collectible.itemtype = 1;
            with (collectible)
                event_user(0);
        }
    }
}
if (cornerhittimer > 0)
    cornerhittimer--;
if (hittype == 1 && cornerhittimer == 0)
{
    if (x < (__view_get(e__VW.XView, 0) + 20))
    {
        cornerhittimer = 3;
        if (direction > 180)
            direction = 315;
        else
            direction = 45;
        instance_create(x, y, obj_shake);
        snd_play(snd_screenshake);
        x = __view_get(e__VW.XView, 0) + 20;
    }
    if (x > (__view_get(e__VW.XView, 0) + 620))
    {
        cornerhittimer = 3;
        if (direction > 0 && direction < 90)
            direction = 45;
        else
            direction = 225;
        instance_create(x, y, obj_shake);
        snd_play(snd_screenshake);
        x = __view_get(e__VW.XView, 0) + 620;
    }
    if (y < (__view_get(e__VW.YView, 0) + 20))
    {
        cornerhittimer = 3;
        if (direction > 90)
            direction = 225;
        else
            direction = 315;
        instance_create(x, y, obj_shake);
        snd_play(snd_screenshake);
        y = __view_get(e__VW.YView, 0) + 20;
    }
    if (y > (__view_get(e__VW.YView, 0) + 310))
    {
        cornerhittimer = 3;
        if (direction > 270)
            direction = 45;
        else
            direction = 135;
        instance_create(x, y, obj_shake);
        snd_play(snd_screenshake);
        y = __view_get(e__VW.YView, 0) + 310;
    }
}
if (x < (__view_get(e__VW.XView, 0) - 80) || x > (__view_get(e__VW.XView, 0) + 760) || y < (__view_get(e__VW.YView, 0) - 80) || y > (__view_get(e__VW.YView, 0) + 580))
    instance_destroy();

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
