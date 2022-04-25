scr_feetx = function(argument0, argument1) //gml_Script_scr_feetx
{
    _feetx = 0
    if (i_ex(argument0) && i_ex(argument1))
    {
        _obj1middlex = (argument0.x + (argument0.sprite_width / 2))
        return (_obj1middlex - (argument1.sprite_width / 2));
    }
    return;
}

