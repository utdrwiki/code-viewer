timer++;
if (timer == throwsframes && global.turntimer > 30 && lerpdowntimer < (attackduration - 20))
{
    snd_stop(snd_smallswing);
    snd_play_pitch(snd_smallswing, 1 + random(0.3));
    var rep = 1;
    var a = 0;
    repeat (rep)
    {
        bulletshot = instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bro_hammer);
        with (bulletshot)
            scr_bullet_init();
        bulletshot.active = 1;
        bulletshot.image_xscale = 2;
        bulletshot.image_yscale = 2;
        bulletshot.fakehspeed = -2 - random(4.8);
        bulletshot.fakevspeed = -14;
        bulletshot.gravity_direction = 270;
        bulletshot.fakegravity = 0.6;
        bulletshot.depth = depth - 1;
        bulletshot.target = 3;
        bulletshot.damage = 1;
        bulletshot.grazed = 0;
        bulletshot.grazepoints = 2.5;
        if (y < (ystart + 50))
            bulletshot.fakevspeed = -10;
        if (pattern == 1)
            bulletshot.fakehspeed = -2.8 - (count / 4);
        if (pattern == 2)
            bulletshot.fakehspeed = -6.8 + (count / 3);
        if (count == 2 || count == 4)
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
    if (throwsframes != 1)
    {
        bulletshot = instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bro_hammer);
        with (bulletshot)
            scr_bullet_init();
        bulletshot.active = 1;
        bulletshot.image_xscale = 2;
        bulletshot.image_yscale = 2;
        bulletshot.fakehspeed = -2 - random(4.8);
        bulletshot.fakevspeed = -12 - random(4);
        bulletshot.gravity_direction = 270;
        bulletshot.fakegravity = 0.6;
        bulletshot.depth = depth - 1;
        bulletshot.target = 3;
        bulletshot.damage = 1;
        bulletshot.grazed = 0;
        bulletshot.grazepoints = 2.5;
        if (y < (ystart + 50))
            bulletshot.fakevspeed = -10;
        if (count == 2 || count == 4)
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
        bulletshot = instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bro_hammer);
        with (bulletshot)
            scr_bullet_init();
        bulletshot.active = 1;
        bulletshot.image_xscale = 2;
        bulletshot.image_yscale = 2;
        bulletshot.fakehspeed = -2 - random(4.8);
        bulletshot.fakevspeed = -12 - random(4);
        bulletshot.gravity_direction = 270;
        bulletshot.fakegravity = 0.6;
        bulletshot.depth = depth - 1;
        bulletshot.target = 3;
        bulletshot.damage = 1;
        bulletshot.grazed = 0;
        bulletshot.grazepoints = 2.5;
        if (y < (ystart + 50))
            bulletshot.fakevspeed = -10;
        if (count == 2 || count == 4)
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
    timerb = 3;
}
if (timerb > 0)
    timerb--;
if (timerb == 1 && image_index == 1)
    image_index = 2;
if (timer == (throwsframes * 2))
{
    image_index = 0;
    count++;
    if (pausecount <= count)
    {
        count = 0;
        if (pattern > 0)
        {
            alarm[0] = 5;
            timer = -23;
        }
        else
        {
            timer = -11;
            alarm[0] = 30;
        }
    }
    else
    {
        timer = 0;
    }
}
if (con == 0 && pattern == 0)
{
    jumptimer++;
    if (jumptimer == jumptimermax)
    {
        if (con2 == 0)
        {
            startx = x;
            starty = y;
            targetx = x - 50;
            targety = y;
            con2 = 1;
        }
        else
        {
            startx = x;
            starty = y;
            targetx = x + 50;
            targety = y;
            con2 = 0;
        }
        jumptimer = 0;
        jumptimermax = 30 + irandom(12);
        con = 1;
        snd_play_pitch(snd_jump, 2);
    }
}
if (con == 1)
{
    jumptimer++;
    fakey = -15 + (sin(jumptimer / 7.4) * 100 * -1);
    x = lerp(startx, targetx, jumptimer / 24);
    y = lerp(starty, targety, jumptimer / 24);
    y += fakey;
    if (jumptimer == 24)
    {
        y = starty;
        con = 0;
        jumptimer = 0;
    }
}
if (vspeed > 0 && y >= (ystart + 84) && endtimer == 0)
{
    vspeed = 0;
    gravity = 0;
    y = ystart + 92;
}
if (vspeed > 0 && y >= (ystart - 10) && endtimer != 0)
{
    vspeed = 0;
    gravity = 0;
    y = ystart;
    instance_destroy();
}
lerpdowntimer++;
if (lerpdowntimer < 20)
{
    if (lerpdowntimer == 1)
    {
        snd_play_pitch(snd_jump, 2);
        vspeed = -14;
        gravity = 2;
    }
}
if (lerpdowntimer >= (attackduration - 20) && con == 0)
{
    image_index = 0;
    if (global.turntimer > 20)
        global.turntimer = 20;
    endtimer++;
    if (endtimer == 1)
    {
        snd_play_pitch(snd_jump, 2);
        vspeed = -20.6;
        gravity = 2;
    }
}
if (global.turntimer < 1)
    instance_destroy();
