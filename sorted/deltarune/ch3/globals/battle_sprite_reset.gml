function scr_battle_sprite_reset(arg0)
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
            state = 0;
            hurt = 0;
            attacktimer = 0;
            attacked = 0;
            maxframes = 0;
            global.faceaction[myself] = 0;
        }
    }
}
