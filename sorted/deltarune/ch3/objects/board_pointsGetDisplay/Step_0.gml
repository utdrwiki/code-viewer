if (init == 0)
{
    scr_lerpvar("y", y, y - 20, 24, 6, "out");
    if (onlyvisual == false)
        scr_script_delayed(scr_board_score, 7, amount);
    init = 1;
}
