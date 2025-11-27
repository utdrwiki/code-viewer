draw_self();
if (flashtimer > 0)
{
    flashtimer--;
    gpu_set_fog(1, c_white, 0, 0);
    draw_self();
    gpu_set_fog(0, c_white, 0, 0);
}
