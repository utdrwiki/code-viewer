con = 0;
quiz_id = "A";
quiz_start = false;
quiz_ready = false;
quiz_display = false;
quiz_complete = false;
quiz_finish = false;
quiz_bullets = false;
quiz_bullets_con = 0;
quiz_static_show = false;
quiz_static_hide = false;
correct_answer = false;
wrong_answer = false;
show_spikes = false;
hide_spikes = false;
spikes = [];
show_buttons = false;
hide_buttons = false;
button_tiles = [];
button_tiles_player = [];
regain_control = false;
press_wait = false;
move_back_start = false;
move_back_stop = false;
base_x_pos = x;
base_y_pos = y;
quiz_flag = -1;

init_quiz = function(arg0 = "A", arg1 = 440, arg2 = 440, arg3)
{
    quiz_id = arg0;
    quiz_flag = arg3;
    var _quiz_active = scr_flag_get(quiz_flag) == 0;
    con = _quiz_active ? 0 : -1;
    base_x_pos = arg1;
    base_y_pos = arg2;
    var screen_depth = depth - 20;
    quiz_screen = instance_create(0, 0, obj_dw_ch3_teevie_quiz_screen);
    with (quiz_screen)
    {
        x = arg1;
        y = arg2;
        width = 6;
        height = 3;
        depth = screen_depth;
        tvbasesprite = spr_dw_teevie_tv_base;
    }
    for (var i = 0; i < 2; i++)
    {
        var _spike = instance_create(arg1 + 120 + (i * 200), arg2 + 240, obj_dw_ch3_teevie_spikes);
        with (_spike)
            init_tiles(3);
        _spike.depth = depth - 5;
        spikes[i] = _spike;
        if (!_quiz_active)
        {
            with (_spike)
                hide_tiles();
        }
    }
};

show_button_tiles = function()
{
    snd_play(snd_wing);
    var _char_pos_list = [new Vector2(su_actor.x + 4, base_y_pos + 280), new Vector2(kr_actor.x, base_y_pos + 280), new Vector2(ra_actor.x, base_y_pos + 280)];
    for (var i = 0; i < array_length_1d(_char_pos_list); i++)
    {
        for (var j = 0; j < 2; j++)
        {
            var _button = instance_create((_char_pos_list[i].x - 60) + (j * 120), cameray() - 60, obj_dw_ch3_teevie_keyboard_tile);
            var _char = (j == 0) ? "A" : "B";
            with (_button)
            {
                init_button(_char);
                scr_lerpvar("y", ystart, _char_pos_list[i].y, 5 + (i * 5), 4, "out");
                scr_depth();
            }
            button_tiles[i][j] = _button;
            if (i == 1)
                button_tiles_player[array_length_1d(button_tiles_player)] = _button;
        }
    }
};

hide_button_tiles = function()
{
    snd_play(snd_wing);
    for (var i = 0; i < array_length_1d(button_tiles); i++)
    {
        for (var j = 0; j < 2; j++)
        {
            var _button = button_tiles[i][j];
            with (_button)
            {
                scr_lerpvar("y", y, ystart, 5 + (i * 5), 16, "out");
                scr_doom(id, 20);
            }
        }
    }
};

reset_button_tiles = function()
{
    for (var i = 0; i < array_length_1d(button_tiles); i++)
    {
        for (var j = 0; j < 2; j++)
            button_tiles[i][j].reset_button();
    }
};

hide_kris_actor = function()
{
    global.facing = 0;
    global.interact = 0;
    var kris_x_pos = 0;
    var kris_y_pos = 0;
    with (obj_actor)
    {
        if (name == "kris")
        {
            kris_x_pos = x;
            kris_y_pos = y;
        }
    }
    obj_mainchara.x = kris_x_pos;
    obj_mainchara.y = kris_y_pos;
    obj_mainchara.sprite_index = spr_krisd_dark;
    with (obj_actor)
    {
        if (name == "kris")
            visible = false;
    }
    obj_mainchara.visible = true;
};

show_kris_actor = function()
{
    global.interact = 1;
    with (obj_actor)
    {
        if (name == "kris")
        {
            x = obj_mainchara.x;
            y = obj_mainchara.y;
            sprite_index = spr_krisu_dark;
            image_index = 0;
        }
    }
    with (obj_actor)
    {
        if (name == "kris")
            visible = true;
    }
    obj_mainchara.visible = false;
};

caterpillar_press_button = function(arg0, arg1, arg2)
{
    var _actor_index = (arg0.name == "susie") ? 0 : 2;
    var _button_index = (arg1 == "A") ? 0 : 1;
    var _button_tile = button_tiles[_actor_index][_button_index];
    var _target_x_pos = _button_tile.x;
    var _facing = (_button_index == 0) ? "left" : "right";
    var _walk_time = 6;
    with (arg0)
    {
        var _facing_sprite = (_facing == "left") ? lsprite : rsprite;
        scr_delay_var("sprite_index", _facing_sprite, arg2);
        scr_delay_var("image_speed", 0.2, arg2);
        scr_script_delayed(scr_lerpvar, arg2, "x", x, _target_x_pos, _walk_time);
        scr_delay_var("image_speed", 0, arg2 + _walk_time + 1);
        scr_delay_var("image_index", 0, arg2 + _walk_time + 1);
        scr_delay_var("sprite_index", usprite, arg2 + _walk_time + 1);
    }
    with (_button_tile)
        alarm[0] = arg2 + _walk_time;
};
