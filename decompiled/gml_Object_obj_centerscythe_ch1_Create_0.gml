grazed = false
grazepoints = 3
timepoints = 2
target = 0
inv = 120
damage = 124
grazetimer = 0
active = false
image_alpha = 0
image_xscale = 1
image_yscale = 1
rotspeed = 0
insanity = 1
chasecon = 1
chasetimer = 0
centerx = 320
centery = 120
if instance_exists(obj_battlesolid_ch1)
{
    centerx = obj_battlesolid_ch1.x
    centery = obj_battlesolid_ch1.y
}
radius = 150
sine = 0
sinespeed = 1.4
dir = random(70)
dirspeed = (1.5 * choose(1, -1))
un = 0
scythetimer = -5
scythesidex = 1
swingnoise = 0
noisebuffer = 0
type = 0
if instance_exists(obj_dbulletcontroller_ch1)
{
    if (obj_dbulletcontroller_ch1.type == 76)
        type = 1
}
king = 0
if (type == 1)
{
    image_xscale = 1
    image_yscale = 1
    insanity = 0
    sinespeed = 1.3
    scythesidex = choose(1, -1)
}
if (instance_number(obj_centerscythe_ch1) == 1)
{
    king = 1
    x = (centerx - radius)
    y = centery
    s2 = instance_create_ch1((centerx + radius), centery, obj_centerscythe_ch1)
    with (s2)
    {
        sine = 0
        dir = 180
        un = 1
    }
    s3 = instance_create_ch1(centerx, (centery - radius), obj_centerscythe_ch1)
    with (s3)
    {
        sine = 0
        dir = 90
        un = 0
    }
    s4 = instance_create_ch1(centerx, (centery + radius), obj_centerscythe_ch1)
    with (s4)
    {
        sine = 0
        dir = 270
        un = 1
    }
    obj_centerscythe_ch1.mydir = dir
    obj_centerscythe_ch1.sinespeed = sinespeed
    obj_centerscythe_ch1.dirspeed = dirspeed
    obj_centerscythe_ch1.insanity = insanity
    with (obj_centerscythe_ch1)
    {
        if (dir != mydir)
            dir += mydir
        x = (centerx - lengthdir_x(radius, dir))
        y = (centery - lengthdir_y(radius, dir))
    }
}
wall_destroy = 0
