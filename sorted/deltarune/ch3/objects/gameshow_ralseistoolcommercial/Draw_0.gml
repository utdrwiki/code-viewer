timer++;
var kill = false;
if (timer == 1)
{
    nopushsong_snd = snd_init("tv_results_screen.ogg");
    snd_stop(nopushsong_snd);
    nopushsong = mus_loop(nopushsong_snd);
    starcol = 0;
}
if (timer == 5)
{
    var _time = 60;
    if (button3_h())
        _time = 5;
    scr_lerp_imageblend(id, #000005, c_white, _time, 2, "in");
}
scr_checkskiptimer(5, 30);
if (timer == 30)
{
    var _time = 60;
    if (button3_h())
        _time = 5;
    scr_lerpvar("plushalpha", 0, 1, _time, 2, "out");
}
scr_checkskiptimer(30, 90);
if (timer == 90)
{
    var _time = 30;
    if (button3_h())
        _time = 5;
    scr_lerpvar("textalpha", 0, 1, _time, 2, "out");
}
scr_checkskiptimer(90, 450);
if (timer < 450)
    starcol = image_blend;
if (timer == 450 || button2_p())
{
    var killtime = 20;
    scr_lerpvar("plushalpha", 1, 0, killtime, 2, "out");
    scr_lerpvar("textalpha", 1, 0, killtime, 2, "out");
    scr_doom(id, killtime);
    mus_volume(nopushsong, 0, killtime);
}
siner++;
var yy = (cameray() + 180) - 6;
for (var i = -10; i < 4; i++)
{
    for (var ii = -10; ii < 3; ii++)
        draw_sprite_ext(spr_dw_tv_starbgtile_teal, siner * 0.5, camerax() + (160 * i) + siner, cameray() + (160 * ii) + siner, 2, 2, 0, starcol, 1);
}
draw_sprite_ext(spr_gameshow_ralseiplush_stoole, 0, 320, yy, 1, 1, 0, c_white, plushalpha);
draw_set_halign(fa_center);
draw_set_color(c_white);
var mytext = stringsetloc("WHY DIDN'T#YOU PUSH HIM?", "obj_gameshow_ralseistoolcommercial_slash_Draw_0_gml_77_0");
draw_set_font(scr_84_get_font("mainbig"));
var shadcol = 5713174;
draw_text_transformed_color(324, yy + 144 + 4, string_hash_to_newline_ex(mytext), 2, 2, 0, shadcol, shadcol, shadcol, shadcol, textalpha * 0.8);
draw_text_transformed_color(320, yy + 144, string_hash_to_newline_ex(mytext), 2, 2, 0, c_yellow, c_yellow, c_white, c_white, textalpha);
draw_set_halign(fa_left);
draw_set_alpha(1);
