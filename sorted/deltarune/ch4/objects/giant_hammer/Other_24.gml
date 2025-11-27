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
    var a = lerp(900, 490, timer / 20);
    var b = lerp(120, 50, timer / 20);
    var c = lerp(240, 100, timer / 20);
    image_angle = lerp(200, a, timer / 20);
    if (timer < 21)
    {
        image_alpha += 0.04;
        x = lerp(xstart, xstart - b, timer / 20);
        y = lerp(ystart, ystart - c, timer / 20);
    }
    if (timer == 20)
    {
        timer = 0;
        con = 1;
        fadecon = 1;
        snd_play(snd_punchheavythunder);
        snd_play(snd_break2);
    }
}
if (con == 1)
{
    timer++;
    if (timer == 3)
        breakcon = 1;
    var a = lerp(0, 260, timer / 9);
    image_angle = lerp(500, a, timer / 9);
    if (timer < 6)
    {
        x = lerp(xstart - 50, xstart, timer / 6);
        y = lerp(ystart - 100, ystart + 100, timer / 6);
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
if (type == 2 && con == 2)
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
    breakcon = 2;
    with (obj_spearblocker)
    {
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
        instance_destroy();
    }
    with (obj_spearshot)
        instance_destroy();
    scr_heartcolor("red");
}
