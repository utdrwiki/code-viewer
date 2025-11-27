if (!i_ex(obj_knight_roaring_fx))
    image_alpha -= 0.1;
if (image_alpha < 0)
    instance_destroy();
g = scr_approach(g, g_goal, 255 / fade_time);
b = scr_approach(b, b_goal, 255 / fade_time);
circle_size = scr_approach(circle_size, size_goal, growth);
if (r == 0 && b == 0 && b == 0)
    instance_destroy();
