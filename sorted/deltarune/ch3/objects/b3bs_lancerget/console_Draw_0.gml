draw_self();
var dodraw = true;
if (obj_b3bs_console.usecount)
    dodraw = false;
if (global.flag[1055] == 6)
    dodraw = false;
if (dodraw)
{
    siner++;
    if (image_index == 0)
    {
        if (obj_b3bs_console.con == 0)
            draw_sprite_ext(spr_5x5shine, (siner / 16) + x, x + 4 + 10, (y - 2) + 24, 2, 2, 0, c_white, 1.5 + (sin(siner / 30) * 1.25));
    }
}
