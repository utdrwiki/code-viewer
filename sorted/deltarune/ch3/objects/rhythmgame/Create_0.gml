y = 960;
depth = 110000;
tenna_boss = global.chapter == 3 && i_ex(obj_tenna_enemy);
if (tenna_boss)
    depth = 1000;
for (i = 0; i < 5; i++)
    remtrackpos[i] = 0;
song_initialized = 0;
loadsong = 0;
missnotetimer = 0;
missnotecon = 0;
minnote = 0;
trackpos = 0;
notespeed = 150;
speed_modifier = 1;
maxnote = 0;
buffer[0] = 0;
buffer[1] = 0;
pressedtimer[0] = 10;
pressedtimer[1] = 10;
bpm = 230;
notespacing = 60 / bpm;
meter = notespacing * 4;
startoffset = 0;
lineA = 0;
lineB = 0;
oneAtATime = true;
hold_start[0] = 0;
hold_end[0] = 0;
hold_start[1] = 0;
hold_end[1] = 0;
hold_score = 0;
heldnote[0] = 0;
heldnote[1] = 0;
heldnote[2] = 0;
points = 0;
total_score = 0;
score_scale = 2;
great = 0;
good = 0;
okay = 0;
miss = 0;
hurt_counter = 0;
safety_timer = 0;
safety_mode = false;
muted = false;
muted_time = 0;
averagetimeunit = 0;
safety_pos = 0;
smooth_timer = 0;
deltapos = 0;
score_var = 0;
fame_mul = 1;
fame = 6000;
total_fame = 6000;
max_fame = 12000;
max_score = 25000;
auto_play = false;
combo = 0;
max_combo = 0;
bg_timer = 0;
trackstart = 0;
goodScore = 0;
maxScore = 0;
track1 = -1;
track2 = -1;
track1_instance = -1;
track2_instance = -1;
note_hit_timer[0] = 0;
note_hit_timer[1] = 0;
note_hit_timer[2] = 0;
note_hit_score[0] = 0;
note_hit_score[1] = 0;
intro_con = -1;
camera_lerp = 0;
fame_tier = 0;
fixed_penalty = 0;
hardmode = 0;
leniency = 1.6;
bonus = 0;
song_id = -1;
track_length = 0;
scr_rhythmgame_init(0, song_id, true);
drums = instance_create(170, y, obj_rhythmgame_chart);
with (drums)
{
    depth = other.depth - 10;
    scr_rhythmgame_init(1, other.song_id, true);
    mashcon = 1;
    rhythmgame = other.id;
}
vocals = instance_create(470, y, obj_rhythmgame_chart);
with (vocals)
{
    depth = other.depth - 10;
    scr_rhythmgame_init(2, other.song_id, true);
    auto_play = true;
    rhythmgame = other.id;
}
spooked = false;
paused = false;
note_streak = 0;
score_x = 550;
solo_difficulty = -1;
solo_con = 0;
timestamp[0] = scr_round_to_beat(37.56, bpm, 1) - notespacing;
timestamp[1] = scr_round_to_beat(58.43, bpm, 1) - notespacing;
timestamp[2] = scr_round_to_beat(79.3, bpm, 1) - notespacing;
timestamp[3] = scr_round_to_beat(100.17, bpm, 1) - notespacing;
track1_id = "ch3_karaoke_no_guitar.ogg";
track2_id = "ch3_karaoke_full.ogg";
dynamic_solo = false;
skip_invuln = false;
songset = false;
if (!i_ex(obj_music_event_manager))
    musicm = instance_create(x, y, obj_music_event_manager);
else
    musicm = obj_music_event_manager;
musicm.bpm = bpm;
musicm.loop = false;
musicm.beat_offset += bpm / 2;
show_debug = false;
button_swap = scr_buttons_swapped();
effects = instance_create(x, y, obj_rhythmgame_effects);
effects.depth = depth - 40;
image_speed = 0;
fade = 1;
timer = 0;
debugsong = false;
replayquit = false;
text_timer = -1;
last_note_score = 0;
note_text = "GREAT";
score_color = c_yellow;
camy = cameray();
camx = camerax();
if (scr_debug())
{
    if (keyboard_check(ord("1")))
    {
        song_id = 1;
        scr_debug_print("song set to practice song");
        debugsong = true;
    }
    else if (keyboard_check(ord("2")))
    {
        song_id = 2;
        scr_debug_print("song set to tenna_battle");
        debugsong = true;
    }
    else if (keyboard_check(ord("3")))
    {
        song_id = 3;
        scr_debug_print("song set to tutorial song");
        debugsong = true;
    }
    else if (keyboard_check(ord("4")))
    {
        song_id = 4;
        scr_debug_print("song set to brand new board 4 track");
        debugsong = true;
    }
    else if (keyboard_check(ord("5")))
    {
        song_id = 5;
        scr_debug_print("song set to rudebuster_boss");
        debugsong = true;
    }
    else if (keyboard_check(ord("6")))
    {
        song_id = 6;
        scr_debug_print("song set to battle_vapor");
        debugsong = true;
    }
    else
    {
        song_id = 0;
        scr_debug_print("song set to default, song,");
        if (keyboard_check(ord("0")))
        {
            scr_debug_print("(but also skipping its intro)");
            debugsong = true;
        }
    }
}
song_loaded = false;
lyric_time[0] = 0;
lyric_count = 0;
lyrics[0] = "";
censored_lyrics[0] = "";
lyrics_index = 0;
word_index = 0;
lyric_start_index = 0;
lyric_start[0] = 0;
lyric_end[0] = 0;
line_switch = -1;
current_lyric = "";
censored_lyric = "";
update_lyrics = false;
bg_con = 0;
floor_color = #274573;
special_song = 0;
chart_start = 0;
chart_end = 0;
main_vol = 1;
tracklist = scr_rhythmgame_songlist();
buttonswap = false;
if (tenna_boss)
{
    debug_print("loadin' tenna boss logic");
    song_id = 2;
    speed_modifier = 2;
    if (obj_tenna_enemy.completedrhythmwithouttakingdamage == 1)
        speed_modifier = 2.5;
    if (obj_tenna_enemy.completedrhythmwithouttakingdamage2 == 1)
        speed_modifier = 3;
}
init = 0;
song_done = false;
game_won = false;
lose_con = 0;
loop = false;
loop_start = 0;
last_score[0] = 0;
last_score[1] = 0;
last_score[2] = 0;
last_score[3] = 0;
last_score[4] = 0;
maxpos = 0;
fastforward = false;
bg_brightness = 1;
stage_tint = 0;
show_chart = 0;
focus = 0;
chart_lerp = 0;
chart_ease = 0;
kchart_lerp = 0;
kchart_ease = 0;
siner = 0;
miss_timer = 0;
tutorial = 0;
timer = 0;
freeplay = 0;
spotlight_color[0] = #2D2D2D;
spotlight_color[1] = #BD0F17;
spotlight_color[2] = #4A7CE8;
spotlight_color[3] = #79D7FF;
red_glow = 0;
hue = 0;
rainbow_con = 0;
smooth = 0;
stage_con = 0;
beat = false;
boss_delay = 45;
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    boss_delay = 17;
turn_length = 270;
invc = 0;
hurt_flash = 0;
difficulty = 5;
silhouette_surf = -4;
combo_surf = -4;
palette_active = true;
palette_pos = 1;
button_alpha = 0;
tutorial_ready = true;
brightness = 1;
target_brightness = 1;
replayversion = false;
if (global.plot >= 150 && room != room_dw_rhythm_empty && !tenna_boss)
    replayversion = true;
if (replayversion && freeplay == 0)
    freeplay = 1;
savemiss = 0;
savegreat = 0;
saveokay = 0;
savegood = 0;
pitch = 1;
reloading = false;
backup_trackpos = 0;
looptimer = 0;
lyric_surface = -4;
lyric_sprite[0] = -4;
lyric_sprite[1] = -4;
failsafe = 0;
guitar_sound[0] = snd_guitarpickup3;
guitar_sound[1] = snd_guitarpickup4;
guitar_sound[2] = snd_guitarpickup1;
guitar_sound[3] = snd_guitarpickup2;
miss_sound[0] = snd_guitarerror;
miss_sound[1] = snd_guitarerror2;

emergency_reload = function()
{
    if (!i_ex(track1))
    {
        if (trackpos <= 0)
            trackpos = 0.1;
        debug_print("Emergency reload called. Resuming from " + string(trackpos));
        remtrackpos[0] = trackpos;
        track1 = snd_init(track1_id);
        track2 = snd_init(track2_id);
        if (loop)
        {
            track1_instance = mus_loop(track1);
            track2_instance = mus_loop(track2);
        }
        else
        {
            track1_instance = mus_play(track1);
            track2_instance = mus_play(track2);
        }
        if (solo_con == 2)
        {
            track1_main = track1_solo_instance;
            track2_main = track2_solo_instance;
        }
        else
        {
            track1_main = track1_instance;
            track2_main = track2_instance;
        }
        snd_pitch(track1_instance, 0);
        snd_pitch(track2_instance, 0);
        if (song_id == 0)
        {
            track1_solo = snd_init(track1_id);
            track2_solo = snd_init(track2_id);
            track1_solo_instance = mus_play(track1_solo);
            track2_solo_instance = mus_play(track2_solo);
            snd_pitch(track1_solo_instance, 0);
            snd_pitch(track2_solo_instance, 0);
        }
        pitch = 0;
        reloading = true;
        if (solo_con == 2)
        {
            mus_volume(track1_instance, 0, 0);
            mus_volume(track2_instance, 0, 0);
            mus_volume(track1_solo_instance, 0, 0);
            mus_volume(track2_solo_instance, 1, 0);
        }
        else
        {
            if (oneAtATime)
                mus_volume(track1_instance, 0, 0);
            else
                mus_volume(track1_instance, 1, 0);
            mus_volume(track2_instance, 1, 0);
            if (song_id == 0)
            {
                mus_volume(track1_solo_instance, 0, 0);
                mus_volume(track2_solo_instance, 0, 0);
            }
        }
        if (tenna_boss)
        {
            global.batmusic[0] = track1;
            global.batmusic[1] = track1_instance;
            global.batmusic[2] = track2;
            global.batmusic[3] = track2_instance;
        }
    }
};

spotlight_col = function(arg0)
{
    var _combreq = tenna_boss ? min(15, maxnote) : 15;
    if (fame >= 12000 && combo >= _combreq)
    {
        if (stage_con == 0)
        {
            stage_con = 2;
            snd_play_volume(snd_crowd_cheer_single, 0.7);
        }
        if (smooth)
        {
            if (arg0 == 0)
                hue = (hue + 4) % 255;
        }
        else if (beat)
        {
            hue += 106.25;
            hue %= 255;
            beat = false;
        }
        var _rainbow = (hue + (arg0 * 85)) % 255;
        return make_color_hsv(_rainbow, 43, 223);
    }
    if (stage_con >= 1)
        stage_con = 0;
    var _score = fame + hold_score;
    var _col = merge_color(spotlight_color[1], spotlight_color[2], clamp01(inverselerp(3000, 4000, fame)));
    var _sscore = (_score - 4000) + (arg0 * 2000);
    if ((fame + hold_score) < 6000)
        _col = merge_color(spotlight_color[0], _col, clamp01(inverselerp(0, 2000, _sscore)));
    else
        _col = merge_color(_col, spotlight_color[3], clamp01(inverselerp(6000, 8000, _sscore)));
    return _col;
};

buttonb_p = function()
{
    if (button_swap)
        return button2_p();
    else
        return button1_p();
};

buttonb_h = function()
{
    if (button_swap)
        return button2_h();
    else
        return button1_h();
};

buttonr_p = function()
{
    if (button_swap)
        return button1_p();
    else
        return button2_p();
};

buttonr_h = function()
{
    if (button_swap)
        return button1_h();
    else
        return button2_h();
};

draw_rhythm_buttons = function(arg0, arg1, arg2)
{
    var _played = 0;
    var _swap = button_swap;
    var _ll = _swap ? 5 : 4;
    var _rr = _swap ? 4 : 5;
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        _played = note_hit_timer[0] > 0;
        draw_sprite_ext(scr_getbuttonsprite(global.input_g[_ll], false), 0, (arg0 - 104) + (chart_ease * 34), (bottomy - 8) + (_played * 2), 2, 2, 0, arg1, arg2);
        _played = note_hit_timer[1] > 0;
        draw_sprite_ext(scr_getbuttonsprite(global.input_g[_rr], false), 0, (arg0 + 81) - (chart_ease * 34), (bottomy - 8) + (_played * 2), 2, 2, 0, arg1, arg2);
    }
    else
    {
        draw_set_alpha(arg2);
        var _input_name = scr_get_input_name(_ll);
        _played = note_hit_timer[0] > 0;
        var _buttonx = (arg0 - 80) + (chart_ease * 34);
        var _buttony = (bottomy - 16) + (_played * 2);
        var _scale = 2;
        draw_set_colour(_played ? c_yellow : c_white);
        draw_set_halign(fa_right);
        draw_text_transformed_outline(_buttonx, _buttony, _input_name, _scale, _scale, 0);
        _played = note_hit_timer[1] > 0;
        _input_name = string(scr_get_input_name(_rr));
        _buttonx = (arg0 + 82) - (chart_ease * 34);
        _buttony = (bottomy - 16) + (_played * 2);
        draw_set_halign(fa_left);
        draw_set_colour(_played ? c_yellow : c_white);
        draw_text_transformed_outline(_buttonx, _buttony, _input_name, _scale, _scale, 0);
        draw_set_valign(fa_top);
        draw_set_alpha(1);
    }
};

track_jump = function(arg0)
{
    smooth_timer = 6;
    safety_mode = true;
    safety_pos = trackpos;
    remtrackpos[4] += arg0;
    remtrackpos[3] += arg0;
    remtrackpos[2] += arg0;
    remtrackpos[1] += arg0;
    remtrackpos[0] += arg0;
};
