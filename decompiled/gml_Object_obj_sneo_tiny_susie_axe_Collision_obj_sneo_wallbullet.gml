if (other.active == false)
    return;
if (other.destroyable == true)
{
    instance_destroy()
    snd_play(snd_damage)
    with (other)
        instance_destroy()
}
