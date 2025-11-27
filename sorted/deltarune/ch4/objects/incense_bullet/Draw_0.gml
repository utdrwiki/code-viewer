siner++;
if (spin == 1)
{
    image_xscale = 1.7 + (sin(siner / 10) / 10);
    image_yscale = image_xscale;
}
else if ((siner % 2) == 0)
{
}
if (sprite_index == spr_bullet_ghostfire_turtle)
{
    image_xscale = 1;
    image_yscale = 1;
}
draw_self();
