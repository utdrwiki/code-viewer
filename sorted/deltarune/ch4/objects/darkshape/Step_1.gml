var eff_speed = myspeed * (1 + (sin(true_timer * 0.15) * 0.6));
var hx = obj_heart.x + 10;
var hy = obj_heart.y + 10;
x += lengthdir_x(eff_speed * 1, direction);
y += lengthdir_y(eff_speed * 1, direction);
if (updateimageangle)
    image_angle = direction;
var turning_mult = 0.5 - (sin(true_timer * 0.15) * 0.5);
var anglediff = angle_difference(direction, point_direction(x, y, hx, hy));
direction -= clamp(sign(anglediff) * tracking_val * turning_mult, -abs(anglediff), abs(anglediff));
