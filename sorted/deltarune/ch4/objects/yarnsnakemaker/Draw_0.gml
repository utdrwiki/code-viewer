if (global.turntimer < 2)
    instance_destroy();
if (dont == 0)
{
    if (state == 0)
    {
        if (scale < 1)
        {
            scale += 0.1;
        }
        else
        {
            state = 1;
            mybul = scr_bullet_create(x - 12, y - 12, obj_regularbullet_elnina);
            i_ex(mybul);
            mybul.sprite_index = spr_yarnbullet;
            mybul.direction = direction;
            mybul.gravity = childgravity;
            mybul.speed = childspeed;
            mybul.image_angle = direction;
            mybul.depth = obj_heart.depth - 1;
            mybul.grazepoints = grazepoints;
            mybul.updateimageangle = 1;
            mybul.damage = damage;
            mybul.target = target;
        }
    }
    else
    {
        instance_destroy();
    }
}
else
{
    dont = 0;
}
