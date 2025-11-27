if (type == 1)
    pitcherror += (0.00004 + (pitcherror / 80));
if (pitcherror >= 0.8)
    pitcherror = 0;
if (type == 1)
    snd_pitch(global.currentsong[0], 1.3 + random_range(-pitcherror, pitcherror));
depth = 900000;
mycolor = make_color_hsv(128 + (sin(timer / 800) * 127), 200, 80);
draw_set_color(merge_color(c_black, mycolor, 0.5 + (sin(timer / 30) * 0.25)));
ossafe_fill_rectangle(x, y, (x + (width * tvwidth)) - 1, (y + (height * tvheight)) - 1);
draw_set_color(c_white);
draw_set_blend_mode(bm_add);
var trankstring = stringsetloc("T-RANK", "obj_dw_ranking_t_screens_slash_Draw_0_gml_30_0");
var hamplitude = sin(timer / 60) + 0.9;
if (hamplitude < 0)
    hamplitude = 0;
var vamplitude = sin(timer / 50) + 0.9;
if (vamplitude < 0)
    vamplitude = 0;
if (type == 0)
{
    draw_set_alpha(0.2);
    scr_84_get_font("8bit");
    draw_set_color(c_yellow);
    for (var i = 0; i < 12; i++)
    {
        draw_set_color(merge_color(mycolor, c_yellow, i / 14));
        draw_text_transformed_outline(x + 240 + (sin((timer / 30) + (i / 2)) * 150 * hamplitude), y + 80 + (cos((timer / 21) + (i / 2)) * 30 * vamplitude), trankstring, 2, 2, mycolor);
    }
    draw_set_alpha(1);
}
if (type == 1)
{
    draw_set_alpha(0.1);
    scr_84_get_font("8bit");
    draw_set_color(c_yellow);
    for (var i = 0; i < 6; i++)
    {
        draw_set_color(merge_color(mycolor, c_yellow, i / 14));
        draw_text_transformed_outline((x + tennax + (i * 240)) - 240, y + 20, trankstring, 2, 2, mycolor);
        draw_text_transformed_outline((x + (tennax * 2) + (i * 240)) - 360, y + 80, trankstring, 2, 2, mycolor);
        draw_text_transformed_outline((x + tennax + (i * 240)) - 240, y + 140, trankstring, 2, 2, mycolor);
        draw_text_transformed_outline((x + (tennax * 2) + (i * 240)) - 360, y + 200, trankstring, 2, 2, mycolor);
    }
    draw_set_alpha(1);
}
tenna_anim += (0.2 + random_range(-pitcherror * 3, pitcherror));
tennax += (1 + random_range(-pitcherror * 12, pitcherror));
if (tennax >= 240)
    tennax -= 240;
for (var i = 0; i < 4; i++)
    draw_sprite_part_ext(spr_tenna_t_pose, tenna_anim + (i * 2), 0, 0, 180, 120, (x - 240) + (i * 240) + tennax, y + random_range(-pitcherror * 4, pitcherror * 4), 2, 2, c_white, (sin(i + (timer / 24)) * 0.2) + 0.3);
if ((timer % 150) == 0)
{
    var tennamarker = scr_marker(x + random_range(700, 100), y + 120 + random_range(-60, 60), spr_tenna_t_pose);
    scr_lerp_var_instance(tennamarker, "image_alpha", 0.5, 0, 30, 0, "out");
    scr_doom(tennamarker, 30);
    tennamarker.image_angle = random(80);
    tennamarker.speed = 1;
    tennamarker.direction = tennamarker.image_angle - 90;
    tennamarker.image_xscale = 0.5;
    tennamarker.image_yscale = 0.5;
    tennamarker.depth = 90000;
    tennamarker.image_speed = 0.5;
    tennamarker.image_alpha = 0.25;
}
if (type == 1)
{
    if (pitcherror >= 0.05)
    {
        draw_sprite_part_ext(spr_perlin_noise_480, 0, 0, 4, 480, 2, x, y + 38 + (sin(timer / 2) * 4) + random(4), 2, 2, c_white, pitcherror);
        draw_sprite_part_ext(spr_perlin_noise_480, 0, 0, 4, 480, 2, x, y + 48 + (sin(timer / 3) * 4) + random(2), 2, 2, c_white, pitcherror);
    }
}
draw_set_blend_mode(bm_normal);
draw_set_color(c_black);
ossafe_fill_rectangle(x, y, x - 999, (y + (height * tvheight)) - 1);
ossafe_fill_rectangle(x + room_width, y, (x + (width * tvwidth)) - 1, (y + (height * tvheight)) - 1);
timer++;
for (var i = 0; i < width; i++)
{
    for (var j = 0; j < height; j++)
    {
        draw_sprite_ext(tvbasesprite, 4, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, c_white, image_alpha);
        draw_sprite_ext(tvbasesprite, 1, x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, c_aqua, 0.6 + (sin((timer / 4) + i + j) * 0.1)), image_alpha);
        draw_sprite_ext(tvbasesprite, 2, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, merge_color(tvbasecolor, c_black, 0.5), image_alpha);
        draw_sprite_ext(tvbasesprite, 3, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, tvbasecolor, image_alpha);
        draw_sprite_ext(tvbasesprite, 5, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, c_white, image_alpha);
    }
}
