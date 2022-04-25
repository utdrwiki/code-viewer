wallcheck = 0
press_l = 0
press_r = 0
press_d = 0
press_u = 0
bkx = 0
bky = 0
bkxy = 0
jelly = 2
if left_h_ch1()
    press_l = 1
if right_h_ch1()
    press_r = 1
if up_h_ch1()
    press_u = 1
if down_h_ch1()
    press_d = 1
px = 0
py = 0
if (press_r == 1)
    px = wspeed
if (press_l == 1)
    px = (-wspeed)
if (press_d == 1)
    py = wspeed
if (press_u == 1)
    py = (-wspeed)
xmeet = 0
ymeet = 0
xymeet = 0
if place_meeting((x + px), (y + py), obj_battlesolid_ch1)
    xymeet = 1
if place_meeting((x + px), y, obj_battlesolid_ch1)
{
    if place_meeting((x + px), y, obj_battlesolid_ch1)
    {
        g = wspeed
        while (g > 0)
        {
            mvd = 0
            if (press_d == 0 && (!(place_meeting((x + px), (y - g), obj_battlesolid_ch1))))
            {
                y -= g
                py = 0
                break
            }
            else if (press_u == 0 && mvd == 0 && (!(place_meeting((x + px), (y + g), obj_battlesolid_ch1))))
            {
                y += g
                py = 0
                break
            }
            else
            {
                g -= 1
                continue
            }
        }
    }
    xmeet = 1
    bkx = 0
    if (px > 0)
    {
        i = px
        while (i >= 0)
        {
            if (!(place_meeting((x + i), y, obj_battlesolid_ch1)))
            {
                px = i
                bkx = 1
                break
            }
            else
            {
                i -= 1
                continue
            }
        }
    }
    if (px < 0)
    {
        i = px
        while (i <= 0)
        {
            if (!(place_meeting((x + i), y, obj_battlesolid_ch1)))
            {
                px = i
                bkx = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
    }
    if (bkx == 0)
        px = 0
}
if place_meeting(x, (y + py), obj_battlesolid_ch1)
{
    ymeet = 1
    bky = 0
    if place_meeting(x, (y + py), obj_battlesolid_ch1)
    {
        g = wspeed
        while (g > 0)
        {
            mvd = 0
            if (press_r == 0 && (!(place_meeting((x - g), (y + py), obj_battlesolid_ch1))))
            {
                x -= g
                px = 0
                break
            }
            else if (mvd == 0 && press_l == 0 && (!(place_meeting((x + g), (y + py), obj_battlesolid_ch1))))
            {
                x += g
                px = 0
                break
            }
            else
            {
                g -= 1
                continue
            }
        }
    }
    if (py > 0)
    {
        i = py
        while (i >= 0)
        {
            if (!(place_meeting(x, (y + i), obj_battlesolid_ch1)))
            {
                py = i
                bky = 1
                break
            }
            else
            {
                i -= 1
                continue
            }
        }
    }
    if (py < 0)
    {
        i = py
        while (i <= 0)
        {
            if (!(place_meeting(x, (y + i), obj_battlesolid_ch1)))
            {
                py = i
                bky = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
    }
    if (bky == 0)
        py = 0
}
if place_meeting((x + px), (y + py), obj_battlesolid_ch1)
{
    xymeet = 1
    bkxy = 0
    i = px
    j = py
    while (j != 0 || i != 0)
    {
        if (!(place_meeting((x + i), (y + j), obj_battlesolid_ch1)))
        {
            px = i
            py = j
            bkxy = 1
        }
        else
        {
            if (abs(j) >= 1)
            {
                if (j > 0)
                    j -= 1
                if (j < 0)
                    j += 1
            }
            else
                j = 0
            if (abs(i) >= 1)
            {
                if (i > 0)
                    i -= 1
                if (i < 0)
                    i += 1
            }
            else
                i = 0
            continue
        }
    }
    if (bkxy == 0)
    {
        px = 0
        py = 0
    }
}
if ((x + px) >= ((__view_get((0 << 0), 0) + 640) - sprite_width))
    px = (((__view_get((0 << 0), 0) + 640) - sprite_width) - x)
if ((x + px) <= 0)
    px = (-x)
if ((y + py) <= 0)
    py = (-y)
if ((y + py) >= (((__view_get((1 << 0), 0) + 320) - sprite_height) + boundaryup))
    py = ((((__view_get((1 << 0), 0) + 320) - sprite_height) - y) + boundaryup)
x += px
y += py
if (dmgnoise == true)
{
    dmgnoise = false
    snd_stop_ch1(snd_hurt1_ch1)
    snd_play_ch1(snd_hurt1_ch1)
}
global.inv -= 1
if (global.inv > 0)
    image_speed = 0.25
else
{
    image_speed = 0
    image_index = 0
}
global.heartx = ((x + 2) - __view_get((0 << 0), 0))
global.hearty = ((y + 2) - __view_get((1 << 0), 0))
