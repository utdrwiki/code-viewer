scr_depth();
if (global.chapter == 4)
{
    if (global.plot >= 290)
    {
        var roof_marker = scr_marker(x, y, spr_church_night_roof);
        roof_marker.depth = depth;
        sprite_index = spr_church_night;
        depth += 10000;
    }
}
