hue_start = 320;
sat_start = 0.6;
val_start = 0.9;
hue_target = 310;
sat_target = 0.7;
val_target = 1;
hue = hue_start;
sat = sat_start;
val = val_start;
wave_time = 4;
depth = 30000;
if (wave_time == 0)
{
    hue = hue_target;
    sat = sat_target;
    val = val_target;
}
u_hsv = shader_get_uniform(shd_hsv_transform, "_hsv");
surf_recolour = -1;
heartbeat_mode = false;
