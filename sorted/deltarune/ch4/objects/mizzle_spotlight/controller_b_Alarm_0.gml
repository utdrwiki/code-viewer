var frames;
if (eye_power == 0)
    frames = 45 - ((3 - sameattack) * 7);
else
    frames = 30;
spotlight_set_goal(scr_get_box(4) + irandom_range(-40, 40), scr_get_box(5) + irandom_range(-40, 40), 1.5707963267948966, counter_speed_goal, frames);
alarm[1] = frames;
