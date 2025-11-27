if (fadein == true && image_alpha < 1)
    image_alpha = scr_movetowards(image_alpha, 1, 0.2);
draw_self_offset(0, -jumpy);
