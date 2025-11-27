if (tilecon == 0)
    timer = 0;
if (tilecon == 1 && obj_mainchara_board.movingnow == 0)
{
    timer++;
    if (timer == 5)
        tilecon = 1.5;
}
if (tilecon == 1.5)
{
    wheel = instance_create(0, 0, obj_board_quizwheel);
    wheel.maxslices = wheeloptions;
    wheel.daddy = id;
    wheel.slicetype = 0;
    wheel.slicetext[0] = scr_quiztopic(quizno1);
    wheel.slicetext[1] = scr_quiztopic(quizno2);
    wheel.slicetext[2] = scr_quiztopic(quizno3);
    wheel.slicetext[3] = scr_quiztopic(quizno4);
    wheel.slicetext[4] = scr_quiztopic(quizno5);
    wheel.slicetext[5] = scr_quiztopic(quizno6);
    wheel.slicetext[6] = scr_quiztopic(quizno7);
    wheel.slicetext[7] = scr_quiztopic(quizno8);
    wheel.slicetext[8] = scr_quiztopic(quizno9);
    tilecon = -1;
}
if (tilecon == 2)
{
    quiz = instance_create(0, 0, obj_quizsequence);
    quiz.depth = obj_mainchara_board.depth - 10;
    var quiznumber = 0;
    switch (quizchoice)
    {
        case 0:
            quiznumber = quizno1;
            break;
        case 1:
            quiznumber = quizno2;
            break;
        case 2:
            quiznumber = quizno3;
            break;
        case 3:
            quiznumber = quizno4;
            break;
        case 4:
            quiznumber = quizno5;
            break;
        case 5:
            quiznumber = quizno6;
            break;
        case 6:
            quiznumber = quizno7;
            break;
        case 7:
            quiznumber = quizno8;
            break;
        case 8:
            quiznumber = quizno9;
            break;
    }
    quiz.quizno = quiznumber;
    scr_quiztopic(quiznumber);
    obj_board_controller.phase = 2;
    timer = 0;
    tilecon = 3;
}
if (tilecon == 3 && !i_ex(obj_quizsequence))
    tilecon = 99;
if (tilecon == 99)
{
    tilecon = 0;
    tiledone = 1;
    obj_board_controller.phase = 0;
    instance_destroy();
}
