if (replayversion)
{
    savemiss = miss;
    savegreat = great;
    saveokay = okay;
    savegood = good;
    savehurt = hurt_counter;
}
debug_print("chart reset called");
song_done = false;
game_won = false;
song_loaded = false;
intro_con = 2;
loadsong = 0;
song_initialized = 0;
trackpos = 0;
looptimer = 0;
pitch = 1;
red_glow = 0;
if (!replayversion)
{
    fame = 6000;
    total_fame = 6000;
    max_score = 25000;
    points = 0;
    max_combo = 0;
    combo = 0;
}
note_streak = 0;
score_x = 550;
solo_difficulty = -1;
solo_con = 0;
difficulty = 5;
invc = 0;
brightness = 1;
great = 0;
good = 0;
okay = 0;
miss = 0;
early_miss = 0;
hurt_counter = 0;
tenna_boss = 0;
lose_con = 0;
speed_modifier = 1;
tutorial = 0;
loop_start = 0;
loop = false;
fade = 1;
if (song_id == 3)
    trackstart = 0;
if (auto_play == -1)
    auto_play = 0;
for (i = 0; i < 5; i++)
    remtrackpos[i] = 0;
scr_rhythmgame_notechart_clear();
performer.sprite_index = spr_kris_rock_2;
show_chart = 0;
with (drums)
{
    performer.sprite_index = spr_susie_drum;
    scr_rhythmgame_notechart_clear();
    con = -1;
    fade = 1;
    combo = 0;
    for (i = 0; i < 5; i++)
        remtrackpos[i] = 0;
}
with (vocals)
{
    performer.sprite_index = spr_ralsei_rock_1;
    scr_rhythmgame_notechart_clear();
    scr_rhythmgame_clear_all_lyrics();
    combo = 0;
    fade = 1;
    for (i = 0; i < 5; i++)
        remtrackpos[i] = 0;
}
scr_music_event_clear();
if (v_ex("musicm"))
{
    con = 0;
    musicm.track1_instance = -4;
}
dynamic_solo = false;
track1_id = 0;
track2_id = 0;
track1 = -1;
track2 = -1;
track1_instance = -1;
track2_instance = -1;
track1_main = -1;
track2_main = -1;
invc = 1;
missnotecon = 0;
missnotetimer = 0;
miss_timer = 0;
with (performer)
    shakeamt = 0;
oneAtATime = false;
track_length = 999999;
startoffset = 0;
fame_mul = 1;
if (song_id != 3 && !tenna_boss)
    snd_free_all();
scr_rhythmgame_song_reset();
