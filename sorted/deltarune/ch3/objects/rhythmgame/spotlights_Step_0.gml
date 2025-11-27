if (!init)
{
    init = true;
    if (flip)
        center_angle = -15;
    direction += center_angle;
}
direction = 270 + center_angle + (sin(siner / 20) * (range / 2));
direction = round(direction);
if (con >= 2)
    siner += (flip ? -1 : 1);
image_angle = direction - 270;
