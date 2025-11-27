var tile_angle1 = tile_angle[i] + tower_angle;
while (tile_angle1 < 0)
    tile_angle1 += 360;
while (tile_angle1 > 360)
    tile_angle1 -= 360;
tile_x[i] = lengthdir_x(tower_radius, tile_angle1);
var tile_angle_difference = 360 / horizontaltilecount;
var tile_angle2 = tile_angle[i] + tower_angle + tile_angle_difference;
while (tile_angle2 < 0)
    tile_angle2 += 360;
while (tile_angle2 > 360)
    tile_angle2 -= 360;
tile_xscale[i] = lengthdir_x(tower_radius, tile_angle2);
if (tile_angle1 > 0 && tile_angle1 <= 190)
    tile_vis[i] = true;
else
    tile_vis[i] = false;
tile_color[i] = merge_color(c_white, c_gray, abs(tile_x[i]) / 100);
