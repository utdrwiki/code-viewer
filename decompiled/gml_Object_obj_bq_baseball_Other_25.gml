if (o_boxingcontroller.punchcon > 0 && o_boxingcontroller.punchcon <= 4)
    return;
if (o_boxingcontroller.invincible == 1)
    return;
baseball_hitbox = instance_create(o_boxingcontroller.x, (o_boxingcontroller.y - 60), o_boxing_hitbox)
with (baseball_hitbox)
{
    hit_jumping = 0
    give_hurt = (22 / f)
    timer = (5 / f)
    damage = 20
    image_yscale = 4
    image_xscale = 4
}
instance_destroy()
