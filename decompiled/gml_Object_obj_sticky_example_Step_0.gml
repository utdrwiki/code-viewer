if (button1_p() && stuck == true)
{
    stuck = false
    scr_stickto_stop()
    stuckbuffer = 8
}
stuckbuffer--
