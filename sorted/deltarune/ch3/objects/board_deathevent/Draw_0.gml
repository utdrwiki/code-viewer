spintimer++;
if (spintimer > 5)
{
    if ((spintimer % 4) == 0)
    {
        spriteangle++;
        if (spriteangle >= 4)
            spriteangle = 0;
    }
}
switch (spriteangle)
{
    case 0:
        drawsprite = dspr;
        break;
    case 1:
        drawsprite = rspr;
        break;
    case 2:
        drawsprite = uspr;
        break;
    case 3:
        drawsprite = lspr;
        break;
}
if (eventtype == 0)
{
}
if (eventtype == 6)
{
    draw_set_color(c_red);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
    draw_set_color(c_white);
    draw_sprite_ext(drawsprite, 0, round(x / 2) * 2, round(y / 2) * 2, 2, 2, 0, c_black, image_alpha);
}
