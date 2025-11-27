length = 8;
spacing = 14;
delay = 1;
fixate = -4;
t = 0;
f = 0.04;
a = 160;
for (var i = 0; i < length; i++)
{
    flame[i] = instance_create(x, y - (spacing * i), obj_chefs_fire);
    flame[i].depth = -10;
    flame[i].flamewhip = true;
    if (i == 0)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_1;
    if (i == 1)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_1;
    if (i == 2)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_2;
    if (i == 3)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_2;
    if (i == 4)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_3;
    if (i == 5)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_3;
    if (i == 6)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_4;
    if (i == 7)
        flame[i].sprite_index = spr_tenna_grasp_chef_nose_5;
}
