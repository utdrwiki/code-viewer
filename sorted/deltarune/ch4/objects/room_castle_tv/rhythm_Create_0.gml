con = -1;
customcon = 0;
selected_song_id = 0;
scroller = -4;
door_list = [];
song_ids = [2, 4, 3];
song_list = [];
song_count = 5;
for (var i = 0; i < song_count; i++)
    song_list[i] = scr_rhythmgame_song_select_id(i);
var poster_readable = instance_create(920, 160, obj_readable_room1);
with (poster_readable)
{
    extflag = "poster";
    image_xscale = 4;
    image_yscale = 4;
}
var counter_marker = scr_dark_marker(1080, 200, spr_dw_ranking_counter);
with (counter_marker)
{
    image_xscale = 3;
    scr_depth();
}
var pippins_marker = scr_dark_marker(counter_marker.x + 20, counter_marker.y - 60, spr_npc_pippins_jump);
pippins_marker.depth = counter_marker.depth + 10;
pippins_marker.image_speed = 0.2;
var pippins_readable = instance_create(pippins_marker.x, pippins_marker.y + 60, obj_readable_room1);
with (pippins_readable)
{
    image_xscale = 4;
    extflag = "pippins";
}
shadow_timer = 0;
shadow_anim = 0;
shadow_npc = instance_create(counter_marker.x + 110, counter_marker.y - 80, obj_npc_room);
shadow_npc.depth = counter_marker.depth + 10;
with (shadow_npc)
{
    sprite_index = spr_shadowman_idle_a;
    scr_depth();
    extflag = "shadowguy";
    normalanim = 4;
}
var plugboy_npc = instance_create(1325, 220, obj_npc_room);
with (plugboy_npc)
{
    sprite_index = spr_npc_plugboy;
    scr_depth();
    extflag = "plugboy";
}

init_scores = function()
{
    for (var i = 0; i < song_count; i++)
    {
        highscore[i] = scr_rhythmgame_score_load(song_list[i]);
        highscore_hard[i] = scr_rhythmgame_score_load(song_list[i], true);
    }
    var _ranks = ["Z", "C", "B", "A", "S", "T"];
    for (var i = 0; i < song_count; i++)
    {
        if (highscore[i] > 0)
            highscore_rank[i] = _ranks[scr_rhythmgame_get_rank(song_list[i], highscore[i])];
        else
            highscore_rank[i] = "-";
        if (highscore_hard[i] > 0)
            highscore_rank_hard[i] = _ranks[scr_rhythmgame_get_rank(song_list[i], highscore_hard[i])];
        else
            highscore_rank_hard[i] = "-";
    }
};

create_door = function(arg0, arg1)
{
    var _door = scr_dark_marker(180 + (arg0 * 260), 130, spr_dw_ranking_doors_narrow);
    with (_door)
        scr_depth();
    var door_readable = instance_create(_door.x + 20, _door.y + 80, obj_readable_room1);
    door_readable.extflag = "song_" + string(arg1);
    with (door_readable)
        image_xscale = 5;
    var door_data = [];
    door_data[0] = _door;
    door_data[1] = arg1;
    door_list[array_length(door_list)] = door_data;
    return _door;
};

create_symbol = function(arg0, arg1, arg2)
{
    var symbol = instance_create(arg0.x + 44, arg0.y - 40, obj_dw_rhythm_symbol);
    symbol.init_symbol(arg1);
    symbol.init_ranks(arg2);
    return symbol;
};

init_doors = function()
{
    var track_names = scr_rhythmgame_songlist();
    scroller = instance_create(0, 0, obj_dw_rhythm_scroller);
    for (var i = 0; i < array_length(song_ids); i++)
    {
        scr_rhythmgame_song_select(song_ids[i]);
        var _file = local_preview;
        var _track_id = song_ids[i];
        var door = create_door(i, song_ids[i]);
        var rank_data = [highscore_rank[_track_id], highscore_rank_hard[_track_id]];
        var symbol = create_symbol(door, song_ids[i], rank_data);
        var _speakers = instance_create(0, 0, obj_dw_rhythm_speakers);
        _speakers.init(door);
        _speakers.init_song(_file);
        _speakers.init_symbol(symbol);
        _speakers.x = door.x;
        _speakers.bpm = bpm;
        _speakers.song_id = i;
        if (i == 10)
            beat_start = ((60 / bpm) * 30) / 2;
    }
};

select_door = function(arg0)
{
    var _id_raw = string_digits(arg0);
    var _id = real(_id_raw);
    selected_song_id = _id;
};

show_scroller = function()
{
    var track_names = scr_rhythmgame_songlist();
    scr_rhythmgame_song_select(selected_song_id);
    var _song_id = song_id;
    score_id = song_list[selected_song_id];
    var song_data = [];
    song_data[0] = highscore[selected_song_id];
    song_data[1] = highscore_rank[selected_song_id];
    song_data[2] = highscore_rank_hard[selected_song_id];
    song_data[3] = highscore_hard[selected_song_id];
    song_data[4] = track_names[selected_song_id];
    song_data[5] = _song_id;
    scroller.init_song(song_data);
    scroller.show_banner();
};

enter_door = function()
{
    with (obj_dw_rhythm_speakers)
        fade_out();
    snd_play(snd_locker);
    for (var i = 0; i < array_length(door_list); i++)
    {
        if (door_list[i][1] != selected_song_id)
            continue;
        door_list[i][0].image_index = 1;
        break;
    }
    alarm[1] = 30;
};

play_normal = function()
{
    con = 10;
    scr_rhythmgame_song_select(selected_song_id);
    global.band_song = song_id;
    global.band_difficulty = 0;
};

play_hard = function()
{
    con = 10;
    scr_rhythmgame_song_select(selected_song_id);
    global.band_song = song_id;
    global.band_difficulty = 1;
};

cancel = function()
{
    scroller.hide_banner();
};

clean_up = function()
{
    with (obj_dw_rhythm_speakers)
        clean_up();
};

init_scores();
init_doors();
