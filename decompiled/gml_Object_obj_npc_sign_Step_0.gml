if (myinteract == 3 && skip == false)
{
    if (!d_ex())
    {
        global.interact = 0
        myinteract = 0
        with (obj_mainchara)
            onebuffer = 5
        if (doafter != 0)
            docon = 1
    }
}
if (docon == 1 && (!d_ex()))
{
}
if (130 && global.plot >= 75 && sprite_index == spr_alley_boxes)
    sprite_index = spr_alley_boxes_fewer
