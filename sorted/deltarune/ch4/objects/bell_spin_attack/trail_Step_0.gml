timer++;
if (timer <= 8)
    image_blend = merge_color(c_red, c_white, timer / 8);
else
    image_alpha -= 0.1;
if (image_alpha <= 0)
    instance_destroy();
