draw_self();
var draw = true;
if (i_ex(obj_bullettester))
    draw = obj_bullettester.drawdebug;
if (draw)
{
    keya = "[";
    keyb = "]";
    if (myself == 1)
    {
        keya = ";";
        keyb = "'";
    }
    if (myself == 2)
    {
        keya = ".";
        keyb = "/";
    }
    var xx = x + 40;
    var yy = y + 75;
    draw_set_color(merge_color(#3F3F3F, c_white, active));
    draw_set_font(fnt_small);
    draw_text_outline(xx, yy, "spawntype=" + string(global.tempflag[23 + myself]));
    draw_text_outline(xx, yy + 8, "[   ] / [   ]");
    draw_set_color(merge_color(#3F3F3F, c_yellow, active));
    draw_text_outline(xx + 9, yy + 8, keya);
    draw_text_outline(xx + 43, yy + 8, keyb);
}
