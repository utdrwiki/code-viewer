if (canchoose == 1)
{
    draw_set_color(c_white);
    ossafe_fill_rectangle(camerax() + 16, cameray() + 160, camerax() + 304, cameray() + 235, false);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax() + 19, cameray() + 163, camerax() + 301, cameray() + 232, false);
    scr_84_set_draw_font("main");
    textx = xx;
    texty = yy;
    for (i = 0; i < (choicetotal + 1); i += 1)
    {
        draw_set_color((mychoice == i) ? c_yellow : c_white);
        textx = textposx[i];
        texty = textposy[i];
        draw_text(textx, texty, string_hash_to_newline(global.choicemsg[i]));
    }
    draw_sprite_ext(heartSprite, 0, hx, hy, image_xscale, image_yscale, 0, c_white, 1);
}
