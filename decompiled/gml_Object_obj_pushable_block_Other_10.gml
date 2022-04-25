if (global.interact == 0)
{
    movedir = global.facing
    ix = 0
    iy = 0
    confirm = true
    if (movedir == 0)
    {
        ix = (x + 2)
        iy = (y + ht)
    }
    if (movedir == 1)
    {
        ix = (x + wd)
        iy = (y + 2)
    }
    if (movedir == 2)
    {
        ix = (x + 2)
        iy = ((y - ht) + 5)
    }
    if (movedir == 3)
    {
        ix = ((x - wd) + 5)
        iy = (y + 2)
    }
    if collision_rectangle(ix, iy, (ix + 15), (iy + 15), obj_solidblock, 0, 1)
        confirm = false
    if collision_rectangle(ix, iy, (ix + 15), (iy + 15), obj_interactablesolid, 0, 1)
        confirm = false
    if collision_rectangle(ix, iy, (ix + 15), (iy + 15), obj_solidenemy, 0, 1)
        confirm = false
    snd_play(snd_noise)
    if (confirm == true)
    {
        global.interact = 1
        movecourse = 1
        movetimer = 0
    }
}
