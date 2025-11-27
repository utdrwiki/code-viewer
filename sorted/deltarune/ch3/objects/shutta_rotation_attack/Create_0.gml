con = 0;
timer = 0;
handlerp = 0;
rotSign = choose(-1, 1);
pivotx = obj_growtangle.x;
pivoty = obj_growtangle.y;
hand_a = instance_create(gt_minx() - (20 * rotSign), gt_miny() - 20, obj_shutta_hands);
hand_a.image_speed = 0;
hand_a.image_index = 0;
hand_a.image_alpha = 0;
hand_a.image_xscale = 2 * rotSign;
hand_a.image_yscale = 2;
hand_b = instance_create(gt_maxx() + (20 * rotSign), gt_maxy() + 20, obj_shutta_hands);
hand_b.image_speed = 0;
hand_b.image_index = 1;
hand_b.image_alpha = 0;
hand_b.image_xscale = 2 * rotSign;
hand_b.image_yscale = 2;
bullets[0] = 0;
listsize = 0;
snapshot = -4;
alarm[0] = 20;
rotation = 0;
surface_alpha = 1;
border = 0;
depth -= 100;
rotspd = 0;
freeze = false;
photo = true;
extra_sprite_obj = -1;
extra_sprite = -1;
difficulty = 0;
if (i_ex(obj_growtangle))
{
    x = obj_growtangle.x;
    y = obj_growtangle.y;
}
else
{
}
pos_lerp = 0;
targetx = 0;
targety = 0;
shotsize = 180;
padding = 15;
hand_a_dist = 0;
hand_b_dist = 0;
init = false;
lerp_time = 30;
framex = x;
framey = y;
multiple = false;
motion_blur = false;
afterimage_count = 2;
afterimage_index = 0;
afterimage_style = 1;
afterimage_interval = 2;
made = 0;
fixed_pivot = true;
writer = -1;
edit_time = 40;
wait_time = 15;
special_timing = false;
max_rotate_speed = 4;
accel = 0.5;
decel = 1;
attacktype = 64;
controller = -1;
other_controller = -1;
with (obj_dbulletcontroller)
{
    if (type == 64)
    {
        other.controller = id;
    }
    else
    {
        other.other_controller = id;
        other.attacktype = type;
    }
}
if (attacktype == 62)
    max_rotate_speed = 2;
if (attacktype == 66)
{
    motion_blur = true;
    max_rotate_speed = 2;
}
if (attacktype == 77)
    motion_blur = true;
if (attacktype == 145)
    max_rotate_speed = 0;
if (attacktype == 147)
    max_rotate_speed = 1;
take_photo = false;
