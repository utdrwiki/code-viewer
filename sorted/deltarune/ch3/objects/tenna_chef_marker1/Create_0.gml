timer = 0;
type = 0;
siner = 0;
sprite_index = spr_tenna_dance_cabbage_small_hat;
image_xscale = 2;
image_yscale = 2;
x -= 20;
y -= 24;
flamecon = 1;
flamealph = 0.8;
thickness = 2;
wave_siner = 0;
flamesiner = 0;
flameya = -100;
wave_maxa = sprite_get_height(spr_gameshow_stage_fire);
wave_maxb = sprite_get_height(spr_gameshow_stage_fire);
base_y_pos = -12;
if ((i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity) || (i_ex(obj_tenna_enemy) && obj_tenna_enemy.completedchefwithouttakingdamage))
    flameya = base_y_pos;
else
    scr_lerpvar("flameya", flameya, base_y_pos, 40, 2, "out");
