if instance_exists(obj_sneo_crusher)
    depth = obj_sneo_crusher.depth
if (image_yscale < 0 && init == false)
{
    image_yscale -= 2
    if (image_yscale < -16.125)
    {
        image_yscale = -16.125
        init = true
        hspeed = obj_spamton_neo_enemy.crusher_start_hspeed
    }
    return;
}
if (image_yscale > 0 && init == false)
{
    image_yscale += 2
    if (image_yscale > 16.125)
    {
        image_yscale = 16.125
        init = true
        hspeed = obj_spamton_neo_enemy.crusher_start_hspeed
    }
    return;
}
hspeed -= haccel
if (vbounce == 1 && column == 0)
{
    if (y > bottomy)
    {
        y = (bottomy - 1)
        vspeed = (-abs(vspeed))
    }
    if (y < topy)
    {
        y = (topy + 1)
        vspeed = abs(vspeed)
    }
}
if (column == 1)
{
    haccel = 0.3
    siner++
    y -= (sin((siner / 4)) * amplitude)
}
