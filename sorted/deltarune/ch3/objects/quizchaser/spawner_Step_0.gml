if (active)
{
    if (completed == false)
    {
        var make = false;
        if (!made)
            make = true;
        if (global.flag[1022] == 1 && reqtenna == true)
            make = false;
        if (make == true)
        {
            if (kind == 0)
            {
                mychaser = instance_create(x, y, obj_quizchaser);
                mychaser.daddy = id;
                mychaser.pacetype = pacetype;
                mychaser.chasetype = chasetype;
                mychaser.extflag = extflag;
                mychaser.triggeredonstart = triggeredonstart;
                mychaser.quizno = quizno;
            }
            if (kind == 1)
            {
                mychaser = instance_create(x, y, obj_board_q3quizgraylegs);
                mychaser.daddy = id;
                mychaser.quizno = quizno;
            }
            made = true;
        }
    }
}
else if (made)
{
    safe_delete(mychaser);
    made = false;
}
