global.interact = 3
instance_create_ch1(0, 0, obj_fadeout_ch1)
mus_volume_ch1(global.currentsong[1], 0, 14)
if (touched == false)
{
    alarm[3] = 14
    alarm[2] = 15
    touched = true
}
