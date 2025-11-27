points = 1;
flag = -1;
is_collected = false;
image_xscale = 2;
image_yscale = 2;

init = function(arg0, arg1)
{
    points = arg0;
    flag = arg1;
    is_collected = scr_flag_get(flag) > 0;
    scr_depth();
    if (is_collected)
        instance_destroy();
};

collect_points = function()
{
    scr_flag_set(flag, 1);
    global.flag[1044] += points;
    global.flag[1117] += points;
    snd_stop(snd_item);
    snd_play_pitch(snd_item, 1.2);
    var _display = instance_create(centerx(), centery(), obj_dw_points_get_display);
    _display.init(points);
    instance_destroy();
};
