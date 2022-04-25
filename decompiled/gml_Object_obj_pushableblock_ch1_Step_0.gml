scr_depth_ch1()
if (movecourse == 1)
{
    if (movedir == 1)
        x += 8
    if (movedir == 0)
        y += 8
    if (movedir == 2)
        y -= 8
    if (movedir == 3)
        x -= 8
    sprite_index = spr_npc_block_ch1
    movetimer += 1
    if (movetimer >= 5)
    {
        movetimer = 0
        global.interact = 0
        movecourse = 0
    }
}
if (myinteract == 3)
{
    if (instance_exists(mydialoguer) == 0)
    {
        global.interact = 0
        myinteract = 0
        with (obj_mainchara_ch1)
            onebuffer = 5
    }
}
