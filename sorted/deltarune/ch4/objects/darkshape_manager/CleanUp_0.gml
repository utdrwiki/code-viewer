ds_list_destroy(star_list);
with (obj_battle_marker)
    instance_destroy();
if (audio_is_playing(ominous_loop))
    audio_stop_sound(ominous_loop);
snd_stop(snd_spawn_attack);
