if (type == 0)
{
    if (con == 0 && i_ex(obj_heart))
    {
        var xside = 384;
        var yside = 576;
        if (obj_heart.x > 320)
            xside = 64;
        if (obj_heart.y > 192)
            yside = 0;
        timer++;
        if (timer == 30)
        {
            var lightningcount = irandom_range(8, 12);
            for (var i = 0; i < lightningcount; i++)
            {
                var bul = instance_create(xside, yside, obj_board_collidebullet);
                bul.depth = depth;
                bul.sprite_index = spr_board_bullet_elecbullet;
                bul.direction = point_direction(bul.x, bul.y, obj_heart.x, obj_heart.y) + random_range(-64, 64);
                bul.speed = random_range(7, 9);
                if (bul.x < 320)
                    image_xscale *= -1;
            }
            timer = irandom_range(-8, 2);
        }
    }
}
