con = -1;
customcon = 0;
open_fence = false;
if (global.plot >= 35 && global.plot < 45)
{
    con = 0;
    stem_marker = scr_marker(295, 156, spr_flower_stem_rotate);
    with (stem_marker)
    {
        depth = 97000;
        image_speed = 0.25;
        visible = 0;
    }
}
else
{
    instance_destroy();
}
