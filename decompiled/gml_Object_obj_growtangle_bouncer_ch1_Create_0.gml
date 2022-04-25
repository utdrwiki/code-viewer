image_speed = 0
image_xscale = 1.96
image_yscale = 1.96
initdir = choose(45, 135, 225, 315)
direction = initdir
speed = 0.1
active = true
if instance_exists(obj_growtangle_ch1)
{
    x = obj_growtangle_ch1.x
    y = obj_growtangle_ch1.y
    obj_growtangle_ch1.megakeep = 1
}
timer = 0
type = 0
con = 0
xx = __view_get((0 << 0), 0)
yy = __view_get((1 << 0), 0)
lx = (140 + xx)
rx = (480 + xx)
ux = (0 + yy)
dx = (320 + yy)
fadein = 0
spikecount = 0
inv = 60
timepoints = 0
grazepoints = 3
target = 0
damage = 50
grazed = false
grazetimer = 0
minitimer = 0
bumpnoise = false
timerbonus = 0
wall_destroy = 0
