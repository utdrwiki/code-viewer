active = false
stepped = false
stepbuffer = 0
image_speed = 0.2
image_xscale = 2
image_yscale = 2
if instance_exists(obj_glowtilepuzz_ch1)
{
    obj_glowtilepuzz_ch1.tempid = id
    with (obj_glowtilepuzz_ch1)
    {
        tileid[tiletotal] = tempid
        tiletotal += 1
    }
}
