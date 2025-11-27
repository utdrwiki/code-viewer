image_xscale = 2;
image_yscale = 2;
_assigned_song = -4;
_symbol_sprite = -4;
_symbol_anim = 0;
_symbol_anim_speed = 0;
_symbol_x_offset = 0;
_symbol_y_offset = 0;
_symbol_x_scale = 2;
_symbol_y_scale = 2;
_symbol_angle = 0;
_in_range = false;
_anim_timer = 0;
_highscore_rank = "";
_highscore_rank_hard = "";

init_symbol = function(arg0)
{
    _assigned_song = arg0;
    switch (arg0)
    {
        case UnknownEnum.Value_2:
            _symbol_sprite = spr_dw_castle_tv_sign_queen;
            break;
        case UnknownEnum.Value_4:
            _symbol_sprite = spr_dw_castle_tv_sign_hand;
            _symbol_x_offset = 12;
            _symbol_y_offset = 26;
            break;
        case UnknownEnum.Value_3:
            _symbol_sprite = spr_dw_castle_tv_sign_guitar;
            _symbol_x_offset = 20;
            _symbol_y_offset = 12;
            break;
    }
};

init_ranks = function(arg0)
{
    _highscore_rank = arg0[0];
    _highscore_rank_hard = arg0[1];
};

enter_range = function()
{
    _in_range = true;
    _anim_timer = 0;
    switch (_assigned_song)
    {
        case UnknownEnum.Value_2:
            _symbol_sprite = spr_dw_castle_tv_sign_queen_laugh;
            _symbol_anim_speed = 0.2;
            break;
        case UnknownEnum.Value_4:
            _symbol_sprite = spr_dw_castle_tv_sign_hand;
            break;
        case UnknownEnum.Value_3:
            _symbol_sprite = spr_dw_castle_tv_sign_guitar;
            break;
    }
};

exit_range = function()
{
    _in_range = false;
    switch (_assigned_song)
    {
        case UnknownEnum.Value_2:
            _symbol_sprite = spr_dw_castle_tv_sign_queen;
            _symbol_anim_speed = 0;
            break;
        case UnknownEnum.Value_4:
            scr_lerpvar_instance(id, "_symbol_angle", _symbol_angle, 0, 12, 2, "out");
            break;
        case UnknownEnum.Value_3:
            scr_lerpvar_instance(id, "_symbol_y_scale", _symbol_y_scale, 2, 12, 2, "out");
            break;
    }
};

in_range = function()
{
    return _in_range;
};

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_4
}
