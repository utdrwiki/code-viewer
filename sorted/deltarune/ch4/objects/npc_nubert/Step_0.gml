if (!entered_zone)
{
    if (point_in_rectangle(obj_mainchara.x, obj_mainchara.y, nubert_marker.x - 80, nubert_marker.y - 80, nubert_marker.x + (sprite_get_width(nubert_marker.sprite_index) * 2) + 80, nubert_marker.y + (sprite_get_height(nubert_marker.sprite_index) * 2) + 80))
    {
        entered_zone = true;
        exited_zone = false;
        if (!arrive)
            arrive = true;
    }
}
else if (!point_in_rectangle(obj_mainchara.x, obj_mainchara.y, nubert_marker.x - 80, nubert_marker.y - 80, nubert_marker.x + (sprite_get_width(nubert_marker.sprite_index) * 2) + 80, nubert_marker.y + (sprite_get_height(nubert_marker.sprite_index) * 2) + 80))
{
    exited_zone = true;
    entered_zone = false;
}
if (exited_zone)
{
    if (global.interact == 0 && !d_ex() && arrive)
        arrive_start = true;
}
if (arrive_start)
{
    arrive_timer++;
    if (arrive_timer == 1)
    {
        enable_collider();
        with (nubert_marker)
        {
            sprite_index = spr_npc_nubert_hole_arrive;
            image_index = 0;
            image_speed = 0.2;
        }
    }
    if (arrive_timer == 30)
    {
        with (nubert_marker)
            image_speed = 0;
        enable_readable();
    }
    if (arrive_timer >= 270 && !d_ex() && global.interact == 0)
    {
        leave = true;
        arrive_start = false;
        arrive_timer = 0;
        arrive = false;
    }
}
if (leave)
{
    leave_timer++;
    if (leave_timer == 1)
    {
        disable_readable();
        nubert_marker.sprite_index = spr_npc_nubert_hole_leave;
        nubert_marker.image_index = 0;
        nubert_marker.image_speed = 0.2;
    }
    if (leave_timer == 30)
    {
        disable_collider();
        nubert_marker.image_speed = 0;
        leave_timer = 0;
        leave = false;
        move_nubert = true;
        exited_zone = true;
        entered_zone = false;
    }
}
if (move_nubert)
{
    move_nubert = false;
    spawn_point = locations[irandom(array_length_1d(locations) - 1)];
    nubert_marker.x = spawn_point.x;
    nubert_marker.y = spawn_point.y;
    with (nubert_marker)
        scr_depth();
}
