function scr_teevie_quiz(arg0)
{
    var quiz_id = arg0;
    var question_list = [];
    var question_text = [];
    var answer_a = [];
    var answer_b = [];
    var correct_answer = [];
    var max_time_limit = [];
    var question_visual = [];
    switch (quiz_id)
    {
        case "A":
            question_text[0] = stringsetloc("WHAT'S THE REWARD FOR C-RANK?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_24_0");
            answer_a[0] = stringsetloc("CANDY", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_25_0");
            answer_b[0] = stringsetloc("COOLER", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_26_0");
            correct_answer[0] = "B";
            max_time_limit[0] = 240;
            question_visual[0] = "none";
            question_text[1] = stringsetloc("WHO RUNS THE GREEN ROOM CONCESSIONS?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_31_0");
            answer_a[1] = stringsetloc("RAMB", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_32_0");
            answer_b[1] = stringsetloc("ROMB", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_33_0");
            correct_answer[1] = "A";
            max_time_limit[1] = 240;
            question_visual[1] = "none";
            break;
        case "B":
            question_text[0] = stringsetloc("KRIS'S LAST NAME!?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_39_0");
            answer_a[0] = stringsetloc("DREEMURR", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_40_0");
            answer_b[0] = stringsetloc("DREEMURE", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_41_0");
            correct_answer[0] = "A";
            max_time_limit[0] = 180;
            question_visual[0] = "none";
            var board_1_flag = 1173;
            var rank_1_letter = scr_get_rank_letter(board_1_flag);
            var board_2_flag = 1174;
            var rank_2_letter = scr_get_rank_letter(board_2_flag);
            var fake_answer = (rank_1_letter == rank_2_letter) ? "B" : rank_2_letter;
            if (fake_answer == rank_1_letter)
                fake_answer = "C";
            question_text[1] = stringsetloc("WHAT WAS YOUR RANK ON BOARD 1!?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_60_0");
            answer_a[1] = fake_answer;
            answer_b[1] = rank_1_letter;
            correct_answer[1] = "B";
            max_time_limit[1] = 180;
            question_visual[1] = "none";
            break;
        case "C":
            randomize();
            var _question_type = irandom(3);
            if (_question_type == 0)
            {
                _type = (irandom(100) < 50) ? 1 : 2;
                var _answer_a = irandom(999);
                var _answer_b = irandom(999);
                if (_type == 1)
                {
                    question_text[0] = stringsetloc("WHICH NUMBER IS BIGGER?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_100_0");
                    answer_a[0] = string(_answer_a);
                    answer_b[0] = string(_answer_b);
                    correct_answer[0] = (_answer_a > _answer_b) ? "A" : "B";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
                else
                {
                    question_text[0] = stringsetloc("WHICH NUMBER IS SMALLER?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_108_0");
                    answer_a[0] = string(_answer_a);
                    answer_b[0] = string(_answer_b);
                    correct_answer[0] = (_answer_a < _answer_b) ? "A" : "B";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
            }
            else if (_question_type == 1)
            {
                _type = (irandom(100) < 50) ? 1 : 2;
                if (_type == 1)
                {
                    question_text[0] = stringsetloc("WHAT LETTER DOES ABSORB BEGIN WITH?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_121_0");
                    answer_a[0] = "";
                    answer_b[0] = "";
                    correct_answer[0] = "A";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
                else
                {
                    question_text[0] = stringsetloc("WHAT LETTER DOES BANANA BEGIN WITH?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_129_0");
                    answer_a[0] = "";
                    answer_b[0] = "";
                    correct_answer[0] = "B";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
            }
            else if (_question_type == 2)
            {
                _type = (irandom(100) < 50) ? 1 : 2;
                if (_type == 1)
                {
                    question_text[0] = stringsetloc("WHAT LETTER DOES ABSORB END WITH?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_142_0");
                    answer_a[0] = "";
                    answer_b[0] = "";
                    correct_answer[0] = "B";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
                else
                {
                    question_text[0] = stringsetloc("WHAT LETTER DOES BANANA END WITH?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_150_0");
                    answer_a[0] = "";
                    answer_b[0] = "";
                    correct_answer[0] = "A";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
            }
            else if (_question_type == 3)
            {
                _type = (irandom(100) < 50) ? 1 : 2;
                if (_type == 1)
                {
                    question_text[0] = stringsetloc("WHAT LETTER DOES APPLEBABABA END WITH?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_162_0");
                    answer_a[0] = "";
                    answer_b[0] = "";
                    correct_answer[0] = "A";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
                else
                {
                    question_text[0] = stringsetloc("WHAT LETTER DOES BANANABABABA BEGIN WITH?", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_170_0");
                    answer_a[0] = "";
                    answer_b[0] = "";
                    correct_answer[0] = "B";
                    max_time_limit[0] = 50;
                    question_visual[0] = "none";
                }
            }
            var _type = (irandom(100) < 50) ? 1 : 2;
            if (_type == 1)
            {
                question_text[1] = stringsetloc("CHOOSE A!", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_182_0");
                answer_a[1] = "";
                answer_b[1] = "";
                correct_answer[1] = "A";
                max_time_limit[1] = 40;
                question_visual[1] = "none";
            }
            else
            {
                question_text[1] = stringsetloc("CHOOSE B!", "scr_teevie_quiz_slash_scr_teevie_quiz_gml_190_0");
                answer_a[1] = "";
                answer_b[1] = "";
                correct_answer[1] = "B";
                max_time_limit[1] = 40;
                question_visual[1] = "none";
            }
            break;
    }
    for (var i = 0; i < array_length_1d(question_text); i++)
        question_list[i] = new teevie_quiz_question(question_text[i], answer_a[i], answer_b[i], correct_answer[i], max_time_limit[i], question_visual[i]);
    return question_list;
}

function teevie_quiz_question(arg0, arg1, arg2, arg3, arg4, arg5) constructor
{
    question_text = arg0;
    answer_a = arg1;
    answer_b = arg2;
    correct_answer = arg3;
    max_time_limit = arg4;
    question_visual = arg5;
}
