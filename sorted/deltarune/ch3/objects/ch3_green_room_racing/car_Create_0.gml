debug_visible = false;
wspeed = 12;
px = 0;
py = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
press_1 = 0;
press_2 = 0;
can_control = false;
player_moved = false;
sfx_buffer = 5;
sfx_buffer_timer = 0;
sfx_honk_buffer = 90;
sfx_honk_buffer_timer = 0;
controller = -4;

init_car = function(arg0)
{
    visible = debug_visible;
    controller = arg0;
};

start_car = function()
{
    can_control = true;
};

stop_car = function()
{
    can_control = false;
};

bump_car = function()
{
    snd_play(snd_bump);
    sfx_buffer_timer = sfx_buffer;
};

win = function()
{
    with (controller)
        win_game();
    player_moved = false;
    stop_car();
    snd_play(snd_crowd_cheer_single);
    snd_play(snd_won);
};
