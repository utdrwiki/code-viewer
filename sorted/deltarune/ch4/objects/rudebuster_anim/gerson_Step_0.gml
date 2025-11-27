if (i_ex(target))
{
    if (t == 14)
    {
        snd_stop(snd_rudebuster_swing);
        snd_play(snd_rudebuster_swing);
        blast = instance_create(x - 132, y + 14, obj_rudebuster_bolt);
        blast.caster = caster;
        blast.target = target;
        blast.damage = 1950 + irandom(100);
        blast.star = star;
        blast.sprite_index = spr_rudebuster_beam_green;
        blast.speedmax = 44;
        global.faceaction[1] = 0;
    }
}
if (t >= 32)
{
    obj_titan_enemy.gerson.visible = 1;
    obj_titan_enemy.gerson.sprite_index = 0;
    obj_titan_enemy.gerson.sprite_index = spr_gerson_idle;
    obj_titan_enemy.gerson.image_speed = 0.25;
    obj_titan_enemy.gerson.x = obj_titan_enemy.gerson.xstart;
    obj_titan_enemy.gerson.y = obj_titan_enemy.gerson.ystart;
    instance_destroy();
}
t++;
