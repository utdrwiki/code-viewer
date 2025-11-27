var yellow = 9568254;
var green = 65316;
if (active)
{
    if (view_current == 0)
    {
        greensiner++;
        if ((greensiner % 6) == 0)
            greenindex++;
        var sinval = abs(sin(greenindex / 3));
        image_blend = merge_color(green, yellow, sinval);
        if (!haveroom)
            image_blend = c_gray;
    }
    draw_self_board();
}
