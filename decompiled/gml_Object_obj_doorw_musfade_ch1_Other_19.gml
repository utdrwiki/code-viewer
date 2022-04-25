global.interact = 3
mus_volume_ch1(global.currentsong[1], 0, 14)
instance_create_ch1(0, 0, obj_fadeout_ch1)
if (touched == false)
{
    alarm[2] = 15
    alarm[3] = 14
    touched = true
}
