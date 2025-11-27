var _blend = merge_colour(image_blend, merge_colour(image_blend, c_dkgray, clamp(abs(xs), 0, 0.5)), 0.25);
xs -= spin;
if (xs <= -1)
    xs = 1;
ang += spin2;
draw_sprite_ext(spr_mike_confetti, image_index, x, y, xs, 1, ang, _blend, image_alpha);
