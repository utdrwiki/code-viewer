if (do_shadow)
    draw_sprite_ext(spr_susiezilla_shadowSpot, 0, x - 12, ground, 1, 1, 0, c_black, 0.5);
if (!flash || (timer % 4) < 2)
    draw_self();
