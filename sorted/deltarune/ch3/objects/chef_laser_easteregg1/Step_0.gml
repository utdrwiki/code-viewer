timer++;
if (timer == timermax)
{
    anim = instance_create(x, y, obj_animation);
    anim.sprite_index = spr_realisticexplosion;
    anim.image_alpha = 0;
    snd_play_x(snd_explosion_firework_bc, 0.4, 1);
    instance_create(x, y, obj_shake);
    instance_destroy();
}
