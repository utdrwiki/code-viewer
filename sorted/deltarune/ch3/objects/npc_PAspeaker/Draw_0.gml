if (active)
{
    draw_sprite_ext(spr_pxwhite, 0, x, y - 10 - 4 - 4, -640, 40, 0, c_black, 0.3 * baralpha);
    draw_sprite_ext(spr_pxwhite, 0, x, y - 10 - 2 - 4, -640, 36, 0, c_black, 0.6 * baralpha);
    draw_sprite_ext(spr_pxwhite, 0, x, y - 10 - 4, -640, 32, 0, c_black, 1 * baralpha);
    if (init == 0)
    {
        mystring += "        ";
        strlength = string_length(mystring);
        init = 1;
    }
    siner++;
    strtimer++;
    if (strtimer >= rate)
    {
        if (charindex < (strlength - 1))
        {
            charindex++;
            var thisletter = string_char_at(mystring, charindex);
            if (thisletter != " " && thisletter != "." && thisletter != "!" && thisletter != "&" && thisletter != "\"")
                play = 1;
            else
                image_index = 0;
            strtimer = 0;
            if (charindex > 100)
                minchar++;
            endtimer = 0;
            endevent = 0;
        }
        else
        {
            endtimer++;
            if (endtimer >= 10 && endtimer < 120)
            {
                var __amt = (endtimer * 3) / 100;
                add1 += random_range(-__amt, __amt);
                add2 += random_range(-__amt, __amt);
                add3 += random_range(-__amt, __amt);
                add4 += random_range(-__amt, __amt);
            }
            if (endtimer >= 120)
            {
                if (endevent == 0)
                {
                    endevent = 1;
                    scr_delay_var("active", 0, 15);
                    scr_lerpvar("botpinch", botpinch, 0, 14, -2, "out");
                    scr_lerpvar("add1", add1, 0, 14, -2, "out");
                    scr_lerpvar("add2", add2, 0, 14, -2, "out");
                    scr_lerpvar("add3", add3, 0, 14, -2, "out");
                    scr_lerpvar("add4", add4, 0, 14, -2, "out");
                    scr_lerpvar("baralpha", baralpha, 0, 14);
                    scr_delay_var("charindex", 0, 16);
                    scr_delay_var("charindex", 0, 16);
                    scr_delay_var("textx", 8, 16);
                    sprite_index = offsprite;
                    scr_delay_var("strtimer", 0, 16);
                }
            }
        }
    }
    textx += (hspace / rate);
    draw_set_color(c_yellow);
    draw_set_font(scr_84_get_font("main"));
    var smallamt = 6;
    var wobbleamount = 2;
    draw_set_alpha(baralpha);
    var n = smallamt;
    var i = max(charindex - smallamt, minchar);
    while (i < charindex)
    {
        draw_text_transformed((x - textx) + (i * hspace), y + (sin((siner + i) / 8) * wobbleamount) + yoff, string_char_at(mystring, i), n / smallamt, n / smallamt, 0);
        n--;
        i++;
    }
    if (charindex >= (smallamt + 1))
    {
        for (i = minchar; i < (charindex - smallamt); i++)
            draw_text((x - textx) + (i * hspace), y + (sin((siner + i) / 8) * wobbleamount) + yoff, string_char_at(mystring, i));
    }
    draw_set_alpha(1);
    draw_set_color(c_white);
}
if (bounce == 1)
{
    image_yscale = 2.5;
    image_xscale = (image_xscale < 0) ? -1.5 : 1.5;
    bounce = 2;
}
if (bounce == 2)
{
    var target_scale = (image_xscale < 0) ? -2 : 2;
    scr_lerpvar("image_xscale", image_xscale, target_scale, 16, -2, "out");
    scr_lerpvar("image_yscale", image_yscale, 2, 16, -2, "out");
    bounce = 3;
}
if (bounce == 3)
{
    if (image_yscale <= 2.01)
    {
        image_yscale = 2;
        bounce = 0;
    }
}
x1 = x - sprite_xoffset;
y1 = y - sprite_yoffset;
x2 = (x - sprite_xoffset) + sprite_width;
y2 = y - sprite_yoffset;
x3 = (x - sprite_xoffset) + sprite_width;
y3 = (y - sprite_yoffset) + sprite_height;
x4 = x - sprite_xoffset;
y4 = (y - sprite_yoffset) + sprite_height;
if (drawtype == 0)
{
    x1 += add1;
    y1 += add2;
    x2 += add3;
    y2 += add4;
    if (xscale != 2)
    {
        x1 = x + ((x1 - x) * (xscale / 2));
        x2 = x + ((x2 - x) * (xscale / 2));
        x3 = x + ((x3 - x) * (xscale / 2));
        x4 = x + ((x4 - x) * (xscale / 2));
    }
    if (yscale != 2)
    {
        y1 = y + ((y1 - y) * (yscale / 2));
        y2 = y + ((y2 - y) * (yscale / 2));
        y3 = y + ((y3 - y) * (yscale / 2));
        y4 = y + ((y4 - y) * (yscale / 2));
    }
    draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
    if (debugbox)
    {
        draw_set_color(c_lime);
        draw_line(x1, y1, x2, y2);
        draw_line(x2, y2, x3, y3);
        draw_line(x3, y3, x4, y4);
        draw_line(x4, y4, x1, y1);
    }
}
if (drawtype == 1)
    draw_self();
