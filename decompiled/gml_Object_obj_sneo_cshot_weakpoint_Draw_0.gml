if flash
{
    d3d_set_fog(true, c_white, 0, 1)
    draw_self()
    d3d_set_fog(false, c_black, 0, 0)
    flash = false
}
else
    draw_self()
