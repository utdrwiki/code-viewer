event_inherited();
image_angle += 2.8125;
if (tracking_val2 > 0)
    tracking_val2 = scr_approach(tracking_val2, 0, 0.00875);
if (speed > 2)
{
    with (scr_afterimagefast())
        image_alpha = 0.3;
}
