function scr_bulletparent_count()
{
    var count = 0;
    with (obj_bulletparent)
    {
        if (object_index == obj_bulletparent)
            count++;
    }
    return count;
}
