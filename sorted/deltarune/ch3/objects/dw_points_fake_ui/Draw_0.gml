scr_darkbox_black(xx, yy, xx + 220, yy + 80);
draw_set_color(c_white);
scr_84_set_draw_font("mainbig");
draw_set_halign(fa_center);
if (increase_points)
{
    display_timer++;
    if (i_ex(obj_writer))
    {
        if (button3_h() == 1)
            amount_display = global.flag[1044];
    }
    if (amount_display < global.flag[1044])
        amount_display = ceil(lerp(amount_display, global.flag[1044], 0.2));
    else
        increase_points = false;
}
var xoff = 0;
if (global.lang == "ja")
    xoff = -10;
draw_text(xx + 60, yy + 24, string(amount_display));
draw_set_halign(fa_left);
draw_text(xx + 90 + xoff, yy + 24, stringsetloc(" POINTs", "obj_dw_points_fake_ui_slash_Draw_0_gml_25_0"));
