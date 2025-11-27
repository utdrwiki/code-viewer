var time_string = stringsetloc("TIME", "obj_chefs_game_slash_Other_13_gml_4_0");
var score_string = stringsetloc("SCORE", "obj_chefs_game_slash_Other_13_gml_5_0");
var popularity_string = stringsetloc("POPULARITY", "obj_chefs_game_slash_Other_13_gml_6_0");
var special_guest = stringsetloc("SPECIAL GUEST!", "obj_chefs_game_slash_Other_13_gml_7_0");
var rainbow = false;
with (obj_chefs_customer)
{
    if (special == true)
    {
        if (x < (camerax() + 490))
            rainbow = true;
    }
}
draw_set_alpha(1);
var mystring = popularity_string;
if (rainbow)
    mystring = special_guest;
var col = 0;
if (dstep != 0)
    col = 5769730;
var space = 2;
draw_set_color(col);
draw_set_alpha(0.5);
draw_set_halign(fa_right);
draw_text_transformed(512 + space, 58 + space, time_string + " " + string(timer), 1, 1, 0);
draw_set_halign(fa_left);
draw_text(128 + space, 58 + space, score_string + " " + string(scorepoints));
draw_set_halign(fa_center);
draw_text(320 + space, 90 + space, mystring);
draw_set_alpha(1);
if (dstep == 0)
    draw_set_color(c_black);
if (dstep == 1)
    draw_set_color(c_white);
var amt = sin(siner / 8);
amt = clamp(amt, 0, 1);
col = merge_color(#FFF200, c_white, abs(amt));
if (dstep == 2)
    draw_set_color(col);
draw_set_halign(fa_right);
draw_text_transformed(512, 58, time_string + " " + string(timer), 1, 1, 0);
draw_set_halign(fa_left);
draw_text(128, 58, score_string + " " + string(scorepoints));
draw_set_halign(fa_center);
draw_text(320, 90, mystring);
draw_set_halign(fa_left);
for (var i = 0; i < 5; i++)
{
    var xloc = 200;
    var xspace = 60;
    var yloc = 144;
    col = 0;
    if (dstep != 0)
        col = 5769730;
    draw_sprite_ext(spr_tenna_allstars_star_no_outline_white_shine, 39, xloc + (i * xspace) + 2, yloc + 2, 2, 2, 0, col, image_alpha * 0.5);
    if (dstep == 0)
        draw_sprite_ext(spr_tenna_allstars_star_no_outline_white_shine, 39, xloc + (i * xspace), yloc, 2, 2, 0, c_black, image_alpha);
    if (dstep == 1)
    {
        amt = sin((siner + (i * 30)) / 8);
        amt = clamp(amt, 0, 1);
        col = merge_color(#FFFFB2, c_white, abs(amt));
        draw_sprite_ext(spr_tenna_allstars_star_no_outline_white_shine, 39, xloc + (i * xspace), yloc, 2, 2, 0, col, image_alpha);
    }
    if (dstep == 2)
        draw_sprite_ext(spr_tenna_allstars_star_no_outline_yellow_shine, star_anim * 4, xloc + (i * xspace), yloc, 2, 2, 0, c_white, 1);
}
draw_set_alpha(1);
