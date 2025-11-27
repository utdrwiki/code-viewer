if (disappeared)
{
    if (disappear_alpha[disappear_index] != 0)
    {
        disappear_alpha[disappear_index] = scr_movetowards(disappear_alpha[disappear_index], 0, 0.02);
    }
    else
    {
        disappeared = false;
        disappear_index++;
    }
}
