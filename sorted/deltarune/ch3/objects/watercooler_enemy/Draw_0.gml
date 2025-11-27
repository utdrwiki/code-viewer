scr_enemy_drawhurt_generic();
scr_enemy_drawidle_generic(0.16666666666666666);
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (pinkflashtimer > 0)
{
    pinkflashtimer--;
    draw_sprite_ext(sparedsprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, pinkflashtimer / 10);
}
