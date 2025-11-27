repeat (3)
{
    part = instance_create(x + lengthdir_x(36, (image_angle - 30) + irandom(60)), y + lengthdir_y(36, (image_angle - 30) + irandom(60)), obj_shield_just_particle);
    part.depth = depth - 1;
    part.direction = idealdir;
}
