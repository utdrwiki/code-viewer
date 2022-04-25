if (x <= (camerax() - 200))
    cleanup = 1
if crash
{
    cleanup_timer--
    if (cleanup_timer <= 0)
    {
        crash = 0
        cleanup = 1
    }
}
if cleanup
{
    cleanup = 0
    if (explosion != self)
        instance_destroy(explosion)
    instance_destroy()
}
