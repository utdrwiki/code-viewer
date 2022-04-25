myinteract = 0
talked = false
image_speed = 0
image_xscale = 2
image_yscale = 2
con = 0
scr_depth()
image_speed = 0
type = 0
siner = 0
active = false
emotion = 0
beanie[0] = false
beanie[1] = false
beanie[2] = false
if (global.chapter == 1)
{
    if (x < 350)
    {
        beanie[1] = false
        beanie[0] = true
        type = 1
    }
    if (x < 250)
    {
        beanie[0] = true
        beanie[2] = true
        type = 2
    }
    if (x < 150)
    {
        beanie[0] = true
        beanie[1] = true
        beanie[2] = true
        type = 3
    }
}
if (global.chapter == 2 && room == room_dw_castle_dojo)
{
    beanie[1] = false
    beanie[0] = true
    type = 0
}
