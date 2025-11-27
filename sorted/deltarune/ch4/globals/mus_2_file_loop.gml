function mus_2_file_loop(arg0, arg1, arg2, arg3)
{
    global.currentsong[1] = mus_play_ext(arg0, -1, arg2, arg3);
    with (instance_create(0, 0, obj_setup_music_loop_track))
    {
        persistent = true;
        volume = arg2;
        pitch = arg3;
        introtrack = global.currentsong[0];
        looptrack = snd_init(arg1);
    }
}
