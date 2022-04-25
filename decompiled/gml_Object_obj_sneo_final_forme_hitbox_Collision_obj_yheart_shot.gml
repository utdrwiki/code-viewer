with (other)
    event_user(0)
if instance_exists(obj_sneo_final_forme)
{
    if ((obj_sneo_final_forme.destroyable && obj_sneo_final_forme.state == 0) || (obj_sneo_final_forme.state == 1 && obj_sneo_final_forme.formtimer < 30))
    {
    }
    else
        return;
}
snd_play(snd_damage)
if instance_exists(obj_sneo_final_forme)
{
    with (obj_sneo_final_forme)
        hurtalpha = 1
    if (destroyable == true)
    {
        if (other.big == 0)
        {
            parent.x += 7
            parent.formtimer += 5
        }
        else
        {
            parent.pushback = 13
            parent.formtimer += 13
        }
    }
}
