if (topper)
{
    var _sin = sin(siner / 12) * 10;
    if (bounce)
        draw_self_offset(0, abs(_sin));
    else
        draw_self_offset(0, _sin);
    siner++;
    if (x >= 700)
        x -= 840;
}
else
{
    if (big)
    {
        size += 0.25;
        image_xscale += 0.005;
        image_yscale += 0.005;
    }
    else
    {
        size += 0.5;
        image_xscale += 0.01;
        image_yscale += 0.01;
    }
    draw_self();
}
if (y <= (-20 - size))
    instance_destroy();
