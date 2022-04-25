btimer = 99
timermax = 12
difficulty = 1
type = 1
joker = 0
side = 1
damage = 100
grazepoints = 1
timepoints = 1
inv = 60
grazed = false
grazetimer = 0
target = 0
made = 0
special = false
miny = 150
maxy = 280
if instance_exists(obj_growtangle_ch1)
{
    miny = (obj_growtangle_ch1.y - (obj_growtangle_ch1.sprite_height / 2))
    maxy = (obj_growtangle_ch1.y + (obj_growtangle_ch1.sprite_height / 2))
}
ratio = 1
if (scr_monsterpop_ch1() == 2)
    ratio = 1.6
if (scr_monsterpop_ch1() == 3)
    ratio = 2.3
