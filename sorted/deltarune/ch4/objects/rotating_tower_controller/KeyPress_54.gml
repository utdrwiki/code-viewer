if (!scr_debug())
    exit;
var a = 0;
repeat (1)
{
    orb = instance_create(320, y, obj_vertical_dark_shockwave_new1);
    orb.angle_position = (270 - tower_angle - 80) + irandom(160);
    orb.position = choose("below", "above");
    a++;
}
