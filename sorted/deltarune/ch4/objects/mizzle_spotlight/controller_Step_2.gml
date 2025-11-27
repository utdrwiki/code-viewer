if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (init == 0)
{
    init = 1;
    with (obj_dbulletcontroller)
    {
        if (type == 110.5)
            other.eyeattackcount++;
    }
    if (scr_monsterpop() == 1)
        difficulty = 0;
    else if (scr_monsterpop() == 2 && eyeattackcount == 2)
        difficulty = 0;
    else if (scr_monsterpop() == 3 && eyeattackcount == 3)
        difficulty = 0;
    else if (scr_monsterpop() == 2 && eyeattackcount == 1)
        difficulty = 1;
    else if (scr_monsterpop() == 3 && eyeattackcount == 2)
        difficulty = 1;
    else if (scr_monsterpop() == 3 && eyeattackcount == 1)
        difficulty = 2;
}
if (init == 1 && i_ex(obj_growtangle))
{
    init = 2;
    x = obj_growtangle.x;
    y = obj_growtangle.y;
    var _dir = 28;
    len = 150;
    instance_create(x + lengthdir_x(len, _dir), y + lengthdir_y(len, _dir), obj_mizzle_spotlight_eye);
    _dir += 30;
    instance_create(x + lengthdir_x(len, _dir), y + lengthdir_y(len, _dir), obj_mizzle_spotlight_eye);
    _dir += 30;
    instance_create(x + lengthdir_x(len, _dir), y + lengthdir_y(len, _dir), obj_mizzle_spotlight_eye);
    _dir += 30;
    instance_create(x + lengthdir_x(len, _dir), y + lengthdir_y(len, _dir), obj_mizzle_spotlight_eye);
    _dir += 30;
    instance_create(x + lengthdir_x(len, _dir), y + lengthdir_y(len, _dir), obj_mizzle_spotlight_eye);
    _dir += 30;
    len = 90;
    angle1 = irandom(360);
    angle2 = angle1 + 120;
    angle3 = angle2 + 120;
    spot1 = instance_create(x + lengthdir_x(len, angle1), y + lengthdir_y(len, angle1), obj_mizzle_spotlight);
    spot2 = instance_create(x + lengthdir_x(len, angle2), y + lengthdir_y(len, angle2), obj_mizzle_spotlight);
    spot3 = instance_create(x + lengthdir_x(len, angle3), y + lengthdir_y(len, angle3), obj_mizzle_spotlight);
}
if (difficulty == 0 && init == 2 && !alert)
{
    timer++;
    angle_speed = 2;
    len += len_speed;
    angle1 += angle_speed;
    angle2 += angle_speed;
    angle3 += angle_speed;
    spot1.x = x + lengthdir_x(len, angle1);
    spot1.y = y + lengthdir_y(len, angle1);
    spot2.x = x + lengthdir_x(len, angle2);
    spot2.y = y + lengthdir_y(len, angle2);
    spot3.x = x + lengthdir_x(len, angle3);
    spot3.y = y + lengthdir_y(len, angle3);
}
if (difficulty == 1 && init == 2 && !alert)
{
    timer++;
    angle_speed = 2;
    len += len_speed;
    angle1 += angle_speed;
    angle2 += angle_speed;
    angle3 += angle_speed;
    spot1.x = x + lengthdir_x(len, angle1);
    spot1.y = y + lengthdir_y(len, angle1);
    spot2.x = x + lengthdir_x(len, angle2);
    spot2.y = y + lengthdir_y(len, angle2);
    spot3.x = x + lengthdir_x(len, angle3);
    spot3.y = y + lengthdir_y(len, angle3);
}
if (difficulty == 2 && init == 2 && !alert)
{
}
if (!alert)
{
    with (obj_mizzle_spotlight)
    {
        if (place_meeting(x, y, obj_heart))
        {
            other.alert = true;
            with (obj_mizzle_enemy)
            {
                if (global.monsterstatus[myself] != 0)
                    wakeuptext();
                global.monsterstatus[myself] = 0;
                global.monstercomment[myself] = "";
                awake = true;
            }
        }
    }
}
if (alert)
{
    with (obj_mizzle_spotlight)
    {
        repeat (5)
        {
            if (x < ((obj_heart.x + 10) - 1))
                x += 1;
            if (x > (obj_heart.x + 10 + 1))
                x -= 1;
            if (y < ((obj_heart.y + 10) - 1))
                y += 1;
            if (y > (obj_heart.y + 10 + 1))
                y -= 1;
        }
    }
    if (init == 2)
    {
        init = 3;
        snd_play(snd_tv_alarm, 1, 1.55);
        with (obj_mizzle_spotlight_eye)
            con = 1;
    }
}
