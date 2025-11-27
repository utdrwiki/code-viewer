for (i = 0; i < 5; i++)
    remtrackpos[i] = 0;
global.interact = 1;
song_initialized = 0;
loadsong = 1;
image_speed = 0;
missnotetimer = 0;
missnotecon = 0;
minnote = 0;
trackpos = 0;
scenecon = 0;
maxnote = 0;
buffer[0] = 0;
buffer[1] = 0;
buffer[2] = 0;
pressedtimer[0] = 10;
pressedtimer[1] = 10;
pressedtimer[2] = 10;
bpm = 230;
notespacing = 60 / bpm;
meter = notespacing * 4;
startoffset = 0;
oneAtATime = true;
hold_start[0] = 0;
hold_end[0] = 0;
hold_start[1] = 0;
hold_end[1] = 0;
hold_start[2] = 0;
hold_end[2] = 0;
heldnote[0] = 0;
heldnote[1] = 0;
heldnote[2] = 0;
hold_score = 0;
total_score = 0;
score_scale = 2;
combo = 5000;
max_score = 25000;
auto_play = true;
invc = 0;
hurt_flash = 0;
goodScore = 0;
maxScore = 0;
track1 = -1;
track2 = -1;
track1_instance = -1;
track2_instance = -1;
instrument = 0;
note_color[0] = c_teal;
note_color[1] = #00A2E8;
note_color[2] = c_orange;
note_hit_timer[0] = 0;
note_hit_timer[1] = 0;
note_hit_timer[2] = 0;
note_hit_score[0] = 40;
note_hit_score[1] = 40;
song_loaded = false;
song_id = 0;
savestring = "music_timing";
brightness = 1;
trackstart = 0;
chart_end = 0;
camx = camerax();
camy = cameray();
song_menu = true;
start_buffer = true;
selection = 0;
tracklist = scr_rhythmgame_songlist();
for (var _i = 0; _i < array_length(tracklist); _i++)
    tracklist[_i] = string_format_zero(_i, 2, 0) + " - " + tracklist[_i];
savecon = 0;
track_length = 135.652;
notespeed = 150;
has_file = false;
load_source = 0;
rec_time[0] = 0;
rec_endtime[0] = 0;
rec_type[0] = 0;
rec_hold = 0;
rec_count = 0;
rec_max = 25;
recording_mode = false;
paused = false;
mousecon = 0;
loop = false;
tooltips = true;
changesmade = false;
erase_min = 0;
erase_max = 1;
do_refresh = false;
undo_action[0] = 0;
undo_index[0] = -1;
undo_time[0] = -1;
undo_type[0] = -1;
undo_end[0] = -1;
undo_anim[0] = -1;
undo_queue = 0;
undo_cap = 0;
clip_size = 0;
clip_time[0] = 0;
clip_type[0] = 0;
clip_end[0] = 0;
clip_anim[0] = 0;
notemod_index = -1;
scrollcon = 0;
rem_mode = false;
rem_pos = 0;
scroll_init = 0;
noteeditmode = 0;
quickscroll_timer = 0;
arrow_scroll = 0;
ralsei = instance_create(420, 300, obj_rhythmgame_performer);
ralsei.sprite_index = spr_ralsei_sing_clap;
ralsei.image_xscale = 2;
ralsei.image_yscale = 2;
ralsei.image_speed = 0;
ralsei.depth = depth - 10;
ralsei.loop = true;
ralsei.animspeed = 0.5;
ralsei.rhythmer = id;
susie = instance_create(120, 300, obj_rhythmgame_performer);
susie.sprite_index = spr_susie_drum_play;
susie.image_xscale = 2;
susie.image_yscale = 2;
susie.image_speed = 0.16666666666666666;
susie.depth = depth - 10;
susie.loop = true;
susie.animspeed = 3;
susie.rhythmer = id;
kris = instance_create(220, 300, obj_rhythmgame_performer);
kris.sprite_index = spr_kris_rock_1;
kris.image_xscale = 2;
kris.image_yscale = 2;
kris.image_speed = 0.16666666666666666;
kris.depth = depth - 10;
kris.loop = false;
kris.rhythmer = id;
last_note = 0;
current_note = 1;
cooldown = 0;
note_streak = 0;
original_notespeed = notespeed;

function load_chart()
{
    debug_print("track loading...");
    savestring = "music_timing";
    if (song_id == 1)
    {
        scr_debug_print("loading practice song");
        savestring += "_practice";
    }
    else if (song_id == 2)
    {
        song_id = 2;
        savestring += "_tenna";
        scr_debug_print("loading tenna_battle");
        bpm = 148;
    }
    else if (song_id == 3)
    {
        song_id = 3;
        savestring += "_tutorial";
        scr_debug_print("loading tutorial song");
        bpm = 190;
    }
    else if (song_id == 4)
    {
        song_id = 4;
        savestring += "_board4";
        scr_debug_print("loading board4_rhythm");
        bpm = 120;
    }
    else if (song_id == 5)
    {
        song_id = 5;
        savestring += "_rudebuster_boss";
        scr_debug_print("loading rudebuster_boss");
        bpm = 140;
    }
    else if (song_id == 6)
    {
        song_id = 6;
        savestring += "_vapor";
        scr_debug_print("loading battle_vapor");
        bpm = 200;
    }
    else if (song_id == 8)
    {
        savestring += "_rudebuster";
        scr_debug_print("loading rudebuster");
    }
    else if (song_id == 9)
    {
        savestring += "_fieldofhopes";
        scr_debug_print("loading field of hopes and dreams");
    }
    else if (song_id == 10)
    {
        savestring += "_knockyoudown";
        scr_debug_print("loading Knock You Down!!");
    }
    else
    {
        scr_debug_print("loading rock video");
    }
    if (instrument == 1)
    {
        scr_debug_print("loaded drums");
        note_color[0] = #D1176A;
        note_color[1] = #EA79C8;
        savestring += "_drums";
    }
    else if (instrument == 2)
    {
        scr_debug_print("loaded vocals");
        note_color[0] = c_green;
        note_color[1] = #B5E61D;
        note_color[2] = c_lime;
        savestring += "_vocals";
    }
    else
    {
        scr_debug_print("loaded lead");
    }
    scr_rhythmgame_load_song(song_id, false, false, true);
    if (file_exists(savestring + ".txt"))
    {
        scr_rhythmgame_editor_load(savestring + ".txt");
        has_file = true;
        load_source = 1;
    }
    else
    {
        if (instrument == 0)
        {
            scr_rhythmgame_notechart_lead(song_id);
            if (song_id == 0)
            {
                scr_rhythmgame_notechart_lead_solo(0);
                scr_rhythmgame_notechart_lead_solo(1);
                scr_rhythmgame_notechart_lead_solo(2);
                scr_rhythmgame_notechart_lead_finale();
            }
        }
        else if (instrument == 1)
        {
            scr_rhythmgame_notechart_drums(song_id);
        }
        else if (instrument == 2)
        {
            scr_rhythmgame_notechart_vocals(song_id);
        }
        load_source = 2;
    }
}
