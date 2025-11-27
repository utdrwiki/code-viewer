function scr_raise_party()
{
    var _start = 0;
    var _end = 3;
    if (scr_debug())
    {
        if (keyboard_check(ord("1")))
        {
            _start = 0;
            _end = 1;
        }
        else if (keyboard_check(ord("2")))
        {
            _start = 1;
            _end = 2;
        }
        else if (keyboard_check(ord("3")))
        {
            _start = 2;
            _end = 3;
        }
    }
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = 1;
    }
    for (i = _start; i < _end; i++)
    {
        if (global.char[i] == 0)
            continue;
        var _hltarget = global.char[i];
        var _curhp = global.hp[_hltarget];
        var _healpower;
        if (_curhp <= 0)
            _healpower = -_curhp + round(global.maxhp[_hltarget] / 4);
        else
            _healpower = 10;
        scr_heal(i, _healpower);
        with (global.charinstance[i])
        {
            ha = instance_create(x, y, obj_healanim);
            ha.target = id;
            dmgwr = scr_dmgwriter_selfchar();
            with (dmgwr)
            {
                delay = 8;
                type = 3;
                damage = _healpower;
            }
            if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
            {
                with (dmgwr)
                    specialmessage = 3;
            }
            tu += 1;
        }
    }
    for (i = _start; i < _end; i++)
    {
        with (global.charinstance[i])
            tu--;
    }
}
