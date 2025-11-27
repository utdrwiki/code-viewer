var jp = variable_global_exists("lang") && global.lang == "ja";
timer++;
var str;
if (jp)
{
    if (timer < 10)
        str = "ナ";
    else if (alt)
        str = "ナ           ガ ッ";
    else
        str = "ナ　ガ           イ";
}
else if (alt)
{
    str = stringsetloc("LO          NG", "obj_yourlong_slash_Draw_0_gml_7_0");
}
else
{
    str = stringsetloc("YOUR          LONG", "obj_yourlong_slash_Draw_0_gml_9_0");
}
draw_set_alpha(1);
draw_set_color(c_white);
if (jp)
    draw_set_font(fnt_ja_mainbig);
else
    draw_set_font(fnt_mainbig);
var num = 1 + ((3 - jp) * (timer > (30 - (25 * alt))));
for (var pos = 1; pos <= ceil(string_length(str) / (1 + (timer < (30 - (25 * alt))))); pos++)
    draw_text(x + irandom_range(-num, num) + (15 * pos) + (28 * alt), y + irandom_range(-num, num), string_char_at(str, pos));
if (timer > (75 - (30 * alt)))
    instance_destroy();
