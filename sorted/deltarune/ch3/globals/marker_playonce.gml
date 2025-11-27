function scr_marker_playonce(arg0, arg1, arg2)
{
    ___animonce = instance_create(arg0, arg1, obj_marker_animateOnce);
    ___animonce.sprite_index = arg2;
    return ___animonce;
}

function scr_dark_marker_playonce(arg0, arg1, arg2)
{
    ___animonce = instance_create(arg0, arg1, obj_marker_animateOnce);
    ___animonce.sprite_index = arg2;
    scr_darksize(___animonce);
    return ___animonce;
}
