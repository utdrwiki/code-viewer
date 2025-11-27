if (scr_flag_get(1214) > 0)
{
    instance_destroy();
    exit;
}
con = 0;
customcon = 0;
answer = -1;
scr_setparty(1, 1, 0);

answer_question = function(arg0)
{
    answer = arg0;
};

reset_answer = function()
{
    answer = -1;
};
