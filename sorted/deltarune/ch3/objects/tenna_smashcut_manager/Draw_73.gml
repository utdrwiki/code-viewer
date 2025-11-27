if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (!surface_exists(smash_surface))
    smash_surface = surface_create(640, 480);
surface_set_target(smash_surface);
draw_clear(c_black);
draw_surface(application_surface, 0, 0);
surface_reset_target();
var cut = obj_growtangle.y - cameray();
var cut2 = cameraheight() - cut;
timer2++;
var xoffset = 0;
if (timer2 == 1)
    xoffset = 10;
if (timer2 == 2)
    xoffset = -9;
if (timer2 == 3)
    xoffset = 8;
if (timer2 == 4)
    xoffset = -7;
if (timer2 == 5)
    xoffset = 6;
if (timer2 == 6)
    xoffset = -5;
if (timer2 == 7)
    xoffset = 4;
if (timer2 == 8)
    xoffset = -3;
if (timer2 == 9)
    xoffset = 2;
if (timer2 == 10)
    xoffset = -1;
if (timer2 == 11)
    xoffset = 0;
ossafe_fill_rectangle_color(camerax(), cameray(), camerax() + camerawidth(), cameray() + cameraheight(), c_black, c_black, c_black, c_black);
draw_surface_part(smash_surface, 0, 0, camerawidth(), cut, camerax() + xoffset + (sin(timer) * 24 * intensity), cameray());
draw_surface_part(smash_surface, 0, 0, camerawidth(), cut, (camerax() + xoffset + (sin(timer) * 24 * intensity)) - camerawidth(), cameray());
draw_surface_part(smash_surface, 0, 0, camerawidth(), cut, camerax() + xoffset + (sin(timer) * 24 * intensity) + camerawidth(), cameray());
draw_surface_part(smash_surface, 0, cut, camerawidth(), cut2, camerax() + xoffset + (cos(timer) * 24 * intensity), cameray() + cut);
draw_surface_part(smash_surface, 0, cut, camerawidth(), cut2, (camerax() + xoffset + (cos(timer) * 24 * intensity)) - camerawidth(), cameray() + cut);
draw_surface_part(smash_surface, 0, cut, camerawidth(), cut2, camerax() + xoffset + (cos(timer) * 24 * intensity) + camerawidth(), cameray() + cut);
bar_v = scr_approach(bar_v, 0, bar_v * 0.5);
if (bar_v < 0.1)
    bar_v = 0;
var bar_height = bar_v * 0.5;
var bar_width = camerawidth() * 0.5;
if (bar_v > 0)
    ossafe_fill_rectangle_color(obj_growtangle.x - bar_width, obj_growtangle.y - bar_height, obj_growtangle.x + bar_width, obj_growtangle.y + bar_height, c_white, c_white, c_white, c_white);
