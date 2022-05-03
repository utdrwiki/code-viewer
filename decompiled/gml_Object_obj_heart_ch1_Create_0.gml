global.sp = 4
wspeed = global.sp
image_speed = 0
fly = 0
darken = true
darkamt = 0
dmgnoise = false
instance_create_ch1((x + 10), (y + 10), obj_grazebox_ch1)
boundaryup = 0
disableslow = 0
if button2_h_ch1()
    disableslow = 1
