if (left_p_ch1() && turning == 0 && page > -1)
{
    turning = -1
    turnpage = page
    siner = 0
}
if (right_p_ch1() && turning == 0 && page < 6)
{
    turning = 1
    turnpage = page
    siner = 0
}
if button2_p_ch1()
{
    if (global.interact == 1)
        global.interact = 0
    instance_destroy()
}
