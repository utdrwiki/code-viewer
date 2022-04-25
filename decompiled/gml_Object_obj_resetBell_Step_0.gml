if (play == true)
{
    global.interact = 1
    timer--
    if (timer == 0)
    {
        global.facing = 0
        global.interact = 0
        play = false
    }
}
