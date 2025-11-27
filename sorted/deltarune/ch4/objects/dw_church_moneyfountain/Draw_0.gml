with (shine)
{
    siner++;
    image_alpha = (abs(sin(siner / 45)) * 0.8) + 0.25;
}
with (fountain)
{
    if (scr_debug())
    {
    }
}
var cx = (camerax() + 240) - 80;
var cy = cameray() + 240 + 4;
if (i_ex(obj_numberentry))
{
    var width = 394;
    scr_darkbox_ext(cx - 8 - 6, cy - 6, width, 120);
    mystring = stringsetloc("In Fountain", "obj_dw_church_moneyfountain_slash_Draw_0_gml_27_0");
    moneystring1 = "D$" + string(global.flag[898] + obj_numberentry.num);
    mystring2 = stringsetloc("Remaining On Hand", "obj_dw_church_moneyfountain_slash_Draw_0_gml_29_0");
    moneystring2 = "D$" + string(global.gold - obj_numberentry.num);
    var space = 36;
    draw_text_darkshadow(cx, cy + (space * 0), mystring);
    draw_text_darkshadow(cx, cy + (space * 1), mystring2);
    draw_set_halign(fa_right);
    draw_text_darkshadow((cx + width) - 26, cy + (space * 0), moneystring1);
    draw_text_darkshadow((cx + width) - 26, cy + (space * 1), moneystring2);
    draw_set_halign(fa_left);
}
