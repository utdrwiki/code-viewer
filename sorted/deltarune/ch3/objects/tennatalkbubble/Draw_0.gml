if (init)
{
    if (global.lang == "ja")
        draw_set_font(fnt_ja_dotumche);
    else
        draw_set_font(fnt_dotumche);
    if (bubblewidth == -1)
        bubblewidth = round(string_width(truetext) / 2) + bubblepadding;
    if (bubbleheight == -1)
        bubbleheight = round(string_height(truetext) / 2) + bubblepadding;
    if (taillength == -1)
        taillength = abs(bubblewidth + bubbleheight) * 1.25;
    if (tailwidth == -1)
        tailwidth = 8;
    var taildir = point_direction(x + tailxoffset, y + tailyoffset, tx, ty);
    if (bubbletype == 1)
        taildir = type1direction;
    var tailendx = x + lengthdir_x(taillength, taildir);
    var tailendy = y + lengthdir_y(taillength, taildir);
    if (bubbletype == 2)
    {
        tailxoffset = 0;
        tailyoffset = 0;
        tailendx = t2x;
        tailendy = t2y;
        taildir = point_direction(x + tailxoffset, y + tailyoffset, t2x, t2y);
        taillength = point_distance(x, y, t2x, t2y);
    }
    var tailendxthick = x + lengthdir_x(taillength + outlineThickness, taildir);
    var tailendythick = y + lengthdir_y(taillength + outlineThickness, taildir);
    var tailtopx1 = x + tailxoffset + lengthdir_x(tailwidth, taildir + 90);
    var tailtopy1 = y + tailyoffset + lengthdir_y(tailwidth, taildir + 90);
    var tailtopx2 = (x - tailxoffset) + lengthdir_x(tailwidth, taildir - 90);
    var tailtopy2 = (y - tailyoffset) + lengthdir_y(tailwidth, taildir - 90);
    draw_set_color(outlineColor);
    draw_circle(x - bubblewidth, y - bubbleheight, 8 + outlineThickness, 0);
    draw_circle(x + bubblewidth, y - bubbleheight, 8 + outlineThickness, 0);
    draw_circle(x - bubblewidth, y + bubbleheight, 8 + outlineThickness, 0);
    draw_circle(x + bubblewidth, y + bubbleheight, 8 + outlineThickness, 0);
    ossafe_fill_rectangle(x - bubblewidth, y - bubbleheight - 8 - outlineThickness, x + bubblewidth, y + bubbleheight + 8 + outlineThickness, 0);
    ossafe_fill_rectangle(x - bubblewidth - 8 - outlineThickness, y - bubbleheight, x + bubblewidth + 8 + outlineThickness, y + bubbleheight, 0);
    draw_line_width(tailendxthick, tailendythick, tailtopx1, tailtopy1, outlineThickness * 2);
    draw_line_width(tailendxthick, tailendythick, tailtopx2, tailtopy2, outlineThickness * 2);
    draw_set_color(textbubbleColor);
    draw_circle(x - bubblewidth, y - bubbleheight, 8, 0);
    draw_circle(x + bubblewidth, y - bubbleheight, 8, 0);
    draw_circle(x - bubblewidth, y + bubbleheight, 8, 0);
    draw_circle(x + bubblewidth, y + bubbleheight, 8, 0);
    ossafe_fill_rectangle(x - bubblewidth, y - bubbleheight - 8, x + bubblewidth, y + bubbleheight + 8, 0);
    ossafe_fill_rectangle(x - bubblewidth - 8, y - bubbleheight, x + bubblewidth + 8, y + bubbleheight, 0);
    draw_triangle(tailendx, tailendy, tailtopx1, tailtopy1, tailtopx2, tailtopy2, 0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (dropshadow == true)
    {
        draw_set_color(dropColor);
        draw_set_alpha(0.25);
        draw_text(x, y + 1, string_hash_to_newline(truetext));
        draw_text(x + 1, y + 1, string_hash_to_newline(truetext));
        draw_text(x + 1, y, string_hash_to_newline(truetext));
    }
    draw_set_alpha(1);
    draw_set_color(textColor);
    if (textColor == textbubbleColor)
        textColor = 0;
    draw_text(x, y, string_hash_to_newline(truetext));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
