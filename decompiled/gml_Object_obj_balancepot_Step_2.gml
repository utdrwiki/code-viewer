image_xscale = 2
image_yscale = 2
if (falling == -2)
{
    visible = false
    if (obj_mainchara.y >= 240 && global.interact == 0)
    {
        y = (__view_get((1 << 0), 0) - 80)
        visible = true
        falling = -1
    }
}
if (falling == -1)
{
    global.interact = 1
    x = (obj_mainchara.x + 20)
    if (y <= obj_mainchara.y)
        y += 10
    else
    {
        global.interact = 0
        global.facing = 0
        falling = 0
        y = (obj_mainchara.y + 5)
        snd_play(snd_item)
    }
}
if (falling == 0 && global.interact == 0)
{
    nowx = x
    nowy = y
    x = (obj_mainchara.x + 20)
    y = (obj_mainchara.y + 5)
    if (inittimer < 1)
        inittimer += 0.02
    if (init == true)
    {
        if (nowx != x)
        {
            balancespeed += ((x - nowx) / 16)
            balance += ((x - nowx) / 4)
        }
        if (abs(balancespeed) < 3)
            balancespeed += (balance / 192)
        balance += ((balance / 64) * inittimer)
        balance += ((balancespeed / 2) * inittimer)
        image_angle = balance
    }
    init = true
    if (abs(balance) >= 90)
    {
        falling = 1
        remy = y
    }
}
if (falling == 1)
{
    global.interact = 1
    global.facing = 0
    vspeed += 2
    balance += (balance / 16)
    image_angle = balance
    if (balance < 0)
        hspeed += 1
    if (balance > 0)
        hspeed -= 1
    if (y >= (remy + 60))
    {
        snd_play(choose(164, 165))
        brokenpot = scr_dark_marker(x, y, sprite_index)
        brokenpot.image_index = 1
        brokenpot.depth = 800000
        falling = 2
        timer = 0
        if (global.flag[385] == 0)
            global.flag[385] = 1
        visible = false
        instance_destroy()
    }
}
if (falling == 3)
{
    vspeed = 0
    x = (obj_mainchara.x + 20)
    y = (obj_mainchara.y + 10)
}
