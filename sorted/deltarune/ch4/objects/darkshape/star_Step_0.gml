speed *= 0.9;
timer++;
x += (sin(timer * sin_val1) * 0.5);
y += (cos(timer * sin_val2) * 0.5);
if (sprite_index == spr_darkshape_transform)
    image_blend = make_color_rgb(r, g, b);
