snd_stop(track1);
snd_stop(track2);
audio_destroy_stream(astream);
with (obj_astream)
    instance_destroy();
