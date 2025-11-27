draw_set_color(c_black);
ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10);
draw_set_color(c_white);
if (!is_init)
    exit;
if (!countdown)
    exit;
countdown_timer++;
if ((countdown_timer % 30) == 0)
{
    countdown_text--;
    if (countdown_text <= 0)
    {
        snd_play(snd_bell);
        countdown = false;
        alarm[0] = 30;
        exit;
    }
    else
    {
        snd_play_pitch(snd_orchhit, 1 + (orchhit_pitch / 16));
        orchhit_pitch++;
    }
}
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_text_ext_transformed(camerax() + (view_wport[0] / 2), (cameray() + (view_hport[0] / 2)) - 50, string(countdown_text), 4, 9999, 6, 6, 0);
draw_set_halign(fa_left);
