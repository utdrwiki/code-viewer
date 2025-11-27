width = scr_approach_curve(width, 0, 60 - ceil(length / 8.5), 0.1);
length = scr_approach_curve(length, 500, 18 - ceil(length / 50), 1);
if (width < 0.15)
    instance_destroy();
