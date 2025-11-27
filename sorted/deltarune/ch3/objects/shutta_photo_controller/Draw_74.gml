if (flash_alpha > 0 && (state == "capture" || state == "result"))
{
    if (flash_alpha < 1.2)
        draw_sprite_stretched_ext(spr_whitepixel, 0, 0, 0, display_get_gui_width(), display_get_gui_height(), c_white, flash_alpha);
    flash_alpha -= 0.1;
}
