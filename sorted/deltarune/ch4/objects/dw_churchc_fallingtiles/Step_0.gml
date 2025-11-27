if (con == 0)
{
    var endpoint = obj_mainchara.bbox_bottom;
    with (obj_caterpillarchara)
    {
        if ((bbox_bottom - 4) > endpoint)
            endpoint = bbox_bottom - 4;
    }
    if (endpoint < bbox_top)
    {
        con = -1;
        with (instance_create(x, y, obj_solidblocksized))
            scr_sizeexact(other.sprite_width, other.sprite_height);
        scr_delay_var("con", 2, irandom_range(1, 8));
    }
}
if (con == 2)
{
    con = 3;
    var endtime = irandom_range(30, 60);
    gravity = 1;
    snd_stop(snd_impact);
    snd_play(snd_impact, 0.4, random_range(0.3, 0.8));
    vspeed = choose(-1, -1, 0, 0, 0, 0, 0, 0, -2);
    scr_lerp_imageblend(id, c_white, c_black, endtime);
    scr_doom(id, endtime);
}
