var peekoutspeed = 8;
var waittime = 12;
if (type == 1)
{
}
if (type == 2 || type == 3)
{
}
if (con == 0)
{
    timer++;
    if (timer == 15)
    {
        con = 1;
        timer = 0;
        visible = true;
        snd_play(snd_snd_motor_upper_quick_high);
    }
}
if (con == 1)
{
    timer++;
    image_index = lerp(0, 8, timer / peekoutspeed);
    if (timer == peekoutspeed)
    {
        con = 2;
        timer = 0;
        visible = true;
    }
}
if (con == 2)
{
    timer++;
    if (timer == waittime)
    {
        con = 3;
        timer = 0;
        snd_play(snd_motor_swing_down);
    }
}
if (con == 3)
{
    timer++;
    image_index = lerp(image_index, 0, timer / peekoutspeed);
    if (timer == peekoutspeed)
        instance_destroy();
}
