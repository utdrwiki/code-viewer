speed = 0;
friction = 0;
fall_speed = -9;
hurtcon = 1;
sprite_index = spr_susiezilla_hurt;
if (image_xscale == 2)
    px = -4;
else
    px = 4;
image_index = 0;
instance_create(x, y, obj_shake);
bounce_count = 0;
slide = true;
