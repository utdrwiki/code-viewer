if (!instance_exists(target))
{
    if (init && auto_cleanup)
        instance_destroy();
    exit;
}
else if (!init)
{
    if (target.sprite_width == 0 || target.sprite_height == 0)
        exit;
    init = true;
    width = max(abs(target.sprite_width), 1);
    height = max(abs(target.sprite_height), 1);
}
if (match_depth)
    depth = target.depth + depth_offset;
