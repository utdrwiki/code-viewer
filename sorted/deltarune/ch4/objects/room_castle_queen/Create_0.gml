con = -1;
speaker_interact = 0;
show_text = false;
car_pause = false;
car_pause_toggle = false;
car_active = false;
car_shadow = -4;
car_shadow_target = 0;
car_shadow_alt = 0;
car_rabbick = -4;
car_rabbick_target = 0;
car_rabbick_alt = 0;
computer_look = false;
computer_look_timer = 0;
queen_drink_convo = false;
queen_drink_text[0] = stringsetloc("\\ES*^6^6^6 %%", "obj_room_castle_queen_slash_Create_0_gml_21_1");
queen_drink_text[1] = stringsetloc("\\E1* Kris Susie How Do You Like My New:/%", "obj_room_castle_queen_slash_Create_0_gml_22_1");
queen_drink_text[2] = stringsetloc("\\ES*^3 %%", "obj_room_castle_queen_slash_Create_0_gml_23_1");
queen_drink_text[3] = stringsetloc("\\E1* Room/%", "obj_room_castle_queen_slash_Create_0_gml_24_1");
queen_drink_text[4] = stringsetloc("\\ES*^6^6 %%", "obj_room_castle_queen_slash_Create_0_gml_25_1");
queen_drink_text[5] = stringsetloc("\\E9* Do You Want A Sip/%", "obj_room_castle_queen_slash_Create_0_gml_26_1");
queen_drink_text[6] = stringsetloc("\\EK* Uhh..^1. that's acid. We'd die./%", "obj_room_castle_queen_slash_Create_0_gml_27_1");
queen_drink_text[7] = stringsetloc("\\E1* Oh Dear First You Don't Want To Swim In The Free Pool/%", "obj_room_castle_queen_slash_Create_0_gml_28_1");
queen_drink_text[8] = stringsetloc("\\EF* Now You Don't Want To Drink The Free Pool Water/%", "obj_room_castle_queen_slash_Create_0_gml_29_1");
queen_drink_text[9] = stringsetloc("\\ED* More For Me I Suppose/%", "obj_room_castle_queen_slash_Create_0_gml_30_1");
queen_drink_index = 0;
if (scr_get_total_recruits(2) == 0)
{
    with (obj_mainchara)
        cutscene = 1;
    var queen_npc = instance_create(200, 150, obj_npc_room);
    with (queen_npc)
    {
        sprite_index = spr_queen_walk_up;
        normalanim = 4;
        scr_depth();
    }
    var trashy_npc = instance_create(315, 175, obj_npc_room_animated);
    with (trashy_npc)
    {
        sprite_index = spr_npc_trashy;
        scr_depth();
    }
    var divider_collider = instance_create(520, 240, obj_solidblockDark);
    with (divider_collider)
        image_yscale = 2;
    var divider_marker = scr_dark_marker(520, 240, spr_pixel_white);
    with (divider_marker)
    {
        image_blend = c_black;
        image_xscale = 30;
        image_yscale = 20;
    }
    var room_cover_marker = scr_dark_marker(640, 70, spr_pixel_white);
    with (room_cover_marker)
    {
        image_blend = c_black;
        image_xscale = 100;
        image_yscale = 100;
    }
}
else
{
    active_cars = 0;
    if (scr_flag_get(654) == 1)
    {
        active_cars++;
        road_marker = scr_dark_marker(680, 120, spr_dw_castle_queen_room_road);
        with (road_marker)
            depth = 1000000;
        road_blocker = instance_create(680, 140, obj_solidblockDark);
        with (road_blocker)
            image_xscale = 10;
        car_shadow = scr_dark_marker_animated(800, 170, spr_npc_shadowmen_car, 0.2);
        car_shadow.depth = 890000;
        car_shadow_timer = 0;
        car_shadow_pos = car_shadow.xstart;
        car_shadow_target = car_shadow.xstart;
        car_shadow_target_temp = car_shadow.xstart;
        car_pause_timer = 0;
        car_shake_timer = 0;
        car_shadow_readable = instance_create(car_shadow.x - sprite_get_width(car_shadow.sprite_index), car_shadow.y - 20, obj_readable_room1);
        with (car_shadow_readable)
            image_xscale = 8;
    }
    if (scr_flag_get(613) > 0 && scr_flag_get(462) < 3 && scr_flag_get(465) > 0)
    {
        active_cars++;
        car_rabbick = scr_dark_marker(720, 239, spr_npc_rabbick_car);
        with (car_rabbick)
        {
            image_speed = 0.2;
            depth = 97500;
        }
        car_rabbick_target = car_rabbick.xstart;
        car_rabbick_readable = instance_create(car_rabbick.x - 20, car_rabbick.y - 20, obj_readable_room1);
        with (car_rabbick_readable)
            image_xscale = 2;
    }
    if (active_cars > 0)
    {
        car_active = true;
        traffic_light = scr_dark_marker(690, 70, spr_dw_castle_queen_room_traffic_light);
        with (traffic_light)
            depth = 900000;
        var traffic_readable = instance_create(traffic_light.x, traffic_light.y, obj_readable_room1);
        with (traffic_readable)
        {
            image_xscale = 2;
            image_yscale = 5;
        }
        var traffic_collision = instance_create(traffic_light.x, traffic_light.y, obj_solidblockDark);
        with (traffic_collision)
            image_yscale = 2.6;
    }
    computer_look = scr_flag_get(640) > 0 && scr_flag_get(623) > 0;
    if (computer_look)
    {
        werewerewire_npc = scr_dark_marker(982, 272, spr_npc_werewerewire_look);
        with (werewerewire_npc)
            scr_depth();
        var computer_right = scr_dark_marker(926, 272, spr_dw_castle_queen_room_computer);
        computer_right.depth = werewerewire_npc.depth + 10;
        var computer_collider = instance_create(computer_right.x, computer_right.y + 46, obj_solidblockDark);
        with (computer_collider)
        {
            image_xscale = 2.75;
            image_yscale = 2;
        }
        var computer_readable = instance_create(computer_collider.x, computer_collider.y, obj_readable_room1);
        with (computer_readable)
        {
            image_xscale = 5;
            image_yscale = 4;
        }
        head_hathy_npc = scr_dark_marker(720, 302, spr_npc_hathyx_look);
        with (head_hathy_npc)
            scr_depth();
        var computer_left = scr_dark_marker(head_hathy_npc.x - 10, 272, spr_dw_castle_queen_room_computer);
        computer_left.depth = head_hathy_npc.depth + 10;
        computer_collider = instance_create(computer_left.x, computer_left.y + 46, obj_solidblockDark);
        with (computer_collider)
        {
            image_xscale = 2.75;
            image_yscale = 2;
        }
        computer_readable = instance_create(computer_collider.x, computer_collider.y, obj_readable_room1);
        with (computer_readable)
        {
            image_xscale = 5;
            image_yscale = 4;
        }
    }
    var speaker_left_marker = scr_dark_marker(172, 44, spr_dw_castle_queen_speaker_left);
    with (speaker_left_marker)
    {
        image_speed = 0.2;
        scr_depth();
    }
    var speaker_right_marker = scr_dark_marker(375, 44, spr_dw_castle_queen_speaker_right);
    with (speaker_right_marker)
    {
        image_speed = 0.2;
        scr_depth();
    }
    var queen_marker = scr_dark_marker(266, 27, spr_npc_queen_sip);
    with (queen_marker)
        depth = speaker_right_marker.depth - 10;
    speaker_collider[0] = instance_create(172, 104, obj_solidblockDark);
    with (speaker_collider[0])
    {
        image_xscale = 2.5;
        image_yscale = 3;
    }
    speaker_collider[1] = instance_create(379, 104, obj_solidblockDark);
    with (speaker_collider[1])
    {
        image_xscale = 2.5;
        image_yscale = 3;
    }
    speaker_collider[2] = instance_create(272, 104, obj_solidblockDark);
    with (speaker_collider[2])
    {
        image_xscale = 2.7;
        image_yscale = 2.8;
    }
    var queen_readable = instance_create(266, 180, obj_readable_room1);
    with (queen_readable)
        image_xscale = 6;
    var speaker_left_readable = instance_create(172, 100, obj_readable_room1);
    with (speaker_left_readable)
    {
        image_xscale = 4.5;
        image_yscale = 6;
    }
    var speaker_right_readable = instance_create(390, 100, obj_readable_room1);
    with (speaker_right_readable)
    {
        image_xscale = 4.5;
        image_yscale = 6;
    }
    var rouxls_npc = instance_create(127, 275, obj_npc_room);
    with (rouxls_npc)
    {
        normalanim = 4;
        scr_depth();
        sprite_index = spr_npc_rouxls_lamp;
    }
}
