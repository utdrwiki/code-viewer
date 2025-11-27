if (!is_active)
    exit;
timer--;
if (timer <= 0)
{
    timer = 2;
    var x_pos = random_range(300, 340);
    var ball = instance_create(x_pos, cameray() + 60, obj_ch4_DCB03_fountain_ball);
}
if (fountain_sound == -4)
    fountain_sound = audio_play_sound(snd_deep_noise, 50, 1);
ceiltimer += (1 * speed_modifier);
if (ceilheight < 120)
    ceilheight += (sin(ceiltimer / 18) + (0.3 * speed_modifier));
if (ceilheight >= 120)
    ceilheight += (0.5 * speed_modifier);
for (i = 0; i < 12; i++)
{
    ceilballx[i] = ((ceiltimer + (i * 40)) % 400) + -40 + camerax();
    draw_sprite_ext(spr_kris_fountain_ball, 0, ceilballx[i], (ceilheight - 80) + (sin(i + (ceiltimer / 8 / 2)) * 7), 1.05, 1.05, 0, c_white, 1);
}
for (i = 0; i < 12; i++)
    draw_sprite_ext(spr_kris_fountain_ball, 0, ceilballx[i], (ceilheight - 80) + (sin(i + (ceiltimer / 8 / 2)) * 7), 1, 1, 0, c_black, 1);
draw_set_color(c_black);
ossafe_fill_rectangle(-10, ceilheight - 80, 999, -90, false);
if (ceiltimer >= 600)
{
    volume_modifier = scr_movetowards(volume_modifier, 0, 0.01);
    audio_sound_gain(fountain_sound, 1 * volume_modifier, 0);
}
