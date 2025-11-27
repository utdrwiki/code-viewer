spawn_list = [];
timer = 0;
pulse_siner = 0;

create_spawn = function()
{
    _index = 0;
    _increment = 1.0471975511965976;
    _radius = 180;
    spawn_pos = [];
    spawn_pos[0] = [24, 16, -44, 30, -20, -10];
    spawn_pos[1] = [10, -30, 10, -40, -30, 20];
    for (var a = 0; a < (2 * pi); a += _increment)
    {
        var xx = camerax() + (view_wport[0] / 2) + (cos(a) * _radius);
        var yy = cameray() + (view_hport[0] / 2) + (sin(a) * _radius);
        var y_offset = spawn_pos[0][a];
        var x_offset = spawn_pos[1][a];
        spawn_list[_index] = instance_create(xx + x_offset, yy + y_offset, obj_titan_climb_spawn);
        spawn_list[_index].image_xscale = -2;
        spawn_list[_index].image_angle = point_direction(xx, yy, camerax() + (view_wport[0] / 2), yy);
        if (spawn_list[_index].image_angle >= 180)
            spawn_list[_index].image_yscale = -2;
        spawn_list[_index].depth = 8970;
        var fade_in_time = 1 + (_index * 15);
        with (spawn_list[_index])
            alarm[0] = fade_in_time;
        _index++;
    }
};

hide_spawn = function()
{
    for (var i = 0; i < array_length(spawn_list); i++)
    {
        var spawn = spawn_list[i];
        with (spawn)
            fade_out();
    }
};
