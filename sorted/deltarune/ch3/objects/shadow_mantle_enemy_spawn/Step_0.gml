if (!i_ex(obj_shadow_mantle_enemy))
    exit;
if (global.shadow_mantle_losses == 0 && obj_shadow_mantle_enemy.speedrun >= 0 && obj_shadow_mantle_enemy.speedrun < 5)
{
    if (obj_shadow_mantle_enemy.speedrun == 0)
        enemy = instance_create(256, 128, obj___);
    if (obj_shadow_mantle_enemy.speedrun == 1)
        enemy = instance_create(448, 160, obj___);
    if (obj_shadow_mantle_enemy.speedrun == 2)
        enemy = instance_create(384, 256, obj___);
    if (obj_shadow_mantle_enemy.speedrun == 3)
        enemy = instance_create(192, 192, obj___);
    if (obj_shadow_mantle_enemy.speedrun == 4)
        enemy = instance_create(320, 192, obj___);
    enemy.move_type = move_type;
    obj_shadow_mantle_enemy.speedrun++;
}
else
{
    var b = irandom(instance_number(obj_spawn_pos) - 1);
    enemy = instance_create(pos[b].x - 11, pos[b].y - 10, obj___);
    enemy.move_type = move_type;
}
if (shadow_mantle_move == true)
{
    obj_shadow_mantle_enemy.targetx = enemy.x;
    obj_shadow_mantle_enemy.targety = enemy.y - 32;
    obj_shadow_mantle_enemy.movestyle = "to point and stop";
    with (obj_shadow_mantle_enemy)
    {
        if (x < targetx)
            sprite_index = spr_shadow_mantle_side_r;
        else
            sprite_index = spr_shadow_mantle_side_l;
    }
}
snd_play(snd_wing);
instance_destroy();
with (obj_spawn_pos)
    instance_destroy();
