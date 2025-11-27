main_list = ds_list_create();
ds_list_add(main_list, 2, 3, 4, 5);
ds_list_shuffle(main_list);
first_attack = ds_list_find_value(main_list, 0);
if (first_attack == 1 && ds_list_find_value(main_list, 1) == 3)
    ds_list_delete(main_list, 1);
second_attack = ds_list_find_value(main_list, 1);
if (second_attack == 1 && ds_list_find_value(main_list, 2) == 3)
    ds_list_delete(main_list, 2);
third_attack = ds_list_find_value(main_list, 2);
first_attack = obj_knight_enemy.first_attack;
second_attack = obj_knight_enemy.second_attack;
third_attack = obj_knight_enemy.third_attack;
var knight = -4;
switch (first_attack)
{
    case 0:
        break;
    case 1:
        knight = instance_create(creatorid.x, creatorid.y, obj_roaringknight_quickslash_attack);
        break;
    case 2:
        knight = instance_create(creatorid.x, creatorid.y, obj_knight_rotating_slash);
        break;
    case 3:
        knight = instance_create(creatorid.x, creatorid.y, obj_knight_tunnel_slasher_2_revised);
        break;
    case 4:
        knight = instance_create(creatorid.x, creatorid.y, obj_knight_swordfall);
        break;
    case 5:
        knight = instance_create(creatorid.x, creatorid.y, obj_knight_weird_bottom_manager);
        break;
}
with (knight)
{
    turn_type = "start";
    if (other.composition == 1)
        turn_type = "short start";
    turn_segment = -1;
    if (other.composition)
        turn_segment = 0;
    next_up = other.second_attack;
    next_next_up = other.third_attack;
    event_user(0);
}
scr_bullet_inherit(knight);
knight.creatorid = creatorid;
knight.creator = creator;
instance_destroy();
