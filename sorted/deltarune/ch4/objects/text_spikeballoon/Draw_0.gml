framecount++;
var xx = camerax();
var yy = cameray();
if (scr_debug())
{
}
if (!surface_exists(surf))
    surf = surface_create(camerawidth(), cameraheight());
var surfaceupdate = 0;
var r = 1;
if (framecount >= framethreshold)
    surfaceupdate = 1;
if (remcamerax != xx || remcameray != yy)
{
    r = 0.5;
    surfaceupdate = 1;
}
if (surfaceupdate == 1)
{
    siner += r;
    var x1 = (x - xx) + (random_range(-1, 1) * r) + (sin(siner / 3) * 3);
    var x2 = ((x + w) - xx) + (random_range(-1, 1) * r) + (sin(siner / 3) * 3);
    var y1 = (y - yy) + (random_range(-1, 1) * r) + (cos(siner / 3) * 3);
    var y2 = ((y + h) - yy) + (random_range(-1, 1) * r) + (cos(siner / 3) * 3);
    surface_set_target(surf);
    draw_clear_alpha(c_white, 0);
    draw_set_color(c_black);
    ossafe_fill_rectangle(x1, y1, x2, y2, false);
    d_triangle(x1, y1, x1 + (w / 3), y1, x1 - (random(6) * r), y1 - 7 - (random(3) * r), false);
    d_triangle(x2, y1, x2 - (w / 3), y1, x2 + (random(6) * r), y1 - 7 - (random(3) * r), false);
    d_triangle(x1, y1, x1, y1 + (h / 2), x1 - 5 - (random(5) * r), y1 + (h / 4) + (random_range(-3, 3) * r), false);
    d_triangle(x1, y1 + (h / 2), x1, y2, x1 - 5 - (random(5) * r), (y2 - (h / 4)) + (random_range(-3, 3) * r), false);
    d_triangle(x2, y1, x2, y1 + (h / 2), x2 + 5 + (random(5) * r), y1 + (h / 4) + (random_range(-3, 3) * r), false);
    d_triangle(x2, y1 + (h / 2), x2, y2, x2 + 5 + (random(5) * r), (y2 - (h / 4)) + (random_range(-3, 3) * r), false);
    d_triangle(x1, y1, x1 + (w / 3), y2, x1 - (random(6) * r), y2 + 7 + (random(3) * r), false);
    d_triangle(x1 + (w / 3), y2, x1 + ((w / 3) * 2), y2, x1 + (w / 2) + (random_range(-3, 3) * r), y2 + 7 + (random(3) * r), false);
    d_triangle(x2, y1, x2 - (w / 3), y2, x2 + (random(6) * r), y2 + 7 + (random(3) * r), false);
    var t2x1 = (x2 - (w / 3)) + (random_range(-2, 2) * r);
    var t2y1 = ((y1 + taily) / 2) + (random_range(-2, 2) * r);
    var t2x2 = x1 + (w / 3) + (random_range(-2, 2) * r);
    var t2y2 = t2y1;
    var t2x3 = ((t2x1 + t2x2) / 2) + 1;
    var t2y3 = y1 - 3;
    d_triangle(x1 + (w / 3), y1, x1 + ((w / 3) * 2), y1, t2x1, t2y1, false);
    d_triangle(t2x1, t2y1, t2x2, t2y2, t2x3, t2y3, false);
    d_triangle(t2x2, t2y2, (tailx + (random_range(-3, 3) * r)) - xx, t2y2, (tailx + random_range(-1, 1)) - xx, (taily + (random_range(-1, 1) * r)) - yy, false);
    surface_reset_target();
    framecount = 0;
}
draw_surface_ext(surf, xx - 10, yy - 10, 1, 1, 0, image_blend, image_alpha);
draw_surface_ext(surf, xx - 8, yy - 8, 1, 1, 0, image_blend, image_alpha / 4);
remcameray = cameray();
remcamerax = camerax();
