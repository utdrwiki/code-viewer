event_inherited();
damage = 18;
target = 3;
active = 1;
move = 0;
cloud_angle = 0;
clouds = [];
y_scale = 0;
event_user(1);

function sort_cloud(arg0, arg1)
{
    return sign(arg1.z_depth - arg0.z_depth);
}

var _cr = instance_create_depth(0, 0, depth, obj_cloud_render);
_cr.front = false;
_cr = instance_create_depth(0, 0, depth, obj_cloud_render);
_cr.front = true;
