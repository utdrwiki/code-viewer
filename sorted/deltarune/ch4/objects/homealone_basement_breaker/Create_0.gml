event_inherited();
can_interact = true;
basement_parent = instance_find(obj_noellehouse_basement, 0);
flicker_lights = false;
flicker_lights_count = 0;
flicker_lights_timer = 0;
flicker_lights_time = 10;
bolt_marker = scr_marker(x - 10, y - 10, spr_noellehouse_basement_breaker_bolt);
bolt_marker.depth = 0;
bolt_marker.visible = 0;

trigger = function()
{
    can_interact = false;
    alarm[10] = 1;
    flicker_lights = true;
    with (basement_parent)
        lose_power();
};
