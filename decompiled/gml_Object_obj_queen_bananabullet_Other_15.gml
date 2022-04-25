if (active == true)
{
    if bufferstate
        active = false
    else
    {
        scr_bullet_heal(damage)
        instance_destroy()
    }
}
