event_inherited();
if (dialogue_active && !d_ex())
{
    dialogue_active = false;
    global.interact = 0;
    with (obj_homealone_heart)
        onebuffer = 5;
    alarm[10] = 1;
}
