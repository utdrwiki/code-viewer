if (global.tempflag[90] == 24.8)
{
    global.tempflag[90] = 0;
    var pos = scr_heromarker("kris", "warp");
    setxy(pos[0], pos[1], 1049);
    with (obj_caterpillarchara)
    {
        var targx = pos[0] - global.tempflag[52];
        var targy = pos[1] - global.tempflag[53];
        setxy(targx, targy);
        global.tempflag[52] = 0;
        global.tempflag[53] = 0;
    }
    scr_caterpillar_interpolate("all");
}
