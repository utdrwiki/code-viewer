con = -1;
customcon = 0;
if (global.plot <= 20)
{
    layer_set_visible("Compatibility_Tiles_Depth_10000", 0);
    chair_marker = scr_marker(304, 165, spr_torhouse_chair_breakfast);
    chair_marker.depth = (global.plot < 15) ? 100000 : 97140;
    chair_left_marker = scr_marker(249, 165, spr_torhouse_chair_breakfast_left);
    chair_left_marker.depth = (global.plot < 15) ? 100000 : 97140;
    table_marker = scr_marker(185, 165, spr_torhouse_table_breakfast);
    table_marker.depth = 10000;
    plate_marker = scr_marker(228, 87, spr_torhouse_sink_plate);
    plate_marker.depth = 1000000;
    if (global.plot < 15)
    {
        with (obj_caterpillarchara)
        {
            follow = 0;
            visible = 0;
        }
        susie_marker = scr_marker(347, 170, spr_susie_breakfast_eating_loop);
        susie_marker.image_speed = 0.15;
        susie_marker.depth = table_marker.depth - 10;
        with (obj_doorX_musfade)
            instance_destroy();
        door_readable = instance_create(595, 150, obj_readable_room1);
    }
    else
    {
        blanket_marker = scr_marker(525, 108, spr_torhouse_chair_blanket);
        blanket_marker.depth = 100000;
    }
    plate_marker = scr_marker(347, 170, spr_susie_breakfast_plate);
    plate_marker.depth = table_marker.depth - 10;
    if (global.plot < 15)
        plate_marker.visible = 0;
    else
        plate_marker.x -= 10;
    with (obj_doorA)
        instance_destroy();
    with (obj_markerB)
        instance_destroy();
    bathroom_readable = instance_create(84, 164, obj_readable_room1);
    pancake_readable_kris = instance_create(310, 180, obj_readable_room1);
    with (pancake_readable_kris)
    {
        extflag = "pancakes_kris";
        image_xscale = 1;
    }
    pancake_readable_susie = instance_create(340, 190, obj_readable_room1);
    with (pancake_readable_susie)
    {
        extflag = "pancakes_susie";
        image_xscale = 1;
    }
}
if (global.plot < 15)
{
    con = 0;
    update_plot = false;
    toriel_marker = scr_marker(274, 121, spr_toriel_dt);
    with (toriel_marker)
        scr_depth();
}
else
{
    instance_destroy();
}
