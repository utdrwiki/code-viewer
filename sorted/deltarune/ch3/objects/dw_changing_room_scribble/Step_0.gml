if (show_scribble)
{
    if (global.flag[20] == 0)
    {
        show_scribble = false;
        instance_destroy();
    }
}
if (global.flag[20] == 0)
    exit;
if (global.flag[20] == 1 && !show_scribble)
    show_scribble = true;
