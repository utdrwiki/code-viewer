function scr_board_score(arg0)
{
    var scoreadder = instance_create(x, y, obj_board_scoreAdder);
    scoreadder.scoreamount = arg0;
    if (argument_count == 2)
        scoreadder.mysnd = argument1;
}

function scr_board_score_set(arg0)
{
    global.flag[1044] = arg0;
}
