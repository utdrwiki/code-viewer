image_xscale = 2
image_yscale = 2
image_speed = 0.2
good = 1
offing = 0
if (instance_number(object_index) == 1)
{
    tt = instance_create_ch1(x, y, obj_throwtarget_ch1)
    tt.depth = (depth + 1)
    with (tt)
    {
        offing = 0
        good = 0
        sprite_index = spr_checkers_idle_crownless_ch1
    }
}
con = 0
