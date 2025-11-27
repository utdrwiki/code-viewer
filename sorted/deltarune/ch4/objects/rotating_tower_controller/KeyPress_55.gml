if (!scr_debug())
    exit;
var a = 0;
var dir = choose(-1, 1);
repeat (6)
{
    orb = instance_create(320, y, obj_vertical_dark_laser_new1);
    orb.angle_position = a * 60;
    orb.position = "below";
    orb.dir = dir;
    a++;
}
