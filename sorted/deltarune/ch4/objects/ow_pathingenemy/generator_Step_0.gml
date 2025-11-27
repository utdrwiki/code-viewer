if (init == 0)
{
    if (gen_timer != -1)
        timer = gen_timer;
    if (gen_rate != -1)
        rate = gen_rate;
    init = 1;
}
if (global.interact == 0)
{
    timer++;
    if ((timer % rate) == 0)
    {
        var enem = instance_create_depth(x, y, depth + 1, obj_ow_pathingenemy);
        scr_size(2, 2, enem);
        enem.element = element;
        enem.r_movetype = r_movetype;
        enem.r_movevistype = r_movevistype;
        enem.r_dir = r_dir;
        enem.r_waittime = r_waittime;
        enem.r_waittimer = r_waittimer;
        enem.r_movetime = r_movetime;
        enem.r_movetimer = r_movetimer;
        enem.r_prefdir = r_prefdir;
        enem.r_influenceable = r_influenceable;
        enem.r_homedistance = r_homedistance;
    }
}
