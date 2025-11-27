event_inherited();
damage = 50;
target = 3;
active = 1;
sloped = 0;
if (i_ex(obj_dw_churchc_slidingpiano))
    active = 0;
harmless = 0;
move = 0;
minspeed = -0.3;
maxspeed = -1.3;
speedmult = lerp(1, 0.7, clamp(global.flag[1583] / 3, 0, 1));
cloud_angle = 0;
clouds = [];
y_scale = 0;
miny = 0;
spd = 0;
rotatespeed = 1;
event_user(1);

obj_cloud_controller_new.sort_cloud = function(arg0, arg1)
{
    return sign(arg1.z_depth - arg0.z_depth);
};

var _cr = instance_create_depth(0, 0, depth, obj_cloud_render_new);
_cr.front = false;
_cr = instance_create_depth(0, 0, depth, obj_cloud_render_new);
_cr.front = true;
