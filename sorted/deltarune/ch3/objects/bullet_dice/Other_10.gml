image_index = floor(image_index);
var pips = image_index / 4;
if (sprite_index == spr_bullet_dice_all4s)
    pips = 3;
if (pips == 0)
{
    bullet = scr_fire_bullet(x, y, obj_regularbullet, scr_at_player(x, y), 4, spr_smallbullet, false, id);
    bullet.target = target;
    bullet.damage = 55;
    bullet.grazepoints = 4;
    snd_stop(snd_gunshot_b);
    snd_play_x(snd_gunshot_b, 0.8, 1.3);
}
else
{
    snd_stop(snd_bomb);
    snd_play(snd_bomb);
    var basedir = 180 - (45 * pips);
    var rotate = 180 / (1 + ((pips - 1) / 2));
    for (var dir = basedir; dir < 360; dir += rotate)
    {
        if (image_index == 4 && sprite_index == spr_bullet_dice4pip)
        {
            if (dir == 135)
                dir += 12;
            if (dir == 333)
                dir -= 12;
        }
        if ((image_index == 12 && sprite_index == spr_bullet_dice4pip) || sprite_index == spr_bullet_dice_all4s)
        {
        }
        var dox = x + lengthdir_x(20, dir + image_angle);
        var doy = y + lengthdir_y(20, dir + image_angle);
        bullet = instance_create(dox, doy, obj_bullet_dice_shockwave);
        bullet.target = target;
        bullet.damage = 55;
        bullet.grazepoints = 4;
        bullet.direction = dir + image_angle;
        if (pips >= 3 || (sprite_index == spr_bullet_dice && image_index >= 8) || (sprite_index == spr_bullet_dice4pip && image_index >= 8))
        {
            bullet.image_xscale = 2;
            bullet.image_yscale = 2;
        }
    }
}
instance_destroy();
