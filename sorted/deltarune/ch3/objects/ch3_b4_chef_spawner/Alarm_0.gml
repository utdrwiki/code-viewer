alarm[0] = 210 - (130 * ((obj_ch3_b4_chef_controller.timer_max - obj_ch3_b4_chef_controller.timer) / obj_ch3_b4_chef_controller.timer_max));
var _max = obj_ch3_b4_chef_controller.timer_max;
var _t = clamp(obj_ch3_b4_chef_controller.timer, 15, _max);
var _r = (_max - _t) / _max;
alarm[0] = (57 - (30 * _r)) / 2;
var fire = instance_create(x, y, obj_ch3_b4_chef_fire);
with (fire)
{
    side = other.side;
    gravity_direction = 90 + (90 * side);
}
