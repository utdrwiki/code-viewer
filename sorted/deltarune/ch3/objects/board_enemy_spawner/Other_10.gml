if (image_index == 0)
{
    enemy = instance_create(x, y, obj_board_enemy_monster);
    if (type == 1)
        enemy.spd = 10;
}
if (image_index == 1)
{
    enemy = instance_create(x, y, obj_board_enemy_monster);
    enemy.image_blend = c_gray;
    enemy.hp = 999;
    enemy.maxhp = 999;
    enemy._sprIdle = spr_board_monster;
    enemy._sprAngry = spr_board_monster_angery;
    if (room == room_board_2_sword)
        enemy.type = 3;
}
if (image_index == 2)
{
    enemy = instance_create(x, y, obj_board_enemy_monster);
    enemy.type = 1;
    enemy.spd = 4;
    enemy.image_blend = c_yellow;
    enemy.hp = 2;
    enemy.maxhp = 2;
    enemy.bulletimer = 10 - random(25);
    enemy.sword_immunity_lv = 2;
    if (room == room_board_dungeon_2 || room == room_board_dungeon_3)
        enemy.spd = 6;
    if (type == 1)
    {
        enemy.spearboss = true;
        enemy.bulletimer = 0;
        enemy.hp = 8;
        enemy.maxhp = 8;
        enemy.spd = 3;
        enemy.slow = 1;
        instance_create(board_tilex(4), board_tiley(2), obj_board_miniboss_wall);
        instance_create(board_tilex(5), board_tiley(2), obj_board_miniboss_wall);
        instance_create(board_tilex(6), board_tiley(2), obj_board_miniboss_wall);
        instance_create(board_tilex(7), board_tiley(2), obj_board_miniboss_wall);
    }
}
if (image_index == 3)
{
    enemy = instance_create(x, y, obj_board_enemy_monster);
    enemy.type = 2;
    enemy.spd = 4;
    enemy.hp = 2;
    enemy.maxhp = 2;
    enemy.image_blend = c_orange;
    enemy.sword_immunity_lv = 3;
    if (room == room_board_dungeon_2 || room == room_board_dungeon_3)
        enemy.spd = 4;
}
if (image_index == 4)
{
    enemy = instance_create(x, y, obj_board_enemy_yellowflower);
    enemy.sword_immunity_lv = 2;
    if (type == 1)
        enemy.slow = true;
    if (type == 2)
    {
        enemy.slow = true;
        enemy.bubbletimer = -30 - irandom(20);
    }
    if (type == 3)
    {
        enemy.slow = true;
        enemy.bubbletimer = -100 - irandom(20);
    }
    var cold = false;
    with (obj_board_cold)
    {
        if (active)
            cold = true;
    }
    if (cold)
        enemy.sprite_index = spr_board_flower_caqua;
}
if (image_index == 5)
{
    enemy = instance_create(x, y, obj_board_enemy_yellowflower);
    enemy.type = 1;
    enemy.sprite_index = spr_board_flower_aqua;
}
if (image_index == 6)
{
    enemy = instance_create(x, y, obj_board_enemy_bluefish);
    enemy.sword_immunity_lv = 2;
    if (room == room_board_1_sword)
        enemy.board_1_type = type;
}
if (image_index == 7)
{
    enemy = instance_create(x, y, obj_board_enemy_bluefish);
    enemy.silverfish = true;
    enemy.hp = 5;
    enemy.maxhp = 5;
    enemy.sprite_index = spr_board_silverfish_r;
}
if (image_index == 8)
{
    enemy = instance_create(x, y, obj_board_enemy_silentcat);
    if (type == 1)
        enemy.onebyone = true;
}
if (image_index == 9)
{
    enemy = instance_create(x, y, obj_board_enemy_singingcat);
    enemy.type = 1;
    enemy.spd = 6;
    enemy.hp = 2;
    enemy.maxhp = enemy.hp;
}
if (image_index == 10)
{
    enemy = instance_create(x, y, obj_board_enemy_lizard);
    if (type == 1)
        enemy.dontmove = true;
}
if (image_index == 11)
{
    enemy = instance_create(x, y, obj_board_enemy_lizard);
    enemy.spd = 5;
    enemy.type = 1;
    enemy.sprite_index = spr_board_lizard_l_alt;
}
if (image_index == 12)
{
    enemy = instance_create(x, y, obj_board_enemy_lizard);
    enemy.spd = 6;
    enemy.type = 2;
    enemy.sprite_index = spr_board_lizard_l_jumpy;
}
if (image_index == 13)
{
    if (room == room_board_1_sword)
        enemy = instance_create(x, y, obj_board_enemy_bluebird_board1);
    else
        enemy = instance_create(x, y, obj_board_enemy_bluebird);
}
if (image_index == 14)
{
    enemy = instance_create(x, y, obj_board_enemy_deer);
    instance_destroy();
    exit;
}
if (image_index == 15)
{
    enemy = instance_create(x, y, obj_board_enemy_black_deer);
    if (type == 1)
    {
        enemy.toriel = true;
        enemy.hp = 999;
        enemy.maxhp = 999;
        instance_create(board_tilex(6), board_tiley(1), obj_board_puzzle_wall);
        instance_create(board_tilex(6), board_tiley(2), obj_board_puzzle_wall);
        instance_create(board_tilex(6), board_tiley(3), obj_board_puzzle_wall);
        instance_create(board_tilex(5), board_tiley(4), obj_board_puzzle_wall);
        instance_create(board_tilex(5), board_tiley(5), obj_board_puzzle_wall);
        instance_create(board_tilex(5), board_tiley(6), obj_board_puzzle_wall);
        instance_create(board_tilex(9), board_tiley(3), obj_board_puzzle_wall);
        instance_create(board_tilex(8), board_tiley(4), obj_board_puzzle_wall);
        instance_create(board_tilex(9), board_tiley(5), obj_board_puzzle_wall);
        instance_create(board_tilex(7), board_tiley(5), obj_board_puzzle_wall);
    }
}
if (image_index == 16)
    enemy = instance_create(x, y, obj_board_enemy_rotaty);
if (image_index == 17)
    enemy = instance_create(x, y, obj_board_enemy_bouncy);
if (image_index == 18)
{
    enemy = instance_create(x + 16, y + 16, obj_fire_bar_base);
    enemy.place = type;
}
if (image_index == 19)
{
    if (type == 0)
        enemy = instance_create(x + 16, y + 16, obj_board_icepuzzle_controller1);
    if (type == 1)
        enemy = instance_create(x + 16, y + 16, obj_board_icepuzzle_controller2);
    if (type == 2)
        alarm[0] = 1;
    if (type == 3)
    {
        if (obj_board_glacier_switch3.used == false && !place_meeting(x, y, obj_board_tree))
            var mon = instance_create(x, y, obj_board_tree);
    }
    if (type == 4)
        instance_create(x + 16, y + 16, obj_board_chase_event);
    if (type == 5)
        enemy = instance_create(x + 16, y + 16, obj_board_floweroom_doors);
    if (type == 6)
    {
        alarm[0] = 1;
        teleport_type = "to maze";
    }
    if (type == 7)
    {
        alarm[0] = 1;
        teleport_type = "maze up";
    }
    if (type == 8)
    {
        alarm[0] = 1;
        teleport_type = "maze down";
    }
    if (type == 9)
    {
        alarm[0] = 1;
        teleport_type = "maze left";
    }
    if (type == 10)
    {
        alarm[0] = 1;
        teleport_type = "maze right";
    }
    if (type == 11)
    {
        alarm[0] = 1;
        teleport_type = "maze out";
    }
    exit;
}
if (image_index == 20)
{
    enemy = instance_create(x, y, obj_pushableblock_board);
    enemy.sprite_index = spr_board_pushableblock_ice;
    enemy.custom_sprite = spr_board_pushableblock_ice;
    enemy.image_xscale = 1;
    enemy.image_yscale = 1;
}
enemy.spawnerid = id;
