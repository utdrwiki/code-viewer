var memh = draw_get_halign();
var memv = draw_get_valign();
var memfont = draw_get_font();
var memcol = draw_get_color();
var memalph = draw_get_alpha();
draw_set_halign(hjustify);
draw_set_halign(vjustify);
draw_set_alpha(alpha);
draw_set_color(textcol);
draw_set_font(font);
var xloc = x;
var yloc = y;
if (clampeven)
{
    xloc = scr_even(x);
    yloc = scr_even(y);
}
if (outline)
    draw_text_outline(xloc, yloc, mystring, outlinecol);
else
    draw_text(xloc, yloc, mystring);
draw_set_color(memcol);
draw_set_halign(memh);
draw_set_valign(memv);
draw_set_alpha(memalph);
draw_set_font(memfont);
