if (global.flag[12] == 0)
{
    __view_set((0 << 0), camera, (mycamerax + (shakex * shakesign)))
    __view_set((1 << 0), camera, (mycameray + (shakey * shakesign)))
}
if (permashake == false)
{
    if (shakex > 0)
        shakex -= 1
    if (shakey > 0)
        shakey -= 1
}
shakesign = (-shakesign)
alarm[0] = shakespeed
if (shakex == 0 && shakey == 0)
    instance_destroy()
