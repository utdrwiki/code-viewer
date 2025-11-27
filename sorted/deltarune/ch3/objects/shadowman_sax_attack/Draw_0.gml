if (draw_style == 0)
    exit;
if (optimized_draw && !surface_exists(surf))
    surf = surface_create(640, 480);
if (progressLoop < pathLifetime)
{
    draw_set_alpha(1);
}
else
{
    image_alpha = max(0, (pathLifetime + 1) - progressLoop);
    if (!optimized_draw)
        draw_set_alpha((pathLifetime + 1) - progressLoop);
}
if (!freeze)
    loopStart = progressLoop;
colorProgress = 0;
if (loopStart > 1)
{
    if (loopStart > 2)
        colorProgress = 1;
    else
        colorProgress = loopStart - 1;
}
if (image_alpha > 0)
    event_user(7);
if (progressLoop == (pathLifetime + 1))
{
}
if (progressLoop >= pathLifetime)
    progressLoop += fadeSpeed;
else
    progressLoop += grow_Speed;
draw_set_alpha(1);
