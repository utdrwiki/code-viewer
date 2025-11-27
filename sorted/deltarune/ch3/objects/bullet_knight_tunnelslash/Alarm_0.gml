boxdir = median(180, point_direction(x, y, scr_get_box(2) + (scr_get_box(4) * 0.5), scr_get_box(1) + (scr_get_box(5) * 0.5)));
new_x = x + lengthdir_x(90, boxdir + 180);
new_y = y + lengthdir_y(90, boxdir + 180);
scr_lerpvar_instance(id, "x", x, new_x, 8, 2, "out");
scr_lerpvar_instance(id, "y", y, new_y, 8, 2, "out");
if (irandom(5))
    aim = point_direction(new_x, new_y, obj_heart.x + 10, obj_heart.y + 10 + irandom_range(-60, 60));
else
    aim = point_direction(new_x, new_y, obj_heart.x + 10, obj_heart.y + 10);
totalspin = 640 + irandom(80);
