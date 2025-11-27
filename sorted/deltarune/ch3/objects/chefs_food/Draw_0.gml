draw_self();
if (on_fire)
{
    img++;
    if (img > 3)
        img = 0;
    draw_sprite_ext(spr_chefs_fire, img, x, y, 2, 2, 0, c_white, 1);
}
