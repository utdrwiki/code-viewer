if (!init)
{
    trail_surf = surface_create(room_width, room_height);
    init = true;
}
var _length = array_length(points);
var _point = instance_create(xlast, ylast, obj_make_fountain_ball);
_point.owner = id;
_point.life = 1 - (1 / lifetime);
array_insert(points, 0, _point);
_point.hspeed = sin(siner / 3);
_point.vspeed = cos(siner / 2);
_point.gravity = 0.2;
_point.image_xscale = sizer;
_point.image_yscale = sizer;
_point.depth = -10;
sizer -= 0.025;
if (sizer < 0.05)
    sizer = 1;
if (demo)
{
    var _angle_a = sin(siner / 20) * 45;
    scr_debug_print_persistent("angle", string(_angle_a));
    hingepos.x = camerax() + 320 + lengthdir_x(240, 270 + (sin(siner / 20) * 45));
    hingepos.y = cameray() + lengthdir_y(240, 270 + (sin(siner / 20) * 45));
    x = hingepos.x + lengthdir_x(80, (siner * 10) % 360);
    y = hingepos.y + lengthdir_y(80, (siner * 10) % 360);
    siner++;
}
ylast = y;
xlast = x;
