timer++;
y = (ystart - 2) + random(4);
if ((timer % 2) == 0 && timer > 60)
{
    anim = instance_create(130 + irandom(330), 54 + irandom(100), obj_animation);
    anim.sprite_index = spr_realisticexplosion;
    anim.image_alpha = 0;
    snd_play_x(snd_explosion_firework_bc, 0.4, 1);
    instance_create(x, y, obj_shake);
}
if (timer > 70)
{
    image_xscale = lerp(2, 8, (timer - 70) / 10);
    image_yscale = lerp(2, 8, (timer - 70) / 10);
}
if (timer == timermax)
    instance_destroy();
