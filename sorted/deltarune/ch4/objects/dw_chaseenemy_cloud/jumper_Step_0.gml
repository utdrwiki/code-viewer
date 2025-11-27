direction += 2;
image_angle = direction + 90;
image_blend = merge_color(c_white, c_black, timer / 1000);
timer += 1;
x += (camerax() - lastx);
lastx = camerax();
