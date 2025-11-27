function scr_musicer(arg0 = "dogcheck.ogg", arg1 = 0.7, arg2 = 1, arg3 = 0, arg4 = -1)
{
    var musicer = instance_create_depth(0, 0, 0, obj_musicer_gen);
    musicer.song = arg0;
    musicer.volume = arg1;
    musicer.pitch = arg2;
    musicer.delay = arg3;
    musicer.fadein = arg4;
    return musicer;
}
