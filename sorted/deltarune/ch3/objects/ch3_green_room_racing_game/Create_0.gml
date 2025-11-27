timer = 150;
game_won = false;
game_lost = false;
player_moved = false;
var _debug_visible = false;
var y_pos = cameray() + (view_hport[0] / 2) + 20;
race_car = instance_create((camerax() + (view_wport[0] / 2)) - 60, y_pos + 60, obj_ch3_green_room_racing_car);
with (race_car)
{
    debug_visible = _debug_visible;
    image_xscale = 2;
    image_yscale = 2;
}
race_goal = instance_create(0, 0, obj_ch3_green_room_racing_goal);
with (race_goal)
    visible = _debug_visible;
var solid_middle = instance_create((camerax() + (view_wport[0] / 2)) - 60, cameray() + 160, obj_ch3_green_room_racing_solid);
with (solid_middle)
{
    visible = _debug_visible;
    image_xscale = 4;
    image_yscale = 4;
}
var solid_top = instance_create(camerax(), cameray(), obj_ch3_green_room_racing_solid);
with (solid_top)
{
    visible = _debug_visible;
    image_xscale = 16;
    image_yscale = 2;
}
var solid_bottom = instance_create(camerax(), solid_middle.y + 240, obj_ch3_green_room_racing_solid);
with (solid_bottom)
{
    visible = _debug_visible;
    image_xscale = 16;
    image_yscale = 2;
}
var solid_left = instance_create(camerax(), cameray() + 80, obj_ch3_green_room_racing_solid);
with (solid_left)
{
    visible = _debug_visible;
    image_xscale = 4;
    image_yscale = 8;
}
var solid_right = instance_create(camerax() + 520, cameray() + 80, obj_ch3_green_room_racing_solid);
with (solid_right)
{
    visible = _debug_visible;
    image_xscale = 4;
    image_yscale = 8;
}
var solid_divider = instance_create(camerax() + 320, cameray() + 320, obj_ch3_green_room_racing_solid);
with (solid_divider)
{
    visible = _debug_visible;
    image_yscale = 2;
}

start_game = function()
{
    global.interact = 1;
    alarm[0] = 1;
    var _controller = id;
    with (race_car)
    {
        init_car(_controller);
        start_car();
    }
};

player_moved = function()
{
    return race_car.player_moved;
};

stop_game = function()
{
    with (race_car)
        stop_car();
};

win_game = function()
{
    stop_game();
    game_won = true;
};

time_up = function()
{
    stop_game();
    game_lost = true;
    snd_play(snd_error);
};

clean_up = function()
{
    with (obj_ch3_green_room_racing_solid)
        instance_destroy();
    with (race_car)
        instance_destroy();
    with (race_goal)
        instance_destroy();
    instance_destroy();
};
