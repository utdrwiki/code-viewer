var cx = camerax();
var cy = cameray();
if (letterboxcon == 1)
{
    letterboxtimer++;
    if (letterboxtimer > 0 && letterboxtimer <= 10)
        bgalpha = lerp(0, 1, letterboxtimer / 10);
    if (letterboxtimer > 5 && letterboxtimer <= 10)
        linex1 = lerp(linex1, 0, (letterboxtimer - 5) / 5);
    if (letterboxtimer > 5 && letterboxtimer <= 10)
        linex2 = lerp(linex2, 640, (letterboxtimer - 5) / 5);
    if (letterboxtimer > 10)
        linealpha -= 0.25;
    if (letterboxtimer == 10)
    {
        y2 = 240;
        y6 = 240;
        battlebgalpha = 1;
        letterboxalpha = 1;
        bgalpha = 0;
    }
    if (letterboxtimer > 10 && letterboxtimer <= 16)
    {
        y2 = lerp(y2, 180, (letterboxtimer - 10) / 6);
        y6 = lerp(y6, 300, (letterboxtimer - 10) / 6);
    }
    if (letterboxtimer > 15 && letterboxtimer < 45)
        dogx = lerp(dogx, 500, 0.2);
    if (letterboxtimer == 14)
        snd_play(snd_dogrev);
    if (letterboxtimer == 14)
        snd_play(snd_dograce_countdown);
    if (letterboxtimer == 30)
        scr_lerpvar("dogx", dogx, -300, 20, 3, "in");
    if (letterboxtimer == 45)
    {
        scr_lerpvar("y2", y2, 240, 7, 3, "in");
        scr_lerpvar("y6", y6, 240, 7, 3, "in");
    }
    if (letterboxtimer >= 58)
    {
        letterboxalpha -= 0.2;
        battlebgalpha = 0;
    }
    if (letterboxtimer == 100)
    {
        letterboxcon = 2;
        letterboxtimer = 0;
    }
}
draw_set_alpha(bgalpha);
ossafe_fill_rectangle(0, 0, 640, 480, false);
draw_sprite_ext(spr_nothing, battlebgindex, 0, 180, 2, 2.9, 0, c_white, battlebgalpha);
draw_sprite_ext(spr_nothing, battlebgindex, 272, 180, 2, 2.9, 0, c_white, battlebgalpha);
draw_sprite_ext(spr_nothing, battlebgindex, 544, 180, 2, 2.9, 0, c_white, battlebgalpha);
battlebgindex += 0.5;
draw_set_alpha(letterboxalpha);
ossafe_fill_rectangle(0, 0, cx + 640, y2, false);
ossafe_fill_rectangle(0, cy + 480, cx + 640, y6, false);
draw_set_alpha(linealpha);
d_line_width_color(linex1, 240, linex2, 240, linewidth, 16777215, 16777215);
draw_set_alpha(1);
