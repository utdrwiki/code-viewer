var cx = camerax();
var cy = cameray();
if (nohouses == 1)
{
    signx = lerp(signx, cx + 320, 0.16666666666666666);
    timer++;
    if (timer == 15 || timer == 30 || timer == 37)
        snd_play(snd_wing);
    if (timer == 100)
    {
        scr_lerpvar("signy", signy, -120, 30, 3, "in");
        if (!i_ex(obj_dw_points_get_display))
        {
            with (instance_create(cx + 320, signy + 140, obj_dw_points_get_display))
            {
                depth = other.depth - 1;
                if (global.interact == 0)
                    snd_play(snd_scorecollect);
                amount = 1;
                global.flag[1044] += amount;
            }
        }
        timer++;
    }
    if (timer >= 130)
        nohouses = 2;
    mystring = stringsetloc("HOUSES#DESTROYED", "obj_dw_teevie_susiezilla_slash_Draw_0_gml_46_0");
    var sep = 12;
    draw_set_halign(fa_center);
    if (global.lang == "ja")
        draw_set_font(fnt_ja_main);
    else
        draw_set_font(fnt_main);
    var dblue = 6357763;
    draw_text_ext_transformed_color(signx + 0 + 2, signy + 4 + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 4 + 2, signy + 0 + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color((signx - 0) + 2, (signy - 4) + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color((signx - 4) + 2, (signy - 0) + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color((signx - 4) + 2, (signy - 4) + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 4 + 2, (signy - 4) + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color((signx - 4) + 2, signy + 4 + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 4 + 2, signy + 4 + 2, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    dblue = 8259849;
    draw_text_ext_transformed_color(signx + 0, signy + 4, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 4, signy + 0, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx - 0, signy - 4, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx - 4, signy - 0, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx - 4, signy - 4, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 4, signy - 4, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx - 4, signy + 4, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 4, signy + 4, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, dblue, dblue, dblue, dblue, 1);
    draw_text_ext_transformed_color(signx + 0, signy + 0, string_hash_to_newline(mystring), sep, 999, 4, 4, 0, 16777215, 16777215, 65535, 65535, 1);
    draw_set_halign(fa_left);
}
