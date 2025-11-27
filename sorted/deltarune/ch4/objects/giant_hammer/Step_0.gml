if ((con == 0 && timer > 8) || con != 0)
{
    fakex += fakehspeed;
    if (fakehspeed < 0)
        fakehspeed += 0.6;
    else
        fakehspeed = 0;
}
if (con == 0)
{
    timer++;
    if (timer == 3)
        snd_play(motor_upper_quick);
    if (dir == 270)
    {
        var a = lerp(900, 490, timer / 14);
        var b = lerp(100, 50, timer / 14);
        var c = lerp(200, 100, timer / 14);
        image_angle = lerp(250, a, timer / 14);
        if (timer < 16)
        {
            image_alpha += 0.06;
            x = lerp(xstart - b, xstart - b, timer / 14);
            y = lerp(ystart - 20, ystart - 20 - c, timer / 14);
        }
    }
    if (dir == 0)
    {
        var a = lerp(990, 580, timer / 14);
        image_angle = lerp(340, a, timer / 14);
        var c = lerp(200, 100, timer / 14);
        var b = lerp(100, 120, timer / 14);
        if (timer < 16)
        {
            image_alpha += 0.06;
            x = lerp(xstart - 20, xstart - 20 - c, timer / 14);
            y = lerp(ystart + b, ystart + b, timer / 14);
        }
    }
    if (dir == 90)
    {
        var a = lerp(1080, 670, timer / 14);
        image_angle = lerp(430, a, timer / 14);
        var b = lerp(100, 50, timer / 14);
        var c = lerp(200, 100, timer / 14);
        if (timer < 16)
        {
            image_alpha += 0.06;
            x = lerp(xstart + b, xstart + b, timer / 14);
            y = lerp(ystart + 20, ystart + 20 + c, timer / 14);
        }
    }
    if (dir == 180)
    {
        var a = lerp(1170, 760, timer / 14);
        image_angle = lerp(520, a, timer / 14);
        var c = lerp(200, 100, timer / 14);
        var b = lerp(100, 120, timer / 14);
        if (timer < 16)
        {
            image_alpha += 0.06;
            x = lerp(xstart + 20, xstart + 20 + c, timer / 14);
            y = lerp(ystart - b, ystart - b, timer / 14);
        }
    }
    if (timer == 15)
    {
        timer = 0;
        con = 1;
        fadecon = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 3)
        breakcon = 1;
    if (dir == 270)
    {
        var a = lerp(0, 260, timer / 9);
        image_angle = lerp(500, a, timer / 9);
        if (timer < 6)
        {
            x = lerp(xstart - 50, xstart, timer / 6);
            y = lerp(ystart - 120, ystart + 100, timer / 6);
        }
    }
    if (dir == 0)
    {
        var a = lerp(90, 350, timer / 9);
        image_angle = lerp(590, a, timer / 9);
        if (timer < 6)
        {
            x = lerp(xstart - 100, xstart + 100, timer / 6);
            y = lerp(ystart + 50, ystart, timer / 6);
        }
    }
    if (dir == 90)
    {
        var a = lerp(180, 440, timer / 9);
        image_angle = lerp(680, a, timer / 9);
        if (timer < 6)
        {
            x = lerp(xstart + 50, xstart, timer / 6);
            y = lerp(ystart + 120, ystart - 100, timer / 6);
        }
    }
    if (dir == 180)
    {
        var a = lerp(270, 530, timer / 9);
        image_angle = lerp(770, a, timer / 9);
        if (timer < 6)
        {
            x = lerp(xstart + 100, xstart - 100, timer / 6);
            y = lerp(ystart - 50, ystart, timer / 6);
        }
    }
    if (timer >= 9)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    timer++;
    if (timer > 5)
        image_alpha -= 0.2;
    if (image_alpha < 0)
        instance_destroy();
}
if (fadecon == 1)
{
    fakealpha += 0.2;
    if (fakealpha > 1.2)
        fadecon = 2;
}
if (fadecon == 2)
{
    fakealpha -= 0.2;
    if (fakealpha < 0)
        fadecon = 0;
}
if ((type == 2 && con == 2) || breakcon == 2)
{
}
else
{
    var a = scr_afterimage();
    a.fadeSpeed = 0.08;
    a.image_alpha = image_alpha;
}
if (breakcon == 1)
{
    breakcon = 3;
    var shielddir = obj_spearblocker.image_angle + 180;
    if (shielddir >= 360)
        shielddir -= 360;
    if (abs(angle_difference(dir, shielddir)) < 61)
    {
        breakcon = 2;
        timer = 0;
        con = 3;
    }
}
if (breakcon == 2)
{
    timer++;
    if (timer == 1)
    {
        if (dir == 270)
        {
            image_angle = 0;
            y -= 39;
        }
        if (dir == 0)
        {
            image_angle = 90;
            x -= 39;
        }
        if (dir == 90)
        {
            image_angle = 180;
            y += 39;
        }
        if (dir == 180)
        {
            image_angle = 270;
            x += 39;
        }
        fadealpha = 1;
        snd_play(snd_impact);
        scr_shakeobj();
        instance_create(x, y, obj_shake);
        with (obj_afterimage)
            instance_destroy();
        with (obj_spearblocker)
        {
            shake = 10;
            fadealpha = 1;
        }
    }
    if (timer >= 8)
    {
        image_alpha -= 0.1;
        if (image_alpha < 0)
            instance_destroy();
    }
    if (timer == 7)
    {
        with (obj_heart)
        {
            anim = instance_create(x + 10, y + 10, obj_animation);
            anim.sprite_index = spr_finisher_explosion;
            anim.image_speed = 0.5;
            anim.image_index = 0;
            anim.image_xscale = 1;
            anim.image_yscale = 1;
        }
    }
    if (timer == 8)
    {
        with (obj_spearblocker)
        {
            snd_play(snd_break2);
            piece1 = instance_create(x + lengthdir_x(32, image_angle - 35), y + lengthdir_y(32, image_angle - 35), obj_spearblocker_piece);
            piece1.image_angle = image_angle;
            piece1.image_index = 1;
            piece2 = instance_create(x + lengthdir_x(32, image_angle + 35), y + lengthdir_y(32, image_angle + 35), obj_spearblocker_piece);
            piece2.image_angle = image_angle;
            piece2.image_index = 0;
            piece3 = instance_create(x + lengthdir_x(30, 45), y + lengthdir_y(30, 45), obj_spearblocker_piece);
            piece3.sprite_index = spr_green_circle_piece;
            piece3.image_angle = 0;
            piece4 = instance_create(x + lengthdir_x(30, 135), y + lengthdir_y(30, 135), obj_spearblocker_piece);
            piece4.sprite_index = spr_green_circle_piece;
            piece4.image_angle = 90;
            piece5 = instance_create(x + lengthdir_x(30, 225), y + lengthdir_y(30, 225), obj_spearblocker_piece);
            piece5.sprite_index = spr_green_circle_piece;
            piece5.image_angle = 180;
            piece6 = instance_create(x + lengthdir_x(30, 315), y + lengthdir_y(30, 315), obj_spearblocker_piece);
            piece6.sprite_index = spr_green_circle_piece;
            piece6.image_angle = 270;
            if (idealdir == 180)
            {
                piece1.vspeed = -9 - random(6);
                piece1.hspeed = 1 + random(2);
                piece2.vspeed = 5 + random(6);
                piece2.hspeed = 1 + random(2);
                piece3.vspeed = -9 - random(6);
                piece3.hspeed = 1 + random(2);
                piece4.vspeed = -9 - random(6);
                piece4.hspeed = 1 + random(2);
                piece5.vspeed = 5 + random(6);
                piece5.hspeed = 1 + random(2);
                piece6.vspeed = 5 + random(6);
                piece6.hspeed = 1 + random(2);
            }
            if (idealdir == 0)
            {
                piece1.vspeed = -9 - random(6);
                piece1.hspeed = -1 - random(2);
                piece2.vspeed = 5 + random(6);
                piece2.hspeed = -1 - random(2);
                piece3.vspeed = -9 - random(6);
                piece3.hspeed = -1 - random(2);
                piece4.vspeed = -9 - random(6);
                piece4.hspeed = -1 - random(2);
                piece5.vspeed = 5 + random(6);
                piece5.hspeed = -1 - random(2);
                piece6.vspeed = 5 + random(6);
                piece6.hspeed = -1 - random(2);
            }
            if (idealdir == 90)
            {
                piece1.vspeed = 1 - random(6);
                piece1.hspeed = 9 + random(5);
                piece2.vspeed = 1 - random(6);
                piece2.hspeed = -9 + random(5);
                piece3.vspeed = 1 - random(6);
                piece3.hspeed = 9 + random(5);
                piece4.vspeed = 1 - random(6);
                piece4.hspeed = -9 + random(5);
                piece5.vspeed = 1 - random(6);
                piece5.hspeed = -9 + random(5);
                piece6.vspeed = 1 - random(6);
                piece6.hspeed = 9 + random(5);
            }
            if (idealdir == 270)
            {
                piece1.vspeed = 1 - random(6);
                piece1.hspeed = 9 + random(5);
                piece2.vspeed = 1 - random(6);
                piece2.hspeed = -9 + random(5);
                piece3.vspeed = 1 - random(6);
                piece3.hspeed = 9 + random(5);
                piece4.vspeed = 1 - random(6);
                piece4.hspeed = -9 + random(5);
                piece5.vspeed = 1 - random(6);
                piece5.hspeed = -9 + random(5);
                piece6.vspeed = 1 - random(6);
                piece6.hspeed = 9 + random(5);
            }
            with (obj_heart)
            {
                color = c_black;
                sprite_index = spr_heart;
            }
            instance_destroy();
        }
    }
}
if (breakcon == 3)
{
    breakcon = 4;
    timer = 0;
    with (obj_spearblocker)
        vanish = 1;
    with (obj_spearshot)
        instance_destroy();
    with (obj_heart)
    {
        color = c_black;
        sprite_index = spr_heart;
        anim = instance_create(x + 10, y + 10, obj_animation);
        anim.sprite_index = spr_finisher_explosion;
        anim.image_speed = 0.5;
        anim.image_index = 0;
        anim.image_xscale = 1;
        anim.image_yscale = 1;
        inst = instance_create(obj_heart.x, obj_heart.y, obj_gerson_fakeheart);
        if (obj_spearblocker.idealdir == 180)
        {
        }
        inst.directionhit = 280;
    }
    instance_create(x, y, obj_shake);
    snd_play(snd_screenshake);
}
if (breakcon == 4)
{
    timer++;
    if (timer == 2)
    {
        global.inv = -1;
        scr_damage();
    }
}
