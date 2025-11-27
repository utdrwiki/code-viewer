function scr_battle_force_action(arg0, arg1, arg2, arg3)
{
    _charactor = arg0;
    _charinstance = obj_herokris;
    if (_charactor == "noelle")
    {
        _charinstance = obj_heronoelle;
        _charnum = 4;
    }
    if (_charactor == "ralsei")
    {
        _charinstance = obj_heroralsei;
        _charnum = 3;
    }
    if (_charactor == "susie")
    {
        _charinstance = obj_herosusie;
        _charnum = 2;
    }
    if (_charactor == "kris")
    {
        _charinstance = obj_herokris;
        _charnum = 1;
    }
    if (instance_exists(_charinstance))
    {
        with (_charinstance)
        {
            if (arg1 == "hurt")
                hurt = 1;
            if (arg1 == "defend")
                global.faceaction[myself] = 4;
            if (arg1 == "attack")
            {
                points = 150;
                state = 1;
                force = 1;
                global.chartarget[myself] = arg2;
            }
            if (arg1 == "spell")
            {
                state = 2;
                attacktimer = 0;
                force = 1;
                global.chartarget[myself] = arg2;
                global.faceaction[myself] = 2;
                global.charaction[myself] = 2;
                global.charspecial[myself] = arg3;
            }
            if (arg1 == "spare")
            {
                state = 2;
                attacktimer = 0;
                force = 1;
                global.chartarget[myself] = arg2;
                global.faceaction[myself] = 2;
                global.charaction[myself] = 2;
                global.charspecial[myself] = 100;
            }
            if (arg1 == "item")
            {
                state = 2;
                attacktimer = 0;
                force = 1;
                global.chartarget[myself] = arg2;
                global.faceaction[myself] = 2;
                global.charaction[myself] = 2;
                global.charspecial[myself] = 100;
            }
            if (arg1 == "act")
            {
                state = 6;
                global.actingchoice[_charnum] = arg3;
                with (obj_battlecontroller)
                {
                    actsimul[arg3] = global.actsimul[arg2][arg3];
                    scr_actselect(arg2, arg3);
                }
            }
        }
    }
}
