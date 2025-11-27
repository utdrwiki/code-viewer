if (screamsound != -4)
{
    snd_stop(screamsound);
    snd_free(screamsound);
}
with (obj_lightsource_heartlight)
    biggerrad = other.biggerrad;
scr_debug_delete_persistent("state");
