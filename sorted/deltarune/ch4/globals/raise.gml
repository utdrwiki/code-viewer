function scr_raise(arg0, arg1 = 0.25, arg2 = 10)
{
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = 1;
    }
    if (global.char[arg0] == 0)
        exit;
    var _hltarget = global.char[arg0];
    var _curhp = global.hp[_hltarget];
    var _healpower;
    if (_curhp <= 0)
        _healpower = -_curhp + (global.maxhp[global.char[myself]] * arg1);
    else
        _healpower = arg2;
    scr_heal(arg0, _healpower);
    with (global.charinstance[arg0])
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
    with (global.charinstance[arg0])
        tu--;
}
