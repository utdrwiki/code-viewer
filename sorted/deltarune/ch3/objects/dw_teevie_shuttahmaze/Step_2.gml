if (con == 3)
{
    trigd = 0;
    if (i_ex(zap1))
    {
        if (i_ex(zap1t))
        {
            zap1t.x = zap1.x + ((zap1.bbox_right - zap1.bbox_left) / 2);
            zap1t.y = (zap1.bbox_bottom - 60) + 1;
            zap1t.image_xscale = 3.125;
            zap1t.image_yscale = 3.75;
            zap1t.depth = zap1.depth - 1;
        }
    }
    if (i_ex(zap2))
    {
        if (i_ex(zap2t))
        {
            var xoff = 0;
            if (zap2.image_xscale == -2)
                xoff = -138;
            zap2t.x = zap2.x + ((zap2.bbox_right - zap2.bbox_left) / 2) + xoff;
            zap2t.y = (zap2.bbox_bottom - 60) + 1;
            zap2t.image_xscale = 3.125;
            zap2t.image_yscale = 3.75;
            zap2t.depth = zap1.depth - 1;
        }
    }
    with (zap1t)
    {
        if (place_meeting(x, y, obj_mainchara))
            other.trigd = 1;
    }
    if (trigd == 0)
    {
        with (zap2t)
        {
            if (place_meeting(x, y, obj_mainchara))
                other.trigd = 2;
        }
    }
    if (trigd)
    {
        con++;
        timer = 0;
        global.interact = 1;
    }
}
