if (!dodraw)
    exit;
draw_sprite_ext(spr_pxwhite, 0, x, y, 2, -bellcordlength, 0, #B4D6CA, 1);
draw_sprite_ext(spr_whitegradientdown_40, 0, x, y - bellcordlength - (40 * bellcordfadelength), 0.05, bellcordfadelength, 0, #B4D6CA, 1);
draw_self();
