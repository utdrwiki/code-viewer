if (init == 0)
{
    init = 1;
    var lifetime = 8;
    scr_lerpvar("image_index", 0, lastframe, lifetime, 3, "out");
    scr_doom(id, lifetime);
}
