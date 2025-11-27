event_inherited();
timer++;
base = scr_approach_curve(base, 0, 50);
hspeed = ((sin(timer / driftrate) * drift) / max(base, 1)) + base;
image_angle = sin(timer / 11) * 15;
