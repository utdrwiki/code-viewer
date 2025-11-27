if (!init)
{
    init_timer++;
    if (init_timer == 1)
        alarm[2] = 1;
    if (init_timer > 1)
    {
        if (!init_plot)
        {
            looper.dialogue_finish = true;
            instance_destroy();
            exit;
        }
        else
        {
            init = true;
        }
    }
    exit;
}
if (con == 0 && looper.enteredloop == 1 && global.interact == 0)
{
    looper.preventmenu = 1;
    con = 1;
    alarm[0] = 1;
    alarm[1] = 2;
}
if (con == 10 && !d_ex())
{
    con = 2;
    looper.dialogue_finish = true;
    alarm[3] = 1;
}
