function scr_down_partymember(arg0)
{
    if (global.char[arg0] == 0)
    {
        debug_print("No party member in slot " + string(arg0));
        exit;
    }
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = 1;
    }
    var _chartarget = global.char[arg0];
    var __hpdiff = max(0, global.hp[_chartarget] + round(global.maxhp[_chartarget] / 2));
    if (__hpdiff > 0)
    {
        with (global.charinstance[arg0])
        {
            hurt = 1;
            hurttimer = 0;
        }
    }
    dmgwriter = instance_create(global.charinstance[arg0].x, (global.charinstance[arg0].y + global.charinstance[arg0].myheight) - 24, obj_dmgwriter);
    dmgwriter.damage = __hpdiff;
    global.hp[_chartarget] = round(-global.maxhp[_chartarget] / 2);
    scr_dead(arg0);
    if (global.myfight == 0 && global.charturn == arg0)
    {
        with (obj_battlecontroller)
            scr_nexthero();
    }
    snd_play(snd_hurt1);
    if (!instance_exists(obj_shake))
        instance_create(0, 0, obj_shake);
}
