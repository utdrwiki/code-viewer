function scr_battle_sprite_set(arg0, arg1, arg2, arg3)
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
            state = 8;
            hurt = 0;
            attacktimer = 0;
            sprite_index = arg1;
            image_speed = arg2;
            image_index = 0;
            if (arg3 == 0)
                maxframes = image_number;
            global.faceaction[myself] = 0;
        }
    }
}
