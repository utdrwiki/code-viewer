if (target_pipe != -1)
    x = target_pipe.x;
var pipeoutspeed = 6;
var waittime = 7;
if (type == 1)
{
    pipeoutspeed = 6;
    waittime = 12;
}
if (type == 2 || type == 3)
{
    pipeoutspeed = 8;
    waittime = 26;
}
if (type == 5)
{
    pipeoutspeed = 3;
    waittime = 3;
}
if (type == 6)
{
    pipeoutspeed = 6;
    waittime = 11;
}
if (con == 0)
{
    timer++;
    if (timer == 15)
    {
        con = 1;
        timer = 0;
        visible = true;
        if (type == 3 || type == 4 || type == 6)
        {
            sprite_index = spr_shutta_jump;
            image_speed = 0.16666666666666666;
            image_xscale = 0.2;
            image_yscale = 2;
            if (type == 3)
                snd_play(snd_knight_jump_quick);
            else
                snd_play(snd_snd_motor_upper_quick_high);
        }
    }
}
if (con == 1)
{
    timer++;
    y = lerp(target_pipe.y, target_pipe.y - 60, timer / pipeoutspeed);
    if (type == 3 && timer == 3)
        expand = 1;
    if (type == 4 && timer == 2)
        expand = 1;
    if (type == 6 && timer == 2)
        expand = 1;
    if ((timer / pipeoutspeed) >= 0.6)
        goodshot = true;
    if (timer == pipeoutspeed)
    {
        con = 2;
        timer = 0;
        visible = true;
    }
}
if (con == 2)
{
    timer++;
    if (timer == round(waittime / 2) && sprite_index != spr_shutta_jump)
        image_xscale *= -1;
    if (timer == waittime)
    {
        con = 3;
        timer = 0;
        if (type == 3 || type == 4 || type == 6)
            compress = 1;
        snd_play(snd_motor_swing_down);
    }
}
if (con == 3)
{
    timer++;
    y = lerp(target_pipe.y - 60, target_pipe.y, timer / pipeoutspeed);
    if (type == 3 || type == 4 || type == 6)
        image_yscale = lerp(2, 1, timer / pipeoutspeed);
    if ((timer / pipeoutspeed) >= 0.8)
        goodshot = false;
    if (timer == pipeoutspeed)
    {
        instance_destroy();
        if (type == 3 || type == 4 || type == 6)
        {
            with (instance_nearest(x, y, obj_shutta_pipe))
            {
                scr_shakeobj();
                snd_play(snd_bump);
            }
        }
    }
}
if (expand == 1)
{
    expandtimer++;
    var duration = 8;
    var targetxscale = lerp(8, 2, expandtimer / duration);
    image_xscale = lerp(0, targetxscale, scr_ease_in(expandtimer / duration, 1));
    if (expandtimer == duration)
        expand = 0;
}
if (compress == 1)
{
    compresstimer++;
    image_xscale = lerp(2, 0.4, compresstimer / 5);
    if (compresstimer == 5)
        compress = 0;
}
