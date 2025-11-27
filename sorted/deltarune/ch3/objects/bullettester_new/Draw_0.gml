if (enem1 == 0)
{
    with (obj_bullettester_enemy)
    {
        if (myself == 0)
        {
            other.enem1 = id;
            active = true;
        }
    }
}
if (enem2 == 0)
{
    with (obj_bullettester_enemy)
    {
        if (myself == 1)
            other.enem2 = id;
    }
}
if (enem3 == 0)
{
    with (obj_bullettester_enemy)
    {
        if (myself == 2)
            other.enem3 = id;
    }
}
if (drawdebug)
{
    var space = 16;
    var xx = 8;
    var yy = 368;
    draw_set_font(fnt_ja_dotumche);
    draw_set_color(#FF7F27);
    draw_text(xx, yy + (space * 0), "Controls:");
    draw_set_color(c_white);
    draw_text(xx, yy + (space * 1), "[U]/[I] Difficulty: ");
    draw_set_color(c_red);
    draw_text(xx + 140, yy + (space * 1), string(global.tempflag[27]));
    draw_set_color(c_white);
    draw_text(xx, yy + (space * 2), "Toggle Enemy: ");
    if (i_ex(enem1))
        draw_set_color(merge_color(#3F3F3F, c_white, enem1.active));
    draw_text(xx + 90, yy + (space * 2), "[1]");
    if (i_ex(enem2))
        draw_set_color(merge_color(#3F3F3F, c_white, enem2.active));
    draw_text(xx + 100 + 10, yy + (space * 2), "[2]");
    if (i_ex(enem3))
        draw_set_color(merge_color(#3F3F3F, c_white, enem3.active));
    draw_text(xx + 100 + 30, yy + (space * 2), "[3]");
    draw_set_color(c_white);
    draw_text(xx, yy + (space * 3), "[SHIFT]+[1/2/3] Set spawntype");
    draw_text(xx, yy + (space * 4), "[4]");
    draw_set_color(merge_color(#3F3F3F, c_yellow, neverendingturn));
    draw_text(xx + 28, yy + (space * 4), "Neverending Turn");
    draw_set_color(c_white);
    draw_text(xx, yy + (space * 5), "global.turntimer=" + string(global.turntimer));
    draw_set_color(c_white);
    xx += 210;
    draw_set_color(#332033);
    for (var i = 0; i < 4; i++)
        draw_line(xx + i, yy - 4, xx + i, yy + 140);
    draw_set_color(c_white);
    xx += 8;
    draw_text(xx, yy + (space * 0), "[Z]");
    draw_set_color(c_yellow);
    draw_text(xx + 28, yy + (space * 0), "Start Turn");
    draw_set_color(c_white);
    draw_text(xx, yy + (space * 1), "[Ctrl+Shift+I] Create Instance");
    draw_text(xx, yy + (space * 2), "[Space/R] Restart Room");
    draw_text(xx, yy + (space * 3), "[Tab] Toggle Window Size");
    draw_text(xx, yy + (space * 4), "[Backspace] Toggle Debug Info");
    draw_text(xx, yy + (space * 5), "[Num 3] Toggle Slowmo");
    draw_text(xx, yy + (space * 6), "[B] Switch to Old BulletTester");
    xx += 214;
    draw_set_color(#332033);
    for (var i = 0; i < 4; i++)
        draw_line(xx + i, yy - 4, xx + i, yy + 140);
    draw_set_color(c_white);
}
