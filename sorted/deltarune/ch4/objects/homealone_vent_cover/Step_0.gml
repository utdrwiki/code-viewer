if (!sensed_heart)
{
    if (place_meeting(x, y, obj_homealone_heart))
    {
        sensed_heart = true;
        alpha_target = 0;
    }
}
if (sensed_heart)
{
    if (!place_meeting(x, y, obj_homealone_heart))
    {
        sensed_heart = false;
        alpha_target = 1;
    }
}
if (cover_alpha != alpha_target)
    cover_alpha = lerp(cover_alpha, alpha_target, 0.25);
