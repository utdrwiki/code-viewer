if (!pull_start)
    exit;
pull_timer++;
if (pull_timer == 1)
    con = 1;
if (con == 1)
{
    con = 2;
    alarm[0] = 10;
    if (floor_marker == -4)
    {
        floor_marker = floor_markers[floor_index];
        if (floor_index > 0)
            x = floor_marker.x + 80;
        else
            x = floor_marker.x;
    }
    if (floor_index > 0)
    {
        var floor_cover = scr_dark_marker(floor_marker.x, floor_marker.y, spr_blank_tile_black);
        floor_cover.depth = floor_marker.depth + 10;
        with (floor_cover)
        {
            image_xscale = 6;
            image_yscale = 10;
        }
    }
    snd_play_x(snd_chomp, 1, 0.25);
    scr_lerpvar("y", cameray() + view_hport[0] + 400, 840, 20, 3, "inout");
}
if (con == 3)
{
    con = 4;
    alarm[0] = 4;
    scr_lerpvar("base_rot", base_rot, 0, 10, 2, "out");
}
if (con == 5)
{
    con = 6;
    alarm[0] = 5;
    scr_lerpvar("finger_anim", 0, 4, 12);
}
if (con == 7)
{
    con = 8;
    alarm[0] = 6;
    scr_lerpvar("y", y, 880, 6);
}
if (con == 9)
{
    con = 10;
    alarm[0] = 6;
    snd_play(snd_closet_impact);
    shake_active = true;
    scr_shakescreen(10, 10);
}
if (con == 11)
{
    con = 12;
    alarm[0] = 14;
    shake_active = false;
    scr_lerpvar("y", y, 480 + view_hport[0] + 400, 14, 3, "in");
    with (floor_marker)
        scr_lerpvar("y", y, 480 + view_hport[0] + 400, 14, 3, "in");
}
if (con == 13)
{
    con = -1;
    pull_start = false;
    pull_timer = 0;
    finger_anim = 0;
    base_rot = -20;
    with (floor_marker)
        instance_destroy();
    floor_marker = -4;
}
