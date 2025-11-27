timer++;
var mybulletsprite = bulletsprite;
var destroybulletid = -4;
if (timer >= threshold)
{
    var bulletangle = floor(random(360));
    var bulletdist = 150;
    var bulletgravity = 0.2;
    var heartangle = point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8);
    if (count == 4)
        bulletangle = heartangle + random_range(-30, 30);
    if (count == 5)
    {
        bulletangle = heartangle;
        count = 0;
    }
    var rainbullet = scr_bullet_create(x + lengthdir_x(bulletdist, bulletangle), y + lengthdir_y(bulletdist, bulletangle), obj_regularbullet);
    rainbullet.sprite_index = mybulletsprite;
    rainbullet.mybulletgravity = bulletgravity;
    rainbullet.mybulletdist = bulletdist;
    rainbullet.mybulletangle = bulletangle;
    rainbullet.mybulletspeed = 0;
    rainbullet.image_alpha = 0;
    rainbullet.boss = id;
    rainbullet.grazepoints = 1;
    snd_play_x(snd_wing, 0.3 + (size / 8), 0.5 + random(0.1));
    count++;
    timer = 0;
}
if (amount > 1 && global.turntimer > 10)
{
    var colcheck = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_regularbullet, false, 1);
    if (colcheck != -4)
    {
        if (colcheck.object_index == object_index)
            colcheck = -4;
        else
            destroybulletid = colcheck;
    }
}
with (obj_regularbullet)
{
    if (sprite_index == mybulletsprite)
    {
        if (boss == other.id)
        {
            image_angle = mybulletangle + 180;
            image_alpha += 0.1;
            mybulletspeed += mybulletgravity;
            mybulletdist -= mybulletspeed;
            x = other.x + lengthdir_x(mybulletdist, mybulletangle);
            y = other.y + lengthdir_y(mybulletdist, mybulletangle);
            if (mybulletdist <= (0 + (other.sprite_width / 2)))
                destroybulletid = id;
        }
    }
}
if (destroybulletid != -4)
{
    with (destroybulletid)
    {
        other.size += 0.05;
        var myanim = instance_create(x, y, obj_animation);
        myanim.image_angle = image_angle + 90;
        myanim.sprite_index = spr_raindrop_splash;
        myanim.image_xscale = 0.5;
        myanim.image_yscale = 0.5;
        snd_play_x(snd_bump, 0.5, 0.5 + ((other.size - 1) / 4));
        if (global.turntimer < 10)
        {
            with (myanim)
                instance_destroy();
        }
        instance_destroy();
    }
}
regrazetimer++;
if (regrazetimer >= 10)
{
    grazed = 0;
    regrazetimer = 0;
}
if (special == 1)
{
    siner++;
    x = xstart + (((sin(siner / 10) * siner) / 10) * side);
}
if (special == 2)
{
    siner++;
    x = xstart + (sin(siner / 10) * 2);
    y = ystart + (cos(siner / 10) * 2);
    var angleadd = sin(siner / 20) * 2;
    with (obj_regularbullet)
    {
        if (sprite_index == mybulletsprite)
        {
            if (boss == other.id)
                mybulletangle += angleadd;
        }
    }
}
if (special == 3 || special == 4)
{
    threshold = 8;
    siner++;
    if (i_ex(obj_growtangle))
    {
        x = obj_growtangle.x + (sin(siner / 40) * 50 * side);
        y = obj_growtangle.y + (cos(siner / 40) * 50 * side);
    }
    if (special == 4)
    {
        with (obj_regularbullet)
        {
            if (sprite_index == mybulletsprite)
            {
                if (boss == other.id)
                    mybulletangle += (1 * other.side);
            }
        }
    }
}
