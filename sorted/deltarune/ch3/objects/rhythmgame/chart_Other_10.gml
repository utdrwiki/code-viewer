var _tenna_boss = obj_rhythmgame.tenna_boss;
if (maxnote >= 5)
    last_score[0] = notescore[maxnote - 5];
if (maxnote >= 4)
    last_score[1] = notescore[maxnote - 4];
if (maxnote >= 3)
    last_score[2] = notescore[maxnote - 3];
if (maxnote >= 2)
    last_score[3] = notescore[maxnote - 2];
if (maxnote >= 1)
    last_score[4] = notescore[maxnote - 1];
minnote = 0;
remtrackpos[4] = -1;
remtrackpos[3] -= track_length;
remtrackpos[2] -= track_length;
remtrackpos[1] -= track_length;
remtrackpos[0] -= track_length;
var _notealive;
if (instrument == 2 || _tenna_boss)
    _notealive = 1;
else if (fade < 1)
    _notealive = 0;
else
    _notealive = (obj_rhythmgame.tutorial < 7) ? 1 : 0;
for (i = 0; i < maxnote; i++)
{
    notealive[i] = _notealive;
    notescore[i] = 0;
}
