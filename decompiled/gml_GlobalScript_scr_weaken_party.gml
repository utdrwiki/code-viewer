scr_weaken_party = function() //gml_Script_scr_weaken_party
{
    var _writedamage = 0
    if (argument_count == 1 && argument[0] == 1)
        _writedamage = 1
    var _didhit = 0
    if _writedamage
    {
        with (obj_dmgwriter)
        {
            if (delaytimer >= 1)
                killactive = true
        }
    }
    for (i = 0; i < 3; i++)
    {
        if (global.char[i] == 0)
        {
        }
        else
        {
            var _chartarget = global.char[i]
            if _writedamage
            {
                var __hpdiff = max(0, (global.hp[_chartarget] - 1))
                if (__hpdiff > 0)
                {
                    with (global.charinstance[i])
                    {
                        hurt = true
                        hurttimer = 0
                    }
                }
                dmgwriter = instance_create(global.charinstance[i].x, ((global.charinstance[i].y + global.charinstance[i].myheight) - 24), obj_dmgwriter)
                dmgwriter.damage = __hpdiff
                if (__hpdiff > 0)
                    _didhit = 1
            }
            if (global.hp[_chartarget] > 0)
                global.hp[_chartarget] = 1
        }
    }
    global.inv = (global.invc * 40)
    if _didhit
    {
        snd_play(snd_hurt1)
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake)
    }
    return;
}

