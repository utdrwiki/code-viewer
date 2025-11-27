function scr_rhythmgame_addnote(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = false)
{
    notetime[maxnote] = arg0;
    notetype[maxnote] = arg1;
    noteend[maxnote] = arg2;
    noteanim[maxnote] = arg3;
    notealive[maxnote] = 1;
    notescore[maxnote] = 0;
    maxnote++;
}

function scr_rhythmgame_addnote_range(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = false)
{
    if (chart_end == 0 || (arg0 < (chart_end - track_length) && arg0 >= (chart_start - track_length)))
    {
        scr_rhythmgame_addnote(arg0, arg1, arg2, arg3, arg4);
        if (chart_end > 0)
        {
            notealive[maxnote - 1] = 0;
            notescore[maxnote - 1] = 40;
        }
        exit;
    }
    else if ((arg0 < chart_start || arg0 > chart_end) && chart_end > 0)
    {
        exit;
    }
    else
    {
        scr_rhythmgame_addnote(arg0, arg1, arg2, arg3, arg4);
    }
}

function scr_rhythmgame_addnote_bpm(arg0, arg1, arg2 = 0)
{
    arg0 *= meter;
    arg0 -= startoffset;
    if (arg2 != 0)
    {
        arg2 *= meter;
        arg0 -= startoffset;
    }
    notetime[maxnote] = arg0;
    notetype[maxnote] = arg1;
    noteend[maxnote] = arg2;
    noteanim[maxnote] = 0;
    notealive[maxnote] = 1;
    notescore[maxnote] = 0;
    maxnote++;
}

function scr_rhythmgame_addnote_snap(arg0, arg1, arg2 = 0, arg3 = 16)
{
    arg0 = (arg0 / meter) * arg3;
    arg0 = (round(arg0) / arg3) * meter;
    if (arg2 != 0)
    {
        arg2 = (arg0 / meter) * arg3;
        arg2 = (round(arg0) / arg3) * meter;
    }
    notetime[maxnote] = arg0;
    notetype[maxnote] = arg1;
    noteend[maxnote] = arg3;
    notealive[maxnote] = 1;
    notescore[maxnote] = 0;
    noteanim[maxnote] = 0;
    maxnote++;
}
