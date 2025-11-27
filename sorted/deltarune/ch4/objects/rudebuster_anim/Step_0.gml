if (init == 0 && i_ex(obj_titan_enemy) && obj_titan_enemy.acting == 1.12)
{
    init = 1;
    anim = instance_create(obj_titan_enemy.gerson.x + 0, obj_titan_enemy.gerson.y, obj_rudebuster_anim_gerson);
    anim.target = target;
}
image_index = t / 2;
if (!dualbuster)
{
    if (i_ex(target))
    {
        if (t == 10)
        {
            snd_play(snd_rudebuster_swing);
            blast = instance_create(x + 40, y + 30, obj_rudebuster_bolt);
            blast.caster = caster;
            blast.target = target;
            blast.damage = damage;
            blast.star = star;
            if (red == 1)
                blast.red = 1;
        }
    }
    if (t >= 28)
    {
        var makevis = true;
        if (global.chapter == 4)
        {
            with (obj_jackenstein_enemy)
                makevis = false;
        }
        if (makevis)
        {
            with (obj_herosusie)
                visible = 1;
        }
        instance_destroy();
    }
}
if (dualbuster)
{
    if (i_ex(target))
    {
        if (t == 14)
        {
            snd_play(snd_rudebuster_swing);
            blast = instance_create(x + 40, y + 30, obj_rudebuster_bolt);
            blast.caster = caster;
            blast.target = target;
            blast.damage = damage + 500;
            blast.star = star;
            if (red == 1)
                blast.red = 1;
        }
    }
    if (t >= 32)
    {
        with (obj_herosusie)
            visible = 1;
        instance_destroy();
    }
}
t++;
