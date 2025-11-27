var frames;
if (eye_power == 0)
    frames = 45 - ((3 - sameattack) * 7);
else
    frames = 30;
spotlight_set_goal(x, y, 1.5707963267948966, counter_speed_goal, frames);
alarm[0] = frames;
