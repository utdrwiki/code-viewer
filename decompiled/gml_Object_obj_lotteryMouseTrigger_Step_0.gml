timer++
if (freezeplayer == 1)
{
    global.interact = 1
    if ((!instance_exists(obj_holemouse_lottery)) && timer > 5)
    {
        freezeplayer = 0
        global.interact = 0
    }
}
