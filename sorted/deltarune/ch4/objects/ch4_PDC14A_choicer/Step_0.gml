global.flag[33] += 1;
if (canchoose == 1)
{
    if (mychoice >= 0 && button1_p())
        event_user(0);
    if (choiced == 0)
    {
        if (left_h())
            mychoice = 0;
        if (choicetotal >= 1 && right_h())
            mychoice = 1;
    }
}
scr_84_set_draw_font("main");
if (choicerstyle == 0)
{
    var str0width = string_width(string_hash_to_newline(global.choicemsg[0]));
    textposx[0] = camerax() + 30;
    textposy[0] = yy + ((13 + d_add) * dar) + (fighting * 30);
    heartposx[0] = textposx[0] + str0width + 10;
    heartposy[0] = yy + ((34 + d_add) * dar) + (fighting * 30);
    if (choicetotal >= 1)
    {
        var str1width = string_width(string_hash_to_newline(global.choicemsg[1]));
        textposx[1] = (xx + (276 * dar)) - str1width;
        textposy[1] = yy + ((13 + d_add) * dar) + (fighting * 30);
        heartposx[1] = camerax() + 284;
        heartposy[1] = yy + ((34 + d_add) * dar) + (fighting * 30);
    }
    if (choicetotal >= 2)
    {
        var msg0right = heartposx[0] + (16 * dar) + string_width(string_hash_to_newline(global.choicemsg[0]));
        var msg1left = heartposx[1];
        var msg2width = string_width(string_hash_to_newline(global.choicemsg[2])) + (16 * dar);
        heartposx[2] = (msg0right + ((msg1left - msg0right) / 2)) - (msg2width / 2);
        heartposy[2] = yy + ((16 + d_add) * dar) + (fighting * 30);
        textposx[2] = heartposx[2] + (16 * dar);
        textposy[2] = yy + ((13 + d_add) * dar) + (fighting * 30);
    }
    if (mychoice >= 0)
    {
        hx = heartposx[mychoice];
        hy = heartposy[mychoice];
    }
}
