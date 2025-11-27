event_inherited();
if (flicker_lights)
{
    flicker_lights_timer++;
    if (flicker_lights_timer == 1)
        bolt_marker.visible = 1;
    if (flicker_lights_timer == flicker_lights_time)
    {
        flicker_lights_count++;
        flicker_lights_time -= 2;
        bolt_marker.visible = 0;
        if (flicker_lights_count > 3)
            flight_lights = false;
        else
            flicker_lights_timer = 0;
    }
}
