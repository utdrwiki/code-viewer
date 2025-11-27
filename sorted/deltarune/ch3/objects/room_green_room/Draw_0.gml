var show = false;
if (gotemall() == false && lostem() == false)
    show = true;
with (cliptrig)
{
    if (talked)
        show = false;
}
siner++;
with (clip)
{
    other.depth = depth - 1;
    var count = 0;
    draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, 2, 2, 0, c_white, 0.125);
    draw_self();
    var red = 255;
    for (var i = 0; i < 6; i++)
    {
        if (global.flag[654 + i])
            draw_sprite_ext(spr_pxwhite, 0, x + 6, y + 8 + (i * 4), 20, 2, 0, red, 0.8);
    }
    if (show)
        draw_sprite_ext(spr_5x5shine, other.siner / 16, x - 2, y - 2, 2, 2, 0, c_white, 1.5 + sin(other.siner / 30));
}
