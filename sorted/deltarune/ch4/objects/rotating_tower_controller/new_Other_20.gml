var tile_angle1 = tile_angle[i] + tower_angle;
if (tile_angle1 >= 360)
    tile_angle1 -= 360;
else if (tile_angle1 < 0)
    tile_angle1 += 360;
if (appearance < 2)
    tile_vis[i] = tile_angle1 > 350 || tile_angle1 <= 170;
else
    tile_vis[i] = tile_angle1 >= 345 || tile_angle1 <= 165;
if (appearance == 1 && tile_vis[i] == false && (tile_angle1 >= 340 || tile_angle1 <= 190))
    tile_vis[i] = 2;
if (tile_vis[i] == false)
    exit;
tile_x[i] = lengthdir_x(tower_radius, tile_angle1);
var tile_angle2 = tile_angle1 + tile_angle_difference;
if (tile_angle2 > 360)
    tile_angle2 -= 360;
else if (tile_angle2 < 0)
    tile_angle2 += 360;
tile_xscale[i] = lengthdir_x(tower_radius, tile_angle2) - tile_x[i];
tile_color[i] = merge_color(c_white, tile_dark_color, col_blend * clamp(abs(tile_x[i] + (tile_xscale[i] * 0.5)) / 190, 0, 1));
