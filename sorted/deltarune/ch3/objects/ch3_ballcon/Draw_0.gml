if (appearcon == 0 || appearcon == 2)
{
    appearx1 = lerp(x + (width / 2), x, appeartimer / fadeAmount);
    appearx2 = lerp(x + (width / 2), x + width, appeartimer / fadeAmount);
    appeary1 = lerp(y + (height / 2), y, appeartimer / fadeAmount);
    appeary2 = lerp(y + (height / 2), y + height, appeartimer / fadeAmount);
    draw_set_color(c_white);
    ossafe_fill_rectangle(appearx1, appeary1, appearx2, appeary2, true);
    ossafe_fill_rectangle(appearx1 + 1, appeary1 + 1, appearx2 - 1, appeary2 - 1, true);
    if (appearcon == 0)
    {
        appeartimer += 1;
        if (appeartimer >= fadeAmount)
            appearcon = 1;
    }
    if (appearcon == 2)
    {
        appeartimer -= 1;
        if (appeartimer <= 0)
        {
            appearcon = 99;
            instance_destroy();
        }
    }
}
if (appearcon == 1)
{
    draw_set_color(c_white);
    ossafe_fill_rectangle(x + 16, y + 16, (x + width) - 16, (y + height) - 16, false);
    draw_sprite_ext(spr_ch3_ballcon_corner, 0, x, y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_corner, 0, x + width, y, -2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_corner, 0, x, y + height, 2, -2, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_corner, 0, x + width, y + height, -2, -2, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_line, 0, x + 12, y, width - 24, 2, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_line, 0, x + 12, y + height, width - 24, -2, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_lineside, 0, x, y + 12, 2, height - 24, 0, c_white, 1);
    draw_sprite_ext(spr_ch3_ballcon_lineside, 0, x + width, y + 12, -2, height - 24, 0, c_white, 1);
    if (triangle == 1)
    {
        if (trianglesprite != 4981)
        {
            if (triangleside == 0)
                draw_sprite_ext(trianglesprite, 0, x + 6, (y - 32) + (height / 2), 2, 2, 0, c_white, 1);
            if (triangleside == 1)
                draw_sprite_ext(trianglesprite, 0, (x + width) - 6, (y - 32) + (height / 2), -2, 2, 0, c_white, 1);
        }
        else
        {
            if (triangleside == 0)
                draw_sprite_ext(trianglesprite, 0, x, y, 2, 2, 0, c_white, 1);
            if (triangleside == 1)
                draw_sprite_ext(trianglesprite, 0, x + width, y, -2, 2, 0, c_white, 1);
        }
    }
    if (char > 0)
        draw_sprite_ext(spr_ch3_ballcon_charface, char, x + 25, y + 20, 2, 2, 0, c_white, 1);
}
