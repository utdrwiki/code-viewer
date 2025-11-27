if (con == 0)
    depth = 999990;
if (con == 1)
{
    if (i_ex(obj_mainchara_board))
        depth = obj_mainchara_board.depth - 80;
    timer = 0;
    con = 2;
}
if (con == 2)
{
    timer++;
    if (timer >= shottarget)
    {
        var shotnum = irandom_range(6, 9);
        for (var i = 0; i < shotnum; i++)
        {
            var bul = instance_create(x + 16, y + 16, obj_board_collidebullet);
            bul.direction = i * (360 / shotnum);
            bul.speed = 4;
            bul.friction = -0.1;
            bul.fadetime = 60;
            bul.updateangle = 1;
            bul.sprite_index = spr_bullet_laser_circle;
            bul.image_xscale = 0.8;
            bul.image_yscale = 0.25;
            bul.depth = depth + 10;
        }
        timer = irandom_range(-4, 4);
    }
}
if (con == 3)
{
    timer = 0;
    con = 0;
}
