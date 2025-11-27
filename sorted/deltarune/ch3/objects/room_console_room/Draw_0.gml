var count = 0;
var yspace = 0;
draw_set_font(fnt_small);
if (i_ex(star))
{
    with (star)
    {
        siner++;
        image_alpha = 1.5 + sin(siner / 30);
    }
}
