if (onrotatingtower)
{
    var tower = 1010;
    var adjustment = -304;
    if (tower.appearance == 1)
        adjustment = 356;
    var __tile_angle = lerp(360, 0, (x + adjustment) / tower.tower_circumference);
    var tile_angle1 = __tile_angle + tower.tower_angle;
    while (tile_angle1 < 0)
        tile_angle1 += 360;
    while (tile_angle1 > 360)
        tile_angle1 -= 360;
    if (tile_angle1 > 350 || tile_angle1 <= 190)
        tile_vis = true;
    else
        tile_vis = false;
    var __tile_x = lengthdir_x(tower.tower_radius, tile_angle1);
    var tile_angle2 = tile_angle1 + tower.tile_angle_difference;
    while (tile_angle2 < 0)
        tile_angle2 += 360;
    while (tile_angle2 > 360)
        tile_angle2 -= 360;
    var __tile_xscale = lengthdir_x(tower.tower_radius, tile_angle2) - __tile_x;
    var __tile_yscale = tower.tile_width_fine;
    var _sprite = spr_susie_climb_0_degrees;
    if (abs(__tile_xscale) < 30)
        _sprite = spr_susie_climb_45_degrees;
    if (abs(__tile_xscale) < 15)
        _sprite = spr_susie_climb_90_degrees;
    var flip = 1;
    if (_sprite != spr_susie_climb_0_degrees && __tile_x < 0)
    {
        flip = -1;
        __tile_x = lengthdir_x(tower.tower_radius, tile_angle1 - tower.tile_angle_difference);
    }
    __tile_xscale /= (tower.tile_width_fine / 2);
    __tile_yscale /= (tower.tile_width_fine / 2);
    tower_x = tower.tower_x + __tile_x;
    if (con == 3 || con == 4 || con == 5)
        _sprite = sprite_index;
    var __tile_color = merge_color(c_white, c_gray, abs(__tile_x + (__tile_xscale / 2)) / 90);
    if (tile_vis == 1)
        draw_sprite_ext(_sprite, image_index, tower.tower_x + __tile_x, y - 10, 2 * flip, __tile_yscale, 0, __tile_color, image_alpha);
}
else
{
    draw_self();
}
