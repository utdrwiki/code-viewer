scr_board_enemy_init();
show_outline = false;
bubbletimer = -10 + irandom(20);
hurt_sprite = spr_board_flower_hurt;
image_speed = 0.05;
depth = 100003;
if (type == 1)
    sprite_index = spr_board_flower_aqua;
slow = false;
damage_hitbox.image_xscale = 0.25;
damage_hitbox.image_yscale = 0.25;
sword_immunity_lv = 2;
if (room == room_board_2_sword)
    sword_immunity_lv = 0;
alt = false;
if ((room == room_board_1_sword || room == room_board_2_sword) && obj_mainchara_board.swordlv > 1)
{
    image_speed = 0.05;
    sprite_index = spr_board_flower_alt;
    alt = true;
}
if ((room == room_board_1_sword || room == room_board_2_sword) && obj_mainchara_board.swordlv == 1)
{
    image_speed = 0;
    sprite_index = spr_board_flower_alt;
    alt = true;
}
