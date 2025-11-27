if (init == 1)
{
    draw_set_color(boxcolor);
    draw_set_alpha(1);
    ossafe_fill_rectangle(x - boxleft, y + 16, x + 383 + boxright, (y + 127) - 26);
}
if (con >= 2)
{
    if (i_ex(writer))
    {
        if (writer.reachedend == 1)
        {
            halt = 1;
            reachedend_draw_triangle_siner++;
            if (reachedend_draw_triangle_siner < 20 && reachedend_draw_triangle)
                draw_sprite_ext(reachedend_triangle_sprite, 0, x + 362, y + 90, 2, 2, 0, textcolor, 1);
            if (reachedend_draw_triangle_siner >= 30)
                reachedend_draw_triangle_siner = 0;
        }
        else
        {
            reachedend_draw_triangle_siner = 0;
        }
    }
}
