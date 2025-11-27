if (scr_debug() && keyboard_check_pressed(ord("V")))
    dodraw = !dodraw;
if (!dodraw)
    exit;
draw_self();
var kris = 27;
var goback = 0;
if (i_ex(kris))
{
    if (point_distance(x + 20, y + 20, kris.x, kris.y) > 160)
    {
        goback = 1;
    }
    else
    {
        var dirtokris = point_direction(x + 20, y + 20, kris.x, kris.y);
        eyex = lerp(eyex, lengthdir_x(4, dirtokris), 0.25);
        eyey = lerp(eyey, lengthdir_y(4, dirtokris), 0.25);
    }
}
else
{
    goback = 1;
}
if (goback == 1)
{
    eyex = lerp(eyex, 0, 0.1);
    eyey = lerp(eyey, 0, 0.1);
}
draw_sprite_ext(spr_pxwhite, 0, (x + 20) - 6, (y + 20) - 6, 12, 12, 0, c_white, 1);
draw_sprite_ext(spr_pxwhite, 0, -4 + x + 20 + eyex, -2 + y + 20 + eyey, 8, 4, 0, c_black, 1);
draw_sprite_ext(spr_pxwhite, 0, -4 + x + 20 + eyex + 2, (-2 + y + 20 + eyey) - 2, 4, 8, 0, c_black, 1);
