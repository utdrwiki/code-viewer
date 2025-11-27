if (!i_ex(r1leavetopentrance))
{
    r1leavetopentrance = instance_create(560, 1400, obj_climbstartertrig);
    r1leavetopentrance.exitmarkerflag = "r1leavetop";
    r1leavetopentrance.dontmove = true;
    r1leavebottomentrance = instance_create(560, 2000, obj_climbstartertrig);
    r1leavebottomentrance.exitmarkerflag = "r1leavebottom";
    r1leavebottomentrance.dontmove = true;
    layer_set_visible("TILES_CLIMBSHORT1", 1);
}
