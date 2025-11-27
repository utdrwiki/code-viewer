points = [];
start_color = c_red;
end_color = c_black;
width = 8;
end_size = 0;
gradient = false;
rounded = false;
lifetime = 40;
xlast = ystart;
ylast = xstart;
demo = true;
siner = 0;
hingepos = new Vector2(0, 0);
depth = 9999;
init = false;
active = true;
size = 0.7;
sizer = size;
lifetime = 20;
burst = true;
active = false;
target = -4;
xoff = 0;
yoof = 0;
subtrail = false;
speed_scale = false;
base_speed = speed;
foreground = -4;
last_orb = -4;

make_burst_ball = function(arg0, arg1, arg2, arg3, arg4)
{
    var _point = instance_create(arg0, arg1, obj_make_fountain_ball_titan);
    _point.owner = id;
    _point.life = 1 - (1 / lifetime);
    array_insert(points, 0, _point);
    _point.speed = arg3;
    _point.direction = arg2;
    _point.gravity = 0.2;
    _point.image_xscale = arg4;
    _point.image_yscale = arg4;
    _point.depth = target.depth - 1;
    _point.hspeed += sin(siner / 3) * 2;
    _point.vspeed += cos(siner / 2) * 2;
    _point.friction = 0.05 * arg3;
    return _point;
};

make_trail_ball = function(arg0, arg1)
{
    var _point = instance_create(arg0, arg1, obj_make_fountain_ball_titan);
    _point.owner = id;
    _point.life = 1 - (1 / lifetime);
    array_insert(points, 0, _point);
    _point.hspeed += sin(siner) * 0.2;
    _point.vspeed += cos(siner) * 0.2;
    _point.gravity = 0.2;
    _point.image_xscale = sizer;
    _point.image_yscale = sizer;
    _point.type = 1;
    _point.depth = (target != -4) ? target.depth : depth;
    siner += 0.25;
    return _point;
};
