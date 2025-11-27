var _minigamecount = 1;
var _minigametype = "battle";
var _difficulty = 0;
var _i = 0;
if (!minigameactivated)
    phaseturn++;
if ((global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.2) || obj_tenna_enemy_bg.myscore >= 1000) && haveusedultimate == false)
    minigameinsanity = true;
if (testsharpshoot == true)
{
    phaseturn = 99;
    myattackchoice = 21;
    exit;
}
if (testlightemup == true)
    phaseturn = 18;
if (phaseturn == 1)
    myattackchoice = 0;
if (phaseturn == 2)
    myattackchoice = 1;
if (phaseturn == 3)
{
    myattackchoice = 2;
    phaseturn = 0;
}
if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.5))
{
    myattackchoice = 3;
    minigamecount++;
    minigameactivated = true;
}
if (minigameactivated && minigamecount <= 5)
{
    myattackchoice = 3;
    minigamecount++;
}
if (minigameactivated && minigamecount >= 6)
{
    myattackchoice = 3;
    minigamecount++;
    _minigamecount = 2;
}
if (minigameinsanity == true)
{
    minigameactivated = true;
    myattackchoice = 3;
}
if (phaseturn == 18)
{
    haveusedultimate = true;
    myattackchoice = 3;
    minigametype = "battle";
    difficulty = 3;
    exit;
}
if (phaseturn == 19)
{
    haveusedultimate = true;
    myattackchoice = 3;
    minigametype = "battle";
    difficulty = 3;
    exit;
}
if (myattackchoice == 3)
{
    repeat (_minigamecount)
    {
        global.tempflag[91]++;
        if (global.tempflag[91] == 1)
        {
            _minigametype = "cooking";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 2)
        {
            _minigametype = "music";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 3)
        {
            _minigametype = "battle";
            _difficulty = 1;
        }
        if (global.tempflag[91] == 4)
        {
            _minigametype = "cowboy";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 5)
        {
            _minigametype = "music";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 6)
            global.tempflag[91] = 7;
        if (global.tempflag[91] == 7)
        {
            if (global.flag[1197] > 0)
            {
                _minigametype = "susiezilla";
                _difficulty = 2;
            }
            else
            {
                _minigametype = "battle";
                _difficulty = 2;
            }
        }
        if (global.tempflag[91] == 8)
        {
            _minigametype = "cowboy";
            _difficulty = 1;
        }
        if (global.tempflag[91] == 9)
        {
            _minigametype = "music";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 10)
        {
            _minigametype = "cowboy";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 11)
            global.tempflag[91] = 12;
        if (global.tempflag[91] == 12)
        {
            _minigametype = "battle";
            _difficulty = 2;
        }
        if (global.tempflag[91] == 13)
        {
            _minigametype = "music";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 14)
        {
            _minigametype = "cooking";
            _difficulty = 0;
        }
        if (global.tempflag[91] == 15)
        {
            if (global.flag[1197] > 0)
            {
                _minigametype = "susiezilla";
                _difficulty = 3;
            }
            else
            {
                _minigametype = "battle";
                _difficulty = 1;
            }
        }
        if (global.tempflag[91] == 16)
        {
            _minigametype = "cowboy";
            _difficulty = 1;
        }
        if (global.tempflag[91] > 16)
        {
            var randomchosen = choose(0, 0, 0, 1, 2, 3, 4, 5);
            if (global.flag[1197] > 0)
                randomchosen = choose(0, 0, 0, 1, 3, 4, 5, 6, 7);
            repeat (3)
            {
                if (randomchosen == randomchosenprev1 || randomchosen == randomchosenprev2)
                    randomchosen += 2;
                if (global.flag[1197] == 0 && randomchosen > 5)
                    randomchosen -= 5;
                if (global.flag[1197] > 0 && randomchosen > 7)
                    randomchosen -= 7;
            }
            if (extravar == 0)
                randomchosenprev1 = randomchosen;
            if (extravar == 1)
                randomchosenprev2 = randomchosen;
            extravar++;
            if (extravar == 1)
                extravar = 0;
            if (randomchosen == 0)
                _minigametype = "music";
            if (randomchosen == 1)
            {
                _minigametype = "cooking";
                _difficulty = 0;
            }
            if (randomchosen == 2)
            {
                _minigametype = "cowboy";
                _difficulty = 0;
            }
            if (randomchosen == 3)
            {
                _minigametype = "cowboy";
                _difficulty = 1;
            }
            if (randomchosen == 4)
            {
                _minigametype = "battle";
                _difficulty = 1;
            }
            if (randomchosen == 5)
            {
                _minigametype = "battle";
                _difficulty = 2;
            }
            if (randomchosen == 6)
            {
                _minigametype = "susiezilla";
                _difficulty = 2;
            }
            if (randomchosen == 7)
            {
                _minigametype = "susiezilla";
                _difficulty = 4;
            }
        }
        if (_i == 0)
        {
            minigametype = _minigametype;
            difficulty = _difficulty;
        }
        if (_i == 1)
        {
            minigametype2 = _minigametype;
            difficulty2 = _difficulty;
        }
        if (_i == 2)
        {
            minigametype3 = _minigametype;
            difficulty3 = _difficulty;
        }
        _i++;
    }
    if (minigameinsanity == 1)
    {
        minigametype = "music";
        difficulty = 0;
    }
}
