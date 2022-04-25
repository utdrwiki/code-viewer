if (myinteract == 3)
{
    if (talked == false)
    {
        timer++
        if (timer >= 15)
        {
            timer = 0
            global.interact = 0
            myinteract = 0
            with (obj_mainchara)
                onebuffer = 5
        }
    }
    else if (i_ex(mydialoguer) == 0)
    {
        global.interact = 0
        myinteract = 0
        with (obj_mainchara)
            onebuffer = 5
    }
}
image_index = opened
