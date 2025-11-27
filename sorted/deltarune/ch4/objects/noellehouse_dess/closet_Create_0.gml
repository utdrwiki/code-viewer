is_open = false;
if (is_open)
{
    with (obj_npc_room)
        visible = 0;
    with (obj_marker)
        visible = 0;
}
else
{
    collider[0] = instance_create(20, 26, obj_homealone_solid);
    collider[0].image_xscale = 12;
    collider[1] = instance_create(260, 26, obj_homealone_solid);
    collider[1].image_yscale = 5;
}
closet_bg_marker = scr_marker(x, y, spr_noellehouse_dess_closet_open);
closet_bg_marker.depth = 900000;
open_door = false;
close_door = false;
door_xpos = x + 82;
door_base_xpos = x + 82;
door_slide_xpos = x + 42;
door_alpha = 1;
shelf_alpha = 1;
wall_alpha = 1;
closet_fadein = false;
closet_fadeout = false;
closet_opened = false;
closet_closed = true;
kris_active = false;
kris_sprite = spr_noellehouse_kris_hold_walk;
kris_index = 0;
kris_x = 203;
kris_y = 80;
kris_anim_speed = 0;
test_timer = 0;

clean_up = function()
{
    with (closet_bg_marker)
        instance_destroy();
    instance_destroy();
};
