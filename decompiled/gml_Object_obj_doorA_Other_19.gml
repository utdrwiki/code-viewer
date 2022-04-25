with (obj_overworldbulletparent)
    active = false
global.interact = 3
instance_create(0, 0, obj_fadeout)
if (touched == false)
{
    alarm[2] = 8
    event_user(8)
    touched = true
}
