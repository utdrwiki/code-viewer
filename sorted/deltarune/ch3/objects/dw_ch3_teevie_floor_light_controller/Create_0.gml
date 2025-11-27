var _floor_list = [];
for (var i = 0; i < instance_number(obj_dw_ch3_teevie_floor_light); i++)
    _floor_list[i] = instance_find(obj_dw_ch3_teevie_floor_light, i);
_floor_list_sorted = scr_array_sort(_floor_list, true);
for (var i = 0; i < array_length_1d(_floor_list_sorted); i++)
{
    var _floor_light = _floor_list_sorted[i];
    if ((i % 2) == 1)
    {
        with (_floor_light)
            alarm[0] = 1;
    }
    else
    {
        with (_floor_light)
            alarm[0] = 30;
    }
}

pause_lights = function()
{
    for (var i = 0; i < array_length_1d(_floor_list_sorted); i++)
    {
        with (_floor_list_sorted[i])
            pause_toggle();
    }
};

unpause_lights = function()
{
    for (var i = 0; i < array_length_1d(_floor_list_sorted); i++)
    {
        with (_floor_list_sorted[i])
            unpause_toggle();
    }
};
