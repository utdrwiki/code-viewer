if (init == true)
{
    if i_ex(body_obj)
    {
        with (body_obj)
            instance_destroy()
    }
    if i_ex(target)
    {
        with (target)
            visible = true
        target.x = endx
        target.y = endy
    }
}
