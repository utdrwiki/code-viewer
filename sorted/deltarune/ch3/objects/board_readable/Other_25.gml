if (turnender == 1 && turnended == 0)
{
    with (obj_mainchara_board)
        movesleft = 0;
    scr_debug_print("TURN ENDED");
    turnended = 1;
}
