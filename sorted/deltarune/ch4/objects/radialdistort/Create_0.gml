time_percent = 0;
duration = 2;
u_distort_pos = shader_get_uniform(shd_distortiondonut, "distort_pos");
u_time = shader_get_uniform(shd_distortiondonut, "time");
u_donut = shader_get_uniform(shd_distortiondonut, "donut");
surf_distort = -1;
surf_capture = -1;
time_started = get_timer();

ring_update = function(arg0)
{
    ring_start = lerp(1, 900, arg0);
    ring_width = lerp(50, 300, arg0);
    ring_strength = lerp(1, 0, arg0);
};

ring_update(0);
depth = -9999;
alpha = 1;
