curl_fingers();
if (difficulty < 2)
{
    scr_lerpvar("counter_speed", counter_speed, 0, 15);
    scr_lerpvar("angle_counter_speed", angle_counter_speed, 0, 15);
    alarm[1] = 10;
}
else
{
    scr_lerpvar("counter_speed", counter_speed, 0, 10);
    scr_lerpvar("angle_counter_speed", angle_counter_speed, 0, 10);
    alarm[1] = 5;
}
