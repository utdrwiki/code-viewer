myinteract = 0
talked = false
image_speed = 0
image_xscale = 2
image_yscale = 2
con = 0
if (global.flag[215] == 1)
    instance_destroy()
else
{
    pwall = instance_create_ch1((x + 10), (y - 20), obj_soliddark_ch1)
    pwall.image_yscale = 3
}
lecturecon = 0
if (global.plot >= 42 || global.flag[211] == 3)
    lecturecon = 100
scr_depth_ch1()
