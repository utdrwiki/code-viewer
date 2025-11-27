if (!instance_exists(obj_heart))
    instance_destroy();
buffer = 0;
for (var i = 0; i < 5; i++)
{
    last_x[i] = 0;
    last_y[i] = 0;
}
last_x[0] = x;
last_y[0] = y - 4;
thrown = 1;
throw_timer = 0;
throwing = 0;
score_buffer = 3;
image_speed = 0.5;
friction = 0.1;
grab_snd = -1;
wait = 0;
wait_max = 30;
xx = x;
yy = y;
action = 0;
xscale = 1;
can_score = 1;
image_xscale = 1;
image_yscale = image_xscale;
sprite_mask = sprite_index;
sprite_index = spr_mike_cat_dance;
level = 0;
fever_timer = -1;
