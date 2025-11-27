image_alpha = lerp(image_alpha, 1, 0.125);
timer++;
if (timer >= timertarg)
{
    if (i_ex(obj_heart))
    {
        bul = instance_create(x + 6, y + 14, obj_board_collidebullet);
        bul.sprite_index = spr_board_treeEnemyBullet;
        bul.direction = point_direction(x, y, obj_heart.x + 2, obj_heart.y + 2);
        bul.speed = 2;
        bul.friction = -0.25;
        bul.depth = depth - 10;
        scr_doom(bul, 90);
        timer = 0;
        timertarg = random(30) + 15;
    }
}
if (timer > (timertarg - 5))
    image_index = 1;
else
    image_index = 0;
