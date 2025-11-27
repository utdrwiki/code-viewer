var jp = variable_global_exists("lang") && global.lang == "ja";
timer++;
var str = stringsetloc("LONG", "obj_takingtoolong_short_slash_Draw_0_gml_7_0");
if (tutu)
    str = stringsetloc("TUTU", "obj_takingtoolong_short_slash_Draw_0_gml_9_0");
if (tutu && jp)
{
    str = "カ";
    if (timer > 3)
        str += "　ワ";
    if (timer > 6)
        str += "　イ";
}
draw_set_alpha(1);
draw_set_color(c_white);
if (jp)
    draw_set_font(fnt_ja_mainbig);
else
    draw_set_font(fnt_mainbig);
var num = 1 + max(0, (string_length(str) / 7) - 1);
for (var pos = 1; pos <= string_length(str); pos++)
    draw_text(x + irandom_range(-num, num) + (15 * pos * (1 + jp)), y + irandom_range(-num, num), string_char_at(str, pos));
if (timer > 30)
    instance_destroy();
