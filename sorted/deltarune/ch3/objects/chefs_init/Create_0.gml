depth = 10000;
instance_create(0, 0, obj_chefs_game);
instance_create(0, 0, obj_chefs_kris);
instance_create(140, 200, obj_chefs_susie);
instance_create(540, 200, obj_chefs_ralsei);
instance_create(0, 640, obj_chefs_customer_spawner);
instance_create(574, 210, obj_chefs_spawner);
with (instance_create(75, 190, obj_chefs_spawner))
{
    alarm[0] = 270;
    mode = 1;
}
