for (i = 0; i < count; i++)
{
    d = instance_create(x, y, obj_confetti_overworld);
    d.direction = random_range(direction - 20, direction + 20);
    d.height = height;
    d.miny = miny;
    d.maxy = maxy;
    d.topdrop = topdrop;
    d.bottomdrop = bottomdrop;
    d.maxDepth = maxDepth;
    d.fade = fade;
    if (start_depth != -1)
        d.start_depth = start_depth;
}
instance_destroy();
