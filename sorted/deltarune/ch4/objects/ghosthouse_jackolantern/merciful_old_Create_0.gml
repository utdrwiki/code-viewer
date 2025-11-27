scr_bullet_init();
damage = 0;
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = false;
mask_index = spr_no_mask;
ticks = 0;
completed_ticks = 0;
feared = false;
run_threshold = 5;
targ_x = -1;
targ_y = -1;
last_tx = -1;
last_ty = -1;
mercy_chain = 0;
mercy_cooldown = 0;
reset_timer = 0;
light_distance = 75;
face_timer = 0;
quick_start = false;
timer = 0;
scare_con = 0;
scream_loop = -4;
with (obj_jackenstein_enemy)
{
    if (obj_jackenstein_enemy.spooked)
    {
        light_distance = 65;
        other.quick_start = true;
    }
}
head_sprite = spr_guywhoappearswhenyouhavetakentoolongbutgotanastysurprise;
mouth_sprite = 1809;
