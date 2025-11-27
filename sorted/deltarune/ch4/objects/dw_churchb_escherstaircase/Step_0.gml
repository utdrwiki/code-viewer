obj_mainchara.cutscene = 1;
if (!init)
{
    if (makera)
    {
        var pos = scr_heromarker("ralsei", "rastart");
        ralsei = scr_marker_ext(pos[0], pos[1], spr_ralsei_walk_up_sad, 2, 2, 0, undefined, undefined, undefined, 1);
        ralsei.visible = false;
    }
    for (var i = 0; i < 4; i++)
    {
        var krs = scr_marker_ext(x, y, spr_krisd_dark, 2, 2, 0);
        krmark[i] = krs;
        var sus = scr_marker_ext(x, y, spr_krisd_dark, 2, 2, 0);
        sumark[i] = sus;
        if (makera)
        {
            var ral = scr_marker_ext(x, y, spr_krisd_dark, 2, 2, 0);
            ramark[i] = ral;
        }
    }
    init = 1;
}
if (con == 0)
{
    if (scr_trigcheck("rastart"))
    {
        ralsei.sprite_index = spr_ralsei_walk_left_sad_subtle;
        ralsei.hspeed = -2;
        con = 1;
    }
}
if (con == 1)
{
    with (ralsei)
    {
        if (abs(obj_mainchara.x - x) < 120)
        {
            friction = 0;
            x = obj_mainchara.x - 120;
        }
        if (abs(obj_mainchara.x - x) < 180)
        {
            friction = 0;
            hspeed = lerp(hspeed, -8, 0.125);
        }
        if (abs(obj_mainchara.x - x) > 480)
            friction = 1.5;
        if (hspeed < -0.5)
        {
            image_speed = 0.125;
        }
        else
        {
            image_speed = 0;
            image_index = 0;
        }
    }
}
