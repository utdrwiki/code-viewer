if (draw_static)
{
    for (var i = 0; i < 8; i++)
    {
        for (var ii = 0; ii < 8; ii++)
            draw_sprite_ext(spr_static_effect, i + ii + timer, 0 + (i * 256), 0 + (ii * 256), 2, 2, 0, c_white, 1);
    }
    draw_set_color(c_white);
    draw_set_alpha(0.25);
    ossafe_fill_rectangle(0, 0, 640, 480);
    draw_set_alpha(1);
}
