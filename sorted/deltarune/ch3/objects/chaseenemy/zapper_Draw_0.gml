if (drawtype == 0)
{
    if (facing == 0)
        draw_sprite_ext(mysprite, animindex, round(x - 62), round(y - 130), 2, 2, 0, c_white, 1);
    if (facing == 1)
        draw_sprite_ext(mysprite, animindex, round(x + 62), round(y - 130), -2, 2, 0, c_white, 1);
    if (animindex > 9)
        animindex -= 9;
}
if (drawtype == 1)
    draw_self();
