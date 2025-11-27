inst = instance_create_depth(x + 1, y + 1, depth + 1, obj_gerson_item_throw_particle);
if (image_index == 5)
{
    if (image_angle == 0)
        image_angle = 45;
    else
        image_angle = 0;
    image_index = 0;
}
if (speed > 0.8)
{
    speed -= 0.2;
    direction -= 2;
}
timer++;
if (timer == 8)
    instance_create_depth(x, y, depth - 1, obj_gerson_item_steal_anim);
