var impactfx = instance_create(x, y, obj_animation);
impactfx.sprite_index = spr_attack_slap2;
hspeed = choose(2, -1, -2, 1);
vspeed = -10 - random(3);
gravity = 2;
savey = y + 20;
