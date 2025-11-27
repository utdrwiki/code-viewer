if (global.chapter == 4)
{
    var egg_leader_marker = scr_marker(154, 112, spr_egg);
    with (egg_leader_marker)
        depth = 98560;
    var gotten_eggs = 0;
    if (scr_flag_get(911) > 0)
        gotten_eggs++;
    if (scr_flag_get(918) > 0)
        gotten_eggs++;
    if (scr_flag_get(930) > 0)
        gotten_eggs++;
    var egg_dist = 0;
    if (gotten_eggs == 2)
        egg_dist = 5;
    if (gotten_eggs == 3)
        egg_dist = 10;
    for (var i = 0; i < gotten_eggs; i++)
    {
        var egg_marker = scr_marker((egg_leader_marker.x + (i * 10)) - egg_dist, egg_leader_marker.y + 8, spr_egg);
        with (egg_marker)
            depth = 98560;
    }
    var readable = instance_create(egg_leader_marker.x - 12, egg_leader_marker.y + 5, obj_readable_room1);
    with (readable)
    {
        image_xscale = 1.4;
        image_yscale = 0.5;
    }
}
