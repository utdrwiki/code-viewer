var ladder_index = 4;
var tower = 1010;
var tile_angle1 = tower.tile_angle[i] + tower.tower_angle;
while (tile_angle1 < 0)
    tile_angle1 += 360;
while (tile_angle1 > 360)
    tile_angle1 -= 360;
var xx = lengthdir_x(tower.tower_radius, tile_angle1);
var tile_angle2 = tile_angle1 + tower.tile_angle_difference;
while (tile_angle2 < 0)
    tile_angle2 += 360;
while (tile_angle2 > 360)
    tile_angle2 -= 360;
var xscale = lengthdir_x(tower.tower_radius, tile_angle2) - xx;
var color = merge_color(c_white, tower.tile_dark_color, tower.col_blend * clamp(abs(xx + (xscale / 2)) / 190, 0, 1));
delay--;
if (delay <= 0)
{
    timer++;
    if (timer >= 1)
    {
        _yspeed += 0.6;
        y += _yspeed;
    }
    if (timer == 80)
        instance_destroy();
}
var _x = 0;
if (dog == true)
    _x = 240;
depth = tower.depth - sin(degtorad(tile_angle1));
draw_sprite_ext(sprite_index, 4, tower.tower_x + xx, y, xscale / 40, 1, 0, color, 1);
