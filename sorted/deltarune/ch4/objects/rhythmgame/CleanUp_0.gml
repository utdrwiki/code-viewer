safe_delete(obj_rhythmgame_chart);
safe_delete(obj_rhythmgame_effects);
safe_delete(obj_music_event_manager);
safe_delete(obj_rhythmgame_performer);
safe_delete(obj_rhythmgame_spotlights);
safe_delete(obj_rhythmgame_crowd);
with (obj_rhythmgame_spotlight_solo)
    instance_destroy();
if (v_ex("silhouette_surf") && surface_exists(silhouette_surf))
    surface_free(silhouette_surf);
if (tenna_boss && i_ex(obj_tenna_enemy))
{
    mus_volume(track1_instance, 1, 0);
    mus_volume(track2_instance, 0, 0);
    if (speed_modifier == 2 && hurt_counter == 0)
        obj_tenna_enemy.completedrhythmwithouttakingdamage = 1;
    if (speed_modifier == 2.5 && hurt_counter == 0)
        obj_tenna_enemy.completedrhythmwithouttakingdamage2 = 1;
}
if (v_ex("lyric_surface") && surface_exists(lyric_surface))
    surface_free(lyric_surface);
if (v_ex("lyric_sprite") && sprite_exists(lyric_sprite[0]))
    sprite_delete(lyric_sprite[0]);
if (v_ex("lyric_sprite") && sprite_exists(lyric_sprite[1]))
    sprite_delete(lyric_sprite[1]);
if (global.chapter != 3)
    snd_free_all();
