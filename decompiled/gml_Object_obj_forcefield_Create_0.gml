myinteract = 0
if (image_xscale < 2)
    image_xscale = 2
if (image_yscale < 2)
    image_yscale = 2
alarm[3] = 1
siner = 0
basic = 1
disable = 0
f = 2
sold = 0
black_override = 0
stayVisible = false
skip = false
ignorealpha = 0
if (room != room_dw_city_mice2)
    depth = 900000
if (disableflag > 0)
{
    if (global.flag[disableflag] == 1)
    {
        instance_destroy()
        return;
    }
}
if (disableplot > 0)
{
    if (global.plot >= disableplot)
    {
        instance_destroy()
        return;
    }
}
if (global.chapter == 2)
{
    if (room == room_dw_cyber_musical_door)
    {
        visible = false
        instance_create((x + (sprite_width / 2)), y, obj_beatbullet_wall)
    }
    if (room == room_dw_city_mice2)
    {
        stayVisible = true
        depth = 5000
        if (global.flag[368] == 1)
            instance_destroy()
    }
    if (room == room_dw_mansion_b_central)
        stayVisible = true
}
