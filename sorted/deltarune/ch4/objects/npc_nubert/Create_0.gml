nubert_marker = scr_dark_marker(0, 0, spr_npc_nubert_hole_arrive);
locations = [new Vector2(290, 790), new Vector2(380, 610), new Vector2(1120, 610), new Vector2(560, 1160)];
spawn_point = locations[irandom(array_length_1d(locations) - 1)];
nubert_marker.x = spawn_point.x;
nubert_marker.y = spawn_point.y;
with (nubert_marker)
    scr_depth();
nubert_readable = -4;
nubert_collider = -4;
entered_zone = false;
exited_zone = false;
arrive = false;
arrive_start = false;
arrive_timer = 0;
leave = false;
leave_timer = 0;
move_nubert = true;

enable_readable = function()
{
    nubert_readable = instance_create(nubert_marker.x, nubert_marker.y, obj_readable_nubert);
    nubert_readable.image_xscale = 2;
    nubert_readable.image_yscale = 2;
};

disable_readable = function()
{
    with (nubert_readable)
        instance_destroy();
};

enable_collider = function()
{
    nubert_collider = instance_create(nubert_marker.x, nubert_marker.y + 20, obj_solidblockDark);
    nubert_collider.image_yscale = 0.5;
};

disable_collider = function()
{
    with (nubert_collider)
        instance_destroy();
};
