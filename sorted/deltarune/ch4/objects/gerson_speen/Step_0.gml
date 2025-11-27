image_speed = lerp(image_speed, 1, 0.04);
speed = lerp(speed, 30, 0.2);
if ((x < (scr_get_box(2) - 600) && direction == 180) || (x > (scr_get_box(0) + 600) && direction == 0))
    instance_destroy();
timer++;
if ((timer % 4) == 0 && x > (obj_growtangle.x - 200) && x < (obj_growtangle.x + 200))
{
    snd_stop(motor_swing_down);
    snd_play_pitch(motor_swing_down, 1.5);
}
