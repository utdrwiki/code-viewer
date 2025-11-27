siner++;
timer++;
if (triggertype == 0)
{
    if (camerax() > startingx)
        show = true;
    if (camerax() > endingx || camerax() < startingx)
        show = false;
}
if (triggertype == 1)
{
    show = false;
    with (obj_triggervolume)
    {
        if (place_meeting(x, y, obj_mainchara))
            other.show = true;
    }
}
if (show == true)
{
    image_alpha = lerp(image_alpha, 1, 0.25);
    activetimer++;
}
else
{
    image_alpha = lerp(image_alpha, 0, 0.25);
}
if (image_only)
    exit;
if (line_index < (maxlines - 1) && textactivetimer[stringmax - 1] > (textstartwait[stringmax - 1] + textendwait[stringmax - 1]))
{
    activetimer = 0;
    set_lines = true;
}
if (set_lines)
{
    set_lines = false;
    line_index++;
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        if (alt_sides)
        {
            textx[i] = 0;
            if ((line_index % 2) == 1)
                relx = 400;
        }
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 90);
        texttimer[i] = 0;
        textactivetimer[i] = 0;
        textchar[i] = 0;
        textendwait[i] = (line_index == (maxlines - 1) && (stringmax - 1) == 0) ? 180 : 60;
    }
}
if (show && line_index == (maxlines - 1) && textactivetimer[stringmax - 1] > (textstartwait[stringmax - 1] + textendwait[stringmax - 1]))
{
    triggertype = -1;
    show = false;
    with (obj_cutscene_stairlooper)
        legend_finish = true;
}
