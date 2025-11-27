xscale += xrate;
yscale += yrate;
alpha = scr_approach(alpha, 0, faderate);
if (alpha == 0)
    instance_destroy();
