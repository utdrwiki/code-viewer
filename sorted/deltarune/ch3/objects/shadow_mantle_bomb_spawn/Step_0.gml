var b = irandom(instance_number(obj_spawn_pos) - 1);
bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
bullet.depth = depth - 5;
bullet.targetx = pos[b].x + 4;
bullet.targety = pos[b].y + 16;
instance_destroy();
with (obj_spawn_pos)
    instance_destroy();
