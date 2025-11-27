radius = 100;
timer += 2;
for (var i = 0; i < array_length(parade); i += 1)
{
    var xx = x + (cos(i) * radius);
    var yy = y + (sin(i) * radius);
    var __theta = point_direction(x, y, xx, yy);
    var __radius = point_distance(x, y, xx, yy);
    __theta -= timer;
    var _xx = x + lengthdir_x(__radius, __theta);
    var _yy = y + lengthdir_y(__radius / 2, __theta);
    var parader = parade[i];
    parader.x = _xx;
    parader.y = _yy;
    parader.image_xscale = (parader.y < y) ? -2 : 2;
    with (parader)
        scr_depth();
}
