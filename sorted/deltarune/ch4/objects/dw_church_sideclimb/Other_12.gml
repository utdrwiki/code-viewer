if (!i_ex(r2leavetopentrance))
{
    r2leavetopentrance = instance_create(1320, 520, obj_climbstartertrig);
    r2leavetopentrance.exitmarkerflag = "r2leavetop";
    r2leavetopentrance.dontmove = true;
    r2leavebottomentrance = instance_create(1320, 1280, obj_climbstartertrig);
    r2leavebottomentrance.exitmarkerflag = "r2leavebottom";
    r2leavebottomentrance.dontmove = true;
    layer_set_visible("MIZZLE_SLIDE", true);
    layer_set_visible("MIZZLE_SLIDE_BG", true);
    slide = instance_create(1400, 520, obj_darkslide_new);
    scr_size(2, 40, slide);
    safe_delete(slideblock);
    layer_set_visible("TILES_CLIMBSHORT2", 1);
}
