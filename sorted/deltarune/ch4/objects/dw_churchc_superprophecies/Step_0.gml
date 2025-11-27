var camy = cameray();
scr_populatechars();
if (!init)
    init = 1;
with (obj_floorshadow)
    instance_destroy();
if (musiccon == 0)
{
    if (scr_trigcheck("musicbegin"))
    {
        global.flag[1615] = 1;
        if (!instance_exists(obj_musicer_dw_church3))
            instance_create(x, y, obj_musicer_dw_church3);
        musiccon = 2;
    }
}
with (blackoverlay)
{
    if (camy != 0)
    {
        var pt1 = scr_genmarker("fadestart").y;
        var pt2 = scr_genmarker("fadeend").y;
        var alp = scr_progress(camy, pt2, pt1, 0, 1);
        image_alpha = alp;
    }
}
