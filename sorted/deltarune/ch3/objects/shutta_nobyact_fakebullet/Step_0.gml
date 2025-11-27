if (type == 0)
{
    direction += 1;
    image_angle = direction;
    image_alpha -= 0.2;
    if (image_alpha <= 0)
        instance_destroy();
}
if (type > 0)
{
    if (type == 1)
    {
        if (con == 1)
        {
            var basedirection = random(45);
            for (var i = 0; i < 3; i++)
            {
                mybullet = instance_create(x, y, object_index);
                mybullet.type = 2;
                mybullet.direction = basedirection + (i * 120);
                mybullet.speed = 12 + random(5);
                mybullet.friction = 2;
            }
            scr_afterimage_grow();
            instance_destroy();
        }
    }
    if (type == 2)
    {
        timer++;
        if (timer >= 14)
        {
            var basedirection = random(30);
            for (var i = 0; i < 4; i++)
            {
                mybullet = instance_create(x, y, object_index);
                mybullet.type = 0;
                mybullet.direction = random(360);
                mybullet.speed = 3 + random(3);
                mybullet.friction = 0.2;
                mybullet.image_angle = mybullet.direction;
                mybullet.sprite_index = spr_diamondbullet;
                mybullet.image_alpha = 12;
            }
            scr_afterimage_grow();
            instance_destroy();
        }
    }
}
