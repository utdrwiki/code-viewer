function scr_resetgameshowcharacter(arg0)
{
    if (room == room_dw_puzzlecloset_3)
        exit;
    var _name = arg0;
    var _smooth = 0;
    var __found = 0;
    if (argument_count == 2)
        _smooth = argument1;
    if (_name == "kris" || _name == "kr" || _name == "k" || _name == "Kris" || _name == "Kr" || _name == "K" || _name == "all")
    {
        var _krx = 248;
        var _kry = 400;
        if (scr_swordroom())
        {
            _krx = 300;
            _kry = 298;
        }
        with (obj_mainchara)
        {
            if (_smooth == 0)
            {
                setxy(_krx, _kry);
            }
            else
            {
                scr_lerpvar("x", x, _krx, _smooth);
                scr_lerpvar("y", y, _kry, _smooth);
            }
            fun = true;
            ignoredepth = true;
            depth = 95240;
            sprite_index = spr_krisu_dark;
            image_speed = 0;
            image_index = 0;
            if (scr_swordroom())
            {
                sprite_index = spr_krisu_holdcontroller;
                depth = 96260;
            }
            scr_darksize();
            __found = 1;
        }
    }
    if (_name == "susie" || _name == "su" || _name == "Susie" || _name == "Su" || _name == "S" || _name == "s" || _name == "all")
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                fun = true;
                ignoredepth = true;
                depth = 95165;
                var _sux = 140;
                var _suy = 392;
                if (_smooth == 0)
                {
                    setxy(_sux, _suy);
                }
                else
                {
                    scr_lerpvar("x", x, _sux, _smooth);
                    scr_lerpvar("y", y, _suy, _smooth);
                }
                sprite_index = spr_susie_walk_up_dw;
                image_speed = 0;
                image_index = 0;
                scr_darksize();
                __found = 1;
            }
        }
    }
    if (_name == "ralsei" || _name == "ra" || _name == "Ralsei" || _name == "Ra" || _name == "R" || _name == "r" || _name == "all")
    {
        with (obj_caterpillarchara)
        {
            if (name == "ralsei")
            {
                fun = true;
                ignoredepth = true;
                depth = 95145;
                var _rax = 342;
                var _ray = 396;
                if (_smooth == 0)
                {
                    setxy(_rax, _ray);
                }
                else
                {
                    scr_lerpvar("x", x, _rax, _smooth);
                    scr_lerpvar("y", y, _ray, _smooth);
                }
                sprite_index = spr_ralsei_walk_up;
                image_speed = 0;
                image_index = 0;
                scr_darksize();
                __found = 1;
            }
        }
    }
    if (_name == "tenna" || _name == "Tenna" || _name == "te" || _name == "t" || _name == "Te" || _name == "T" || _name == "all")
    {
        with (obj_actor_tenna)
        {
            sprite_index = spr_tenna_faceaway;
            var _tex = 484;
            if (global.flag[1022] == 1)
                _tex = 784;
            var _tey = 576;
            if (_smooth == 0)
            {
                setxy(_tex, _tey);
            }
            else
            {
                scr_lerpvar("x", x, _tex, _smooth);
                scr_lerpvar("y", y, _tey, _smooth);
            }
            __found = 1;
        }
    }
}
