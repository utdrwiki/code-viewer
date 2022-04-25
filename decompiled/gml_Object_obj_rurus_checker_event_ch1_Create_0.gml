con = 0
if (global.plot >= 175)
{
    checkernpc = instance_create_ch1(x, y, obj_npc_room_animated_ch1)
    instance_destroy()
}
else
    con = 1
