scr_populatechars();
if (init)
{
    susie.image_alpha = 0;
    kris.image_alpha = 0;
    topy = 1990;
    bottomy = 2042;
    room_left = 2560;
    altx1 = obj_mainchara.x;
    alty1 = clamp(bottomy - (3194 - obj_mainchara.x) - (bottomy - obj_mainchara.y), 0, obj_mainchara.y);
    alty2 = alty1 + 160;
    altx2 = altx1 + 640;
    altx3 = altx1 + 1280;
    altx4 = altx1 + 1920;
    var targx = obj_mainchara.x;
    var targy = obj_mainchara.y;
    var alty1withtol = clamp(alty1, 1420, obj_mainchara.y);
    if (alty1withtol < targy)
        targy = alty1withtol;
    var alty2withtol = alty2 + 140;
    if (alty2withtol < targy)
        targy = alty2withtol;
    var camx = clamp(targx - floor(320 - (obj_mainchara.initwd / 2)), room_left, room_width - 640);
    var camy = clamp(targy - floor(320 - (obj_mainchara.initht / 2)), 1400, room_height - 480);
    camerax_set(camx);
    cameray_set(camy);
    var camtop = 1400;
    var leftscreenx = 2560;
    var rightscreenx = 3200;
    var bottomscreeny = 2042;
    if (krmark[0].x > 3156)
        scr_depth(krmark[0], -92350);
    else
        krmark[0].depth = layer_get_depth("TILES_LAYER1") - 10;
    if (sumark[0].x > 3156)
        scr_depth(sumark[0], -92350);
    else
        sumark[0].depth = layer_get_depth("TILES_LAYER1") - 10;
    if (i_ex(ramark[0]))
    {
        if (ramark[0].x > 3156)
            scr_depth(ramark[0], -92350);
        else
            ramark[0].depth = layer_get_depth("TILES_LAYER1") - 10;
    }
    if (!depupd)
    {
        if (i_ex(krmark[1]))
            krmark[1].depth = layer_get_depth("TILES_LAYER3") - 10;
        if (i_ex(krmark[2]))
            krmark[2].depth = layer_get_depth("TILES_LAYER2") - 10;
        if (i_ex(krmark[3]))
            krmark[3].depth = layer_get_depth("TILES_LAYER0") - 10;
        if (i_ex(sumark[1]))
            sumark[1].depth = layer_get_depth("TILES_LAYER3") - 10;
        if (i_ex(sumark[2]))
            sumark[2].depth = layer_get_depth("TILES_LAYER2") - 10;
        if (i_ex(sumark[3]))
            sumark[3].depth = layer_get_depth("TILES_LAYER0") - 10;
        if (i_ex(ramark[1]))
            ramark[1].depth = layer_get_depth("TILES_LAYER3") - 10;
        if (i_ex(ramark[2]))
            ramark[2].depth = layer_get_depth("TILES_LAYER2") - 10;
        if (i_ex(ramark[3]))
            ramark[3].depth = layer_get_depth("TILES_LAYER0") - 10;
        depupd = 1;
    }
    var krposx = [];
    var krposy = [];
    var kryscale = [];
    var targ = [];
    targ[0] = kris;
    targ[1] = susie;
    if (i_ex(ralsei))
        targ[2] = ralsei;
    var mtarg = [];
    mtarg[0] = krmark;
    mtarg[1] = sumark;
    if (i_ex(ralsei))
        mtarg[2] = ramark;
    var xoff = [];
    var yoff = [];
    xoff[0] = 0;
    yoff[0] = 0;
    xoff[1] = 0;
    yoff[1] = 16;
    xoff[2] = 0;
    yoff[2] = 12;
    for (var m = 0; m < array_length(targ); m++)
    {
        krposx[0] = targ[m].x;
        krposy[0] = clamp(bottomscreeny - (3194 - targ[m].x) - (bottomscreeny - targ[m].y), 0, targ[m].y);
        kryscale[0] = 2;
        krposx[1] = targ[m].x + 640;
        var targloc = (bottomscreeny - (3194 - targ[m].x) - (bottomscreeny - targ[m].y)) + targ[m].sprite_height + 440 + yoff[m];
        krposy[1] = targloc;
        kryscale[1] = -2;
        krposx[2] = (targ[m].x + 1280) - 440;
        krposy[2] = (camtop - (krposx[2] - 2836)) + 100 + yoff[m];
        kryscale[2] = -2;
        krposx[3] = krposx[2] + 640;
        krposy[3] = 1714 - yoff[m];
        kryscale[3] = 2;
        for (var i = 0; i < array_length(mtarg[m]); i++)
        {
            mtarg[m][i].sprite_index = targ[m].sprite_index;
            mtarg[m][i].image_index = targ[m].image_index;
            mtarg[m][i].image_xscale = 2;
            mtarg[m][i].image_yscale = kryscale[i];
            var thisxoff = 0;
            var thisyoff = 0;
            setxy(krposx[i], krposy[i], mtarg[m][i]);
        }
    }
}
