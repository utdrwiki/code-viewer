if (con == 0)
{
    timer++;
    var duration = 8;
    var targetxscale = lerp(5, 1.5, timer / duration);
    var targetyscale = lerp(5, 1.5, timer / duration);
    image_xscale = lerp(0, targetxscale, scr_ease_in(timer / duration, 1));
    image_yscale = lerp(0, targetyscale, scr_ease_in(timer / duration, 1));
    if (timer == duration)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 2 && !i_ex(obj_shutta_pipehand))
{
    timer++;
    image_xscale = lerp(1.5, 0, scr_ease_in(timer / 6, 1));
    image_yscale = lerp(1.5, 0, scr_ease_in(timer / 6, 1));
    if (timer == 6)
        instance_destroy();
}
