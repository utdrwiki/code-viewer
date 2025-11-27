split_start = false;
x_pos = 0;
target_x_pos = 0;
interval_size = 0;
target_interval_size = 80;
cageshake = 0;
cageamt = 0;
shaketimer = 0;
wagon_x = 235;
wagon_y = 165;
heartwagon = 0;
heartx = 0;
hearty = 0;
kris_sprite = spr_kris_backwalk_left;
kris_index = 0;
phone_index = 0;
if (variable_global_exists("heart_wagon"))
{
    heartx = global.heart_wagon[0];
    hearty = global.heart_wagon[1];
}
scr_delay_var("split_start", true, 30);
scr_delay_var("target_x_pos", -80, 90);
