if (state == "capture")
{
    array_push(subjects, other.id);
    if (other.image_index == 0)
    {
        with (obj_monsterparent)
            scr_mercyadd(myself, 100);
    }
    else
    {
        with (obj_monsterparent)
            scr_mercyadd(myself, 50);
    }
}
else
{
    with (other)
        event_user(1);
}
