curl_fingers();
if (!difficulty)
{
    scr_lerpvar("counter_speed", counter_speed, base_speed, 30);
    scr_lerpvar("angle_counter_speed", counter_speed, choose(base_angle_speed, -base_angle_speed), 30);
    scr_lerpvar("wave_counter", 0, 1.5707963267948966, 20);
    scr_script_delayed(scr_lerpvar, 20, "wave_counter", 1.5707963267948966, 4.71238898038469, 50);
    scr_script_delayed(scr_lerpvar, 70, "wave_counter", 4.71238898038469, 2 * pi, 20);
    alarm[0] = 80;
}
else if (difficulty == 1)
{
    scr_lerpvar("counter_speed", counter_speed, base_speed, 10);
    scr_lerpvar("angle_counter_speed", counter_speed, choose(base_angle_speed, -base_angle_speed), 10);
    scr_lerpvar("wave_counter", 0, 1.5707963267948966, 5);
    scr_script_delayed(scr_lerpvar, 10, "wave_counter", 1.5707963267948966, 4.71238898038469, 10);
    scr_script_delayed(scr_lerpvar, 20, "wave_counter", 4.71238898038469, 2 * pi, 15);
    alarm[0] = 25;
}
else if (difficulty == 2)
{
    scr_lerpvar("counter_speed", counter_speed, base_speed, 5);
    scr_lerpvar("angle_counter_speed", counter_speed, choose(base_angle_speed, -base_angle_speed), 5);
    scr_lerpvar("wave_counter", 0, 1.5707963267948966, 5);
    scr_script_delayed(scr_lerpvar, 5, "wave_counter", 1.5707963267948966, 4.71238898038469, 10);
    scr_script_delayed(scr_lerpvar, 15, "wave_counter", 4.71238898038469, 2 * pi, 15);
    alarm[0] = 20;
}
