game_type = "";
game_room = -4;
con = -1;
difficulty = -1;
locked_sprite = -4;
poster_readable = -4;

init = function(arg0 = "susiezilla")
{
    game_type = arg0;
    var _is_unlocked = false;
    var coming_soon_text = stringsetloc("COMING SOON......", "obj_dw_ranking_minigame_door_slash_Create_0_gml_15_0");
    var game_name = "";
    if (game_type == "chef")
    {
        _is_unlocked = true;
        game_name = stringsetloc("COOKING SHOW", "obj_dw_ranking_minigame_door_slash_Create_0_gml_21_0");
        game_room = 169;
    }
    else if (game_type == "band")
    {
        _is_unlocked = global.plot >= 150;
        game_name = stringsetloc("ROCK VIDEO", "obj_dw_ranking_minigame_door_slash_Create_0_gml_27_0");
        game_room = 241;
    }
    else
    {
        game_name = stringsetloc("MONSTER MOVIE", "obj_dw_ranking_minigame_door_slash_Create_0_gml_32_0");
        _is_unlocked = scr_flag_get(1189) > 0;
        game_room = 166;
    }
    if (!_is_unlocked && game_type != "susiezilla")
    {
        locked_sprite = scr_dark_marker(x, y, spr_dw_ranking_doors_locked);
        with (locked_sprite)
            scr_depth();
    }
    var marquee = instance_create(x, y - 30, obj_dw_ch3_teevie_marquee);
    var marquee_text = _is_unlocked ? stringsetsubloc("NOW PLAYING......~1", game_name, "obj_dw_ranking_minigame_door_slash_Create_0_gml_45_0") : coming_soon_text;
    if (arg0 == "susiezilla")
        marquee_text = (scr_flag_get(1219) > 0) ? stringsetsubloc("NOW PLAYING......~1", game_name, "obj_dw_ranking_minigame_door_slash_Create_0_gml_49_0") : coming_soon_text;
    with (marquee)
    {
        mystring = marquee_text;
        width = 270;
    }
    door_marker = scr_dark_marker(x, y, spr_dw_ranking_doors);
    with (door_marker)
    {
        image_speed = 0;
        scr_depth();
    }
    var door_readable = instance_create(door_marker.x, door_marker.y + 50, obj_readable_room1);
    with (door_readable)
    {
        extflag = _is_unlocked ? ("door_" + arg0) : "door_locked";
        if (arg0 == "susiezilla")
        {
            if (_is_unlocked)
                extflag = "door_susiezilla";
            else
                instance_destroy();
        }
        image_xscale = 8;
        image_yscale = 2;
    }
    var poster_sprite = 3431;
    if (_is_unlocked)
    {
        if (arg0 == "chef")
        {
            poster_sprite = 1011;
        }
        else if (arg0 == "band")
        {
            poster_sprite = 1825;
        }
        else if (arg0 == "susiezilla")
        {
            if (scr_flag_get(1219) > 0)
                poster_sprite = 2531;
        }
    }
    poster_marker = scr_dark_marker(door_marker.x + 190, door_marker.y - 10, poster_sprite);
    with (poster_marker)
        scr_depth();
    poster_readable = instance_create(poster_marker.x, poster_marker.y + 80, obj_readable_room1);
    with (poster_readable)
    {
        extflag = _is_unlocked ? ("poster_" + arg0) : "poster_coming_soon";
        if (arg0 == "susiezilla")
        {
            if (scr_flag_get(1189) == 0)
                extflag = "poster_coming_soon";
            else if (scr_flag_get(1219) == 0)
                extflag = "poster_coming_soon_susiezilla";
            else
                extflag = "poster_" + arg0;
        }
        image_xscale = 4;
        image_yscale = 2;
    }
};

start_game = function(arg0 = -1)
{
    if (game_type == "chef")
    {
        con = 10;
    }
    else if (game_type == "band")
    {
        if (arg0 >= 0)
        {
            difficulty = arg0;
            con = 10;
        }
        else
        {
            con = 30;
        }
    }
    else
    {
        con = 10;
    }
};

open_door = function()
{
    snd_free_all();
    snd_play(snd_locker);
    door_marker.image_index = 1;
};

unlock_door = function()
{
    con = 50;
};

regain_control = function()
{
    global.interact = 0;
    global.facing = 0;
};
