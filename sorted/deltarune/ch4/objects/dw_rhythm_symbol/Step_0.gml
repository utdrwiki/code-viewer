if (_in_range)
{
    _anim_timer++;
    if (_assigned_song == UnknownEnum.Value_3)
    {
        if (_anim_timer >= 1 && _anim_timer < 2)
        {
            scr_lerpvar_instance(id, "_symbol_x_scale", 3, 2, 12, 2, "out");
            scr_lerpvar_instance(id, "_symbol_y_scale", 3, 2, 12, 2, "out");
        }
        if (_anim_timer >= 15.652173913043478)
            _anim_timer -= 15.652173913043478;
    }
    if (_assigned_song == UnknownEnum.Value_4)
        _symbol_angle += (sin(_anim_timer / 3.870648215994895) * 8);
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4
}
