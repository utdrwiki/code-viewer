if (hit == true)
    exit;
if (image_index < 1)
{
    shaketimer = 10;
    alarm[0] = 3;
    hitwindow = true;
    with (obj_shootout_controller)
        hitwindow = false;
}
else
{
    state = "open";
    hit = true;
    char_state = "hit";
    char_timer = -1;
    timerc = 0;
    with (obj_shootout_controller)
        hitwindow = true;
}
