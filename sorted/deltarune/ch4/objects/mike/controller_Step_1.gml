if (microphone_volume >= 100)
{
    mic_buff++;
    if (mic_buff > 120)
    {
        mic_buff = 0;
        mic_reset();
    }
}
else
{
    mic_buff = 0;
}
if (scr_debug())
{
    if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("0")))
    {
        scr_debug_print("mic reset");
        mic_reset();
    }
}
speedx = lerp(speedx, mx - prevx, 0.75);
speedy = lerp(speedy, my - prevy, 0.75);
prevx = mx;
prevy = my;
