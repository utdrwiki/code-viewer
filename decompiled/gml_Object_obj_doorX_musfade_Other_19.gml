global.interact = 3
mus_volume(global.currentsong[1], 0, 14)
instance_create(0, 0, obj_fadeout)
if (touched == false)
{
    alarm[2] = 15
    alarm[3] = 14
    event_user(8)
    touched = true
}
