image_speed = 0;
image_xscale = 2;
image_yscale = 2;
creator = 0;
skipme = false;
xoff = -18;
yoff = -28;
if (!i_ex(obj_growtangle))
{
    aim_x = camerax() + 320;
    aim_y = cameray() + 170 + 20;
}
else
{
    aim_x = obj_growtangle.x - (obj_growtangle.sprite_width * 0.5);
    aim_y = obj_growtangle.y + irandom_range(-30, 30);
}
aim_angle = point_direction(x + 40, y + 82, aim_x, aim_y);
reload = 32;
if (i_ex(obj_shutta_enemy))
    reload = 40;
alarm[0] = 12;
alarm[1] = 16;
