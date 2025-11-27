event_inherited();
if (sensed_heart)
{
    var stop_sensing = false;
    with (obj_homealone_heart)
        stop_sensing = interacted == false && interactedobject == -4;
    if (stop_sensing)
    {
        sensed_heart = false;
        alpha_target = 1;
    }
}
if (cover_alpha != alpha_target)
    cover_alpha = lerp(cover_alpha, alpha_target, 0.25);
