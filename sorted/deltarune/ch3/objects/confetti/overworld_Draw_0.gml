if (version == 1)
{
    if (falltime == 100)
    {
        shine_index = 1;
        if (!audio_is_playing(snd_boost))
            snd_play(snd_boost);
    }
    if (shine_index > 0)
    {
        draw_sprite_ext(spr_lancer_card_shine4, shine_index, x + 8, (y - height) + 8, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        shine_index += 1;
        if (shine_index >= 12)
            shine_index = 0;
    }
}
var _color = image_blend;
if (fade && height < 0)
    _color = merge_color(image_blend, c_black, round_to_multiple(clamp01(inverselerp(-80, -160, height)), 0.1));
draw_sprite_ext(sprite_index, image_index, x, y - height, image_xscale, image_yscale, image_angle, _color, image_alpha);
