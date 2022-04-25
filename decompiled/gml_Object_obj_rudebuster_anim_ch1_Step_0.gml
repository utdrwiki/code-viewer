image_index = (t / 2)
if (t >= 28)
{
    with (obj_herosusie_ch1)
        visible = true
    instance_destroy()
}
if instance_exists(target)
{
    if (t == 10)
    {
        snd_play_ch1(snd_rudebuster_swing_ch1)
        blast = instance_create_ch1((x + 40), (y + 30), obj_rudebuster_bolt_ch1)
        blast.caster = caster
        blast.target = target
        blast.damage = damage
        blast.star = star
        if (red == 1)
            blast.red = 1
    }
}
t += 1
