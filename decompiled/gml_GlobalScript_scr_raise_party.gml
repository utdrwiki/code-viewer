scr_raise_party = function() //gml_Script_scr_raise_party
{
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = true
    }
    for (i = 0; i < 3; i++)
    {
        if (global.char[i] == 0)
        {
        }
        else
        {
            var _hltarget = global.char[i]
            var _curhp = global.hp[_hltarget]
            if (_curhp <= 0)
                var _healpower = ((-_curhp) + 5)
            else
                _healpower = 1
            scr_heal(i, _healpower)
            with (global.charinstance[i])
            {
                ha = instance_create(x, y, obj_healanim)
                ha.target = id
                dmgwr = scr_dmgwriter_selfchar()
                with (dmgwr)
                {
                    delay = 8
                    type = 3
                    damage = _healpower
                }
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3
                }
                tu += 1
            }
        }
    }
    for (i = 0; i < 3; i++)
    {
        with (global.charinstance[i])
            tu--
    }
    return;
}

