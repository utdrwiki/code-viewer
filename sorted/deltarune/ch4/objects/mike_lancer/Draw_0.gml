for (var _i = 0; _i < 2; _i++)
{
    xscale[_i] += (xscale[_i + 1] - xscale[_i]) * 0.33;
    yscale[_i] += (yscale[_i + 1] - yscale[_i]) * 0.33;
}
wobble = scr_approach(wobble, 0, 0.5);
xscale[2] = 1 + (sin(current_time / 30) * (3 * (wobble / 15)));
yscale[2] = 1 + (sin(10 + (current_time / 30)) * (3 * (wobble / 15)));
draw_sprite_ext(sprite_index, image_index, x + ((sprite_width / 2) * (1 - xscale[0])), y + ((sprite_height / 2) * (1 - yscale[0])), 2 * xscale[0], 2 * yscale[0], image_angle, image_blend, image_alpha);
