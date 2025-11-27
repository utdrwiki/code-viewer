function snd_play_complex(arg0 = -1, arg1 = 0, arg2 = 0)
{
    var sndcomplex = instance_create(x, y, obj_snd_complex);
    sndcomplex.lifetime = arg0;
    sndcomplex.killall = arg1;
    sndcomplex.killind = arg2;
    return sndcomplex;
}

function snd_add_complex(arg0, arg1, arg2, arg3 = 1, arg4 = 1, arg5 = 0, arg6 = -1, arg7 = false)
{
    with (arg0)
    {
        snd[arg1] = arg2;
        pitch[arg1] = arg3;
        delay[arg1] = arg5;
        volume[arg1] = arg4;
        looprate[arg1] = arg6;
        killsnd[arg1] = arg7;
    }
}
