if (con == 1)
{
    if (siner < 39)
        siner += 1.5;
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, clamp01(siner / 8));
    if (siner < 39)
    {
        draw_sprite_ext(sprite_index, image_index, x, y - (scr_ease_out(siner / 26, 2) * 30), siner / 4, siner / 4, 0, c_white, 1.6 - (siner / 16));
        draw_sprite_ext(sprite_index, image_index, x, y - (scr_ease_out(siner / 40, 2) * 30), siner / 8, siner / 8, 0, c_white, 1.6 - (siner / 24));
    }
}
if (con == 2)
{
    if (timer == 0)
        snd_play(snd_revival);
    if (timer >= 3 && timer < 7)
        timer += 0.2;
    else if (timer < 11)
        timer += 0.5;
    else
        timer += (1/3);
    if (timer >= 2)
        draw_sprite_ext(spr_heart_explosion, clamp(timer - 2, 0, 19), camerax() - 28, cameray(), 2, 2, 0, c_white, 0.25);
    if (timer >= 1)
        draw_sprite_ext(spr_heart_explosion, clamp(timer - 1, 0, 19), camerax() - 28, cameray(), 2, 2, 0, c_white, 0.5);
    draw_sprite_ext(spr_heart_explosion, clamp(timer, 0, 19), camerax() - 28, cameray(), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_heart_centered, 0, x, y, 1, 1, 0, c_white, 1);
    var _dl = 0;
    if (timer > (14 + _dl))
        draw_sprite_ext(spr_heart_centered_shine, remap_clamped(14 + _dl, 27 + _dl, 0, 6, timer), x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    if (timer > (20 + _dl))
    {
        var _length = 10 + (room_width / 4);
        var _height = 10 + (room_height / 4);
        draw_sprite_ext(spr_pixel_white, 0, -20, -20, _length, _height, 0, c_white, remap_clamped(20 + _dl, 40 + _dl, 0, 1, timer));
    }
}
