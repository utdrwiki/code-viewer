con = -1;
howl_con = 0;
var ball_x_offset = 0;
var ball_y_offset = 0;
var ball_sprite = 1098;
if (scr_recruited_all_in_chapter(2))
{
    ball_sprite = 1221;
    ball_x_offset = -16;
    ball_y_offset = -12;
}
if (scr_recruited_all_in_chapter(3))
{
    ball_sprite = 3716;
    ball_x_offset = -16;
    ball_y_offset = -20;
}
var ball_npc = instance_create(59 + ball_x_offset, 271 + ball_y_offset, obj_npc_room);
with (ball_npc)
{
    sprite_index = ball_sprite;
    extflag = "ballperson";
    scr_depth();
}
var ball_legs_marker = scr_dark_marker(54, 300, spr_blockguy_legs_only);
ball_legs_marker.depth = ball_npc.depth + 10;
var ball_block = instance_create(ball_legs_marker.x, ball_legs_marker.y, obj_solidblocksized);
var bloxer_head_npc = instance_create(220, 300, obj_npc_room);
with (bloxer_head_npc)
{
    sprite_index = spr_blockguy_head_only;
    extflag = "bloxer_head";
    scr_depth();
}
var bloxer_legs_npc = instance_create(140, 205, obj_npc_room);
with (bloxer_legs_npc)
{
    sprite_index = spr_blockguy_pants_only;
    extflag = "bloxer_legs";
    scr_depth();
}
var lost_animals = 0;
if (global.flag[642] != 1)
{
    if (global.flag[632] == 1)
    {
        var tasque = instance_create(280, 370, obj_readable_room1);
        tasque.sprite_index = spr_tasque_idle_overworld;
        tasque.visible = 1;
        tasque.image_xscale = 2;
        tasque.image_yscale = 2;
        with (tasque)
            path_start(path_great_door, 2, path_action_continue, 0);
        lost_animals++;
    }
    if (global.flag[634] == 1)
    {
        var maus = instance_create(290, 320, obj_readable_room1);
        maus.sprite_index = spr_maus_idle;
        maus.visible = 1;
        maus.image_xscale = 2;
        maus.image_yscale = 2;
        with (maus)
        {
            path_start(path_great_door, 2, path_action_continue, 0);
            path_position = 0.2;
        }
        lost_animals++;
    }
    if (global.flag[631] == 1)
    {
        var poppup = instance_create(300, 260, obj_readable_room1);
        poppup.sprite_index = spr_npc_poppup;
        poppup.visible = 1;
        poppup.image_xscale = 2;
        poppup.image_yscale = 2;
        with (poppup)
        {
            path_start(path_great_door, 2, path_action_continue, 0);
            path_position = 0.4;
        }
        lost_animals++;
    }
    if (lost_animals == 0 && global.flag[462] < 3 && global.flag[465] == 1)
    {
        var car = instance_create(280, 330, obj_readable_room1);
        car.sprite_index = spr_traffic_car_side_legs_small_left;
        car.visible = 1;
        car.image_xscale = 2;
        car.image_yscale = 2;
        with (car)
            path_start(path_great_door, 2, path_action_continue, 0);
    }
}
