timer++;
if (timer == throwsframes)
{
    snd_stop(snd_smallswing);
    snd_play_pitch(snd_smallswing, 1 + random(0.3));
    var rep = 1;
    var a = 0;
    repeat (rep)
    {
        bulletshot = instance_create(x + 100, y + 90, obj_gerson_hammer_bro_hammer);
        with (bulletshot)
            scr_bullet_init();
        bulletshot.active = 1;
        bulletshot.image_xscale = 2;
        bulletshot.image_yscale = 2;
        bulletshot.fakehspeed = -2.8 - random(4);
        if (y < (ystart + 50))
            bulletshot.fakehspeed = -2 - random(4);
        bulletshot.fakevspeed = -14;
        bulletshot.gravity_direction = 270;
        bulletshot.fakegravity = 0.6;
        bulletshot.depth = depth - 1;
        bulletshot.target = 3;
        bulletshot.damage = 1;
        bulletshot.grazed = 0;
        if (pattern == 1)
            bulletshot.fakehspeed = -2.8 - (count / 3.5);
        if (pattern == 2)
            bulletshot.fakehspeed = -6.8 + (count / 3);
        if ((pattern == 0 && (count == 2 || count == 4 || count == 6)) || count == 2 || count == 4)
        {
            if (obj_heart.x < (obj_growtangle.x - 37.5))
                bulletshot.fakehspeed = -4.8 - random(2);
            else if (obj_heart.x > (obj_growtangle.x + 37.5))
                bulletshot.fakehspeed = -2 - random(1.5);
            else if (obj_heart.x < obj_growtangle.x)
                bulletshot.fakehspeed = -3.7 - random(1.5);
            else if (obj_heart.x > obj_growtangle.x)
                bulletshot.fakehspeed = -2.7 - random(2.2);
        }
    }
    image_index = 1;
}
if (timer == (throwsframes * 2))
{
    image_index = 0;
    count++;
    if (pausecount >= count)
    {
        timer = -10;
        count = 0;
        throwsframes = 1;
        alarm[0] = 20;
    }
    else
    {
        timer = 0;
    }
}
if (vspeed == 0)
{
    jumptimer++;
    if (jumptimer == jumptimermax)
    {
    }
}
if (vspeed > 0 && y >= (ystart + 92))
{
    vspeed = 0;
    gravity = 0;
    y = ystart + 100;
}
lerpdowntimer++;
if (lerpdowntimer < 20)
    y = lerp(y, ystart + 100, lerpdowntimer / 20);
if (lerpdowntimer >= (attackduration - 20))
    y = lerp(y, ystart, (lerpdowntimer - (attackduration - 20)) / 20);
if (global.turntimer < 1 || lerpdowntimer == attackduration)
    instance_destroy();
