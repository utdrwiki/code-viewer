target_characters = [];
var _char = [];
var _y_offsets = [];
_char[0] = 1185;
_y_offsets[0] = 0;
for (var i = 0; i < instance_number(obj_caterpillarchara); i++)
{
    _char[i + 1] = instance_find(obj_caterpillarchara, i);
    if (_char[i + 1].name == "susie")
        _y_offsets[i + 1] = 10;
    else if (_char[i + 1].name == "ralsei")
        _y_offsets[i + 1] = 12;
}
for (var i = 0; i < array_length(_char); i++)
{
    target_characters[i] = instance_create(0, 0, obj_dw_ranking_t_shadow_char);
    with (target_characters[i])
        init(_char[i], _y_offsets[i]);
}
