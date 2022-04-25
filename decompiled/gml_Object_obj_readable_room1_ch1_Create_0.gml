myinteract = 0
image_speed = 0
read = 0
tempvar = 0
if (room == room_dark3a_ch1)
{
    if (global.flag[100] == 0)
    {
        shine = scr_dark_marker_ch1((x + 10), (y + 6), spr_shine_ch1)
        shine.image_speed = 0.1
    }
}
