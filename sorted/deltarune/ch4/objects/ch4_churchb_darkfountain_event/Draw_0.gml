siner += (1.5 * speed_modifier);
if (t >= 400)
{
    rs += (0.5 * speed_modifier);
    draw_set_color(c_white);
    for (i = 1; i < 12; i += 1)
    {
        draw_set_alpha((rs / 16) - (i / 12));
        ossafe_fill_rectangle(320 - (i * i) - (rs * i), 0, 320 + (i * i) + (rs * i), 500, 0);
    }
    draw_set_alpha(1);
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, siner / 8);
draw_sprite_ext(sprite_index, image_index, x, y, siner / 4, siner / 4, 0, c_white, 1.6 - (siner / 16));
draw_sprite_ext(sprite_index, image_index, x, y, siner / 8, siner / 8, 0, c_white, 1.6 - (siner / 24));
t += (1 * speed_modifier);
if (t >= 70 && t <= 240)
{
    with (obj_darkfountain)
    {
        adjust = 1;
        eyebody *= 0.98;
    }
    y -= (1 * speed_modifier);
}
if (t >= 240 && t < 245)
{
    with (obj_darkfountain)
        adjust = 2;
    t = 300;
}
if (t >= 390 && t < 395)
{
    t = 400;
    siner = 3;
    if (soundcon == 0)
    {
        soundcon = 1;
        audio_play_sound(snd_revival, 50, 0);
        snd_volume(global.currentsong[1], 0, 60);
    }
}
if (t >= 450)
{
    ds2 += (0.02 * speed_modifier);
    draw_set_alpha(ds2);
    draw_set_color(c_white);
    ossafe_fill_rectangle(-10, -10, 999, 999, false);
    draw_set_alpha(1);
}
if (t >= 520)
{
    ds3 += (0.01 * speed_modifier);
    draw_set_alpha(ds3);
    draw_set_color(c_black);
    ossafe_fill_rectangle(-10, -10, 999, 999, false);
    draw_set_alpha(1);
}
if (t >= 650)
{
    global.entrance = 0;
    global.interact = 1;
    global.fighting = 0;
    scr_become_light();
    snd_free_all();
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_lw_church_entrance);
}
