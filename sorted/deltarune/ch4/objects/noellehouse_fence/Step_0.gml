if (open_fence)
{
    is_closed = false;
    open_fence = false;
    alarm[0] = 1;
}
if (close_fence)
{
    is_closed = false;
    close_fence = false;
    alarm[1] = 1;
}
if (hide_fence)
{
    hide_fence = false;
    if (fence_left != -4)
    {
        if (fence_left.visible == 1)
            fence_left.visible = 0;
    }
}
