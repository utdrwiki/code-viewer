if (falling)
{
    fall_time++;
    y = ease_out_bounce(fall_time, start_y, final_y - start_y - (bbox_bottom - y), fall_duration);
    if (fall_time == fall_duration)
        falling = false;
}
if (sprite_index == spr_realisticexplosion && image_index >= 11 && image_index < 14)
    image_index = 14;
