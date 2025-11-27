function scr_quizsetup_full(arg0 = 3, arg1 = 0, arg2 = false, arg3 = 900000)
{
    var __quiz = instance_create(0, 0, obj_quizsequence);
    if (scr_debug())
        arg1 = scr_quizdebug(arg1, arg2);
    __quiz.depth = arg3;
    __quiz.board4 = arg2;
    if (arg2)
        __quiz.newdepth = 100000;
    scr_quizsetup(arg0, arg1);
    return __quiz;
}

function scr_quizsetup(arg0 = 3, arg1 = 0, arg2 = 27, arg3 = false)
{
    with (obj_quizsequence)
    {
        if (arg3)
        {
            if (((arg2 - arg1) + 1) < arg0)
                arg0 = (arg2 - arg1) + 1;
            var _quizlist = ds_list_create();
            randomize();
            for (var i = arg1; i <= arg2; i++)
                ds_list_add(_quizlist, i);
            ds_list_shuffle(_quizlist);
            for (var i = 0; i < arg0; i++)
                quizQs[i] = ds_list_find_index(_quizlist, i);
            quiz_length = arg0;
            ds_list_clear(_quizlist);
        }
        else
        {
            if (scr_debug())
                arg1 = scr_quizdebug(arg1, false);
            for (var i = 0; i < arg0; i++)
                quizQs[i] = i + arg1;
            quiz_length = arg0;
        }
    }
}

function scr_quizadd(arg0)
{
    with (obj_quizsequence)
    {
        quizQs[quiz_length] = arg0;
        quiz_length++;
    }
}

function scr_quizreplace(arg0, arg1)
{
    with (obj_quizsequence)
        quizQs[arg0] = arg1;
}

function scr_quizdebug(arg0, arg1)
{
    if (scr_debug())
    {
        if (keyboard_check(ord("4")) || keyboard_check(vk_numpad1))
            arg0 = 0;
        else if (keyboard_check(ord("5")) || keyboard_check(vk_numpad2))
            arg0 = 3;
        else if (keyboard_check(ord("6")) || keyboard_check(vk_numpad3))
            arg0 = 6;
        else if (keyboard_check(ord("7")) || keyboard_check(vk_numpad4))
            arg0 = 9;
        else if (keyboard_check(ord("8")) || keyboard_check(vk_numpad5))
            arg0 = 12;
        else
            return arg0;
        if (arg1)
            arg0 = (arg0 / 3) + 15;
        debug_print("Starting question overriden (" + string(arg0) + ")");
    }
    return arg0;
}
