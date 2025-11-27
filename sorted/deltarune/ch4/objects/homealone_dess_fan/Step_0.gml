event_inherited();
if (turn_on)
{
    var is_active = false;
    if (place_meeting(x - 4, y, obj_homealone_heart))
        is_active = true;
    if (!is_active)
    {
        turn_on = false;
        sprite_index = spr_noellehouse_fan_mini_off;
        image_speed = 0;
        image_index = 0;
        alarm[10] = 1;
    }
}
