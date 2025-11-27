draw_set_colour(c_white);
draw_set_alpha(alpha);
ossafe_fill_rectangle(camerax() - 10, cameray() - 10, camerax() + camerawidth() + 10, cameray() + cameraheight() + 10, 0);
draw_set_alpha(1);
alpha -= 0.1;
if (alpha <= 0)
    instance_destroy();
