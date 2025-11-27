d_circle(x - camerax(), y - cameray(), biggerLight / 2, false);
with (obj_heartlight_beam)
{
    var dir1 = dir + width;
    var dir2 = dir - width;
    var x0 = other.x - camerax();
    var y0 = other.y - cameray();
    var x1 = x0 + lengthdir_x(length, dir1);
    var y1 = y0 + lengthdir_y(length, dir1);
    var x2 = x0 + lengthdir_x(length, dir2);
    var y2 = y0 + lengthdir_y(length, dir2);
    d_triangle(x0, y0, x1, y1, x2, y2, false);
}
