function scr_jump_to_point(arg0, arg1, arg2, arg3, arg4 = 0)
{
    var ___jump = scr_jump_to_point_sprite(arg0, arg1, arg2, arg3, 0, 0);
    with (___jump)
    {
        trackalpha = arg4;
        trackblend = arg4;
        trackindex = arg4;
        tracksprite = arg4;
        trackangle = arg4;
    }
    return ___jump;
}
