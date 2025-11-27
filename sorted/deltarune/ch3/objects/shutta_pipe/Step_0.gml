if (con == 0)
{
    timer++;
    var duration = 8;
    var targetxscale = lerp(4, 1.3, timer / duration);
    var targetyscale = lerp(3, 1, timer / duration);
    image_xscale = lerp(0, targetxscale, scr_ease_in(timer / duration, 1));
    image_yscale = lerp(0, targetyscale, scr_ease_in(timer / duration, 1));
    if (timer == duration)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1 && !i_ex(obj_shutta_pipehand))
{
    timberb++;
    var a = 4;
    var b = 40;
    if (type == 1)
    {
        if (timberb > 0)
            siner++;
        y = ystart + (sin(siner / a) * b);
    }
    if (type == 2)
    {
        if (timberb > 0)
            siner++;
        y = ystart - (sin(siner / a) * b);
    }
}
if (con == 2 && !i_ex(obj_shutta_pipehand))
{
    timer++;
    image_xscale = lerp(1.3, 0, scr_ease_in(timer / 6, 1));
    image_yscale = lerp(1, 0, scr_ease_in(timer / 6, 1));
    if (timer == 6)
        instance_destroy();
}
