global.flag[20] = 0;
image_xscale = 2;
image_yscale = 2;
anim = 0;
anim_timer = 0;
current_state = 0;
load_sprite = false;
room_mode = 0;
head_sprite_default = (room == room_dw_green_room) ? spr_npc_ramb_head_turned : spr_npc_ramb_head_happy;
head_sprites = [head_sprite_default, spr_npc_ramb_head_turn, spr_npc_ramb_head_happy_nostalgic, spr_npc_ramb_head_surprised, spr_npc_ramb_head_annoyed, spr_npc_ramb_head_turn_look, spr_npc_ramb_head_turn_look_side, spr_npc_ramb_head_turn_subtle];
head_sprite = head_sprite_default;
head_sprite_index = 0;
body_sprite = (room == room_dw_green_room) ? spr_npc_ramb_body_clean : spr_npc_ramb_body;
stone_mode = room == room_dw_console_room;
if (stone_mode)
    body_sprite = spr_npc_ramb_half_stone;
body_anim = 0;
talked = 0;
board_talk = false;
board_con = 0;
board_talk_count = 0;
has_prize = false;
prize_marker = -4;
prize_text = "";
get_prize_sequence = false;
get_prize_con = 0;
prize_flag = (global.plot < 150) ? 1028 : 1030;
if (room == room_dw_green_room)
{
    if (global.plot < 205)
        has_prize = scr_flag_get(prize_flag) == 0;
    if (has_prize)
    {
        prize_marker = scr_dark_marker(760, 82, spr_dw_green_room_prize);
        with (prize_marker)
            scr_depth();
    }
}
event_inherited();

get_prize = function(arg0)
{
    prize_text = arg0;
    get_prize_sequence = true;
};

get_nothing = function()
{
    get_prize_sequence = true;
    get_prize_con = 10;
};
