if (!scr_debug())
    exit;
var a = 0;
var b = irandom(7);
var c = b + 6;
var d = c + 6;
repeat (18)
{
    if (a == b || a == c || a == d)
    {
    }
    else
    {
        orb = instance_create(320, y, obj_vertical_dark_shockwave1);
        orb.angle_position = a * 20;
        orb.position = choose("above", "below");
    }
    a++;
}
