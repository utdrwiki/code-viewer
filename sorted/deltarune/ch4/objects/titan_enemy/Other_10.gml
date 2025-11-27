var _battlemsg1 = stringsetloc("* Titan's DEFENSE dropped massively! ATTACKs are super effective!", "obj_titan_enemy_slash_Other_10_gml_4_0");
var _battlemsg3 = stringsetloc("* The darkness slithers.", "obj_titan_enemy_slash_Other_10_gml_8_0");
var _battlemsg4 = stringsetloc("* Darkness flows.&* A swarm is coming.", "obj_titan_enemy_slash_Other_10_gml_9_0");
var _battlemsg5 = stringsetloc("* The Titan's hands began to move once more.", "obj_titan_enemy_slash_Other_10_gml_10_0");
var _battlemsg6 = stringsetloc("* ...", "obj_titan_enemy_slash_Other_10_gml_11_0");
var _battlemsg7 = stringsetloc("* Titan's DEFENSEs are dropped! ATTACKs will be super effective!", "obj_titan_enemy_slash_Other_10_gml_12_0");
if (phase == 1)
{
    if (phaseturn == 1)
    {
        myattackchoice = 0;
        difficulty = 0;
        global.battlemsg[0] = stringsetloc("* The ground shudders.&* A swarm is coming.", "obj_titan_enemy_slash_Other_10_gml_15_0");
    }
    if (phaseturn == 2)
    {
        myattackchoice = 12;
        difficulty = 0;
        global.battlemsg[0] = stringsetloc("* The darkness gives a long gaze, which slithered like a snake. ", "obj_titan_enemy_slash_Other_10_gml_16_0");
    }
    if (phaseturn == 3)
    {
        myattackchoice = 9;
        difficulty = 0;
        phaseturn = 0;
        global.battlemsg[0] = stringsetloc("* For a moment, &* You felt your heart being gripped.", "obj_titan_enemy_slash_Other_10_gml_17_0");
    }
}
else if (phase == 2)
{
    if (phaseturn == 1)
    {
        myattackchoice = 4;
        difficulty = 0;
        if (global.hp[3] < 1)
        {
            global.battlemsg[0] = _battlemsg1;
        }
        else
        {
            global.battlemsg[0] = _battlemsg1b;
            scr_speaker("ralsei");
        }
    }
    if (phaseturn == 2)
    {
        myattackchoice = 1;
        difficulty = 0;
        phaseturn = 1;
        phase = 3;
        deunleash = true;
        unleash_hp = unleash_hpmax;
        if (global.hp[2] < 1)
        {
            global.battlemsg[0] = _battlemsg6;
        }
        else
        {
            global.battlemsg[0] = stringsetloc("\\EI* Damn! Its shield is back... Kris, take it down again!", "obj_titan_enemy_slash_Other_10_gml_24_0");
            scr_speaker("susie");
        }
    }
}
else if (phase == 3)
{
    if (phaseturn == 1)
    {
        myattackchoice = 1;
        difficulty = 0;
        global.battlemsg[0] = _battlemsg3;
    }
    if (phaseturn == 2)
    {
        myattackchoice = 14;
        difficulty = 0;
        global.battlemsg[0] = _battlemsg4;
    }
    if (phaseturn == 3)
    {
        myattackchoice = 10;
        difficulty = 0;
        phaseturn = 0;
        handattackhardcon = 1;
        global.battlemsg[0] = _battlemsg5;
    }
}
else if (phase == 4)
{
    if (phaseturn == 1)
    {
        myattackchoice = 4;
        difficulty = 0;
        if (global.hp[3] < 1)
        {
            global.battlemsg[0] = _battlemsg1;
        }
        else
        {
            global.battlemsg[0] = _battlemsg1b;
            scr_speaker("ralsei");
        }
    }
    if (phaseturn == 2)
    {
        myattackchoice = 5;
        difficulty = 0;
        phaseturn = 1;
        phase = 5;
        deunleash = true;
        unleash_hp = unleash_hpmax;
        if (global.hp[2] < 1)
        {
            global.battlemsg[0] = _battlemsg6;
        }
        else
        {
            global.battlemsg[0] = stringsetloc("\\EJ* We almost got it! Keep taking down its shield, Kris!", "obj_titan_enemy_slash_Other_10_gml_39_0");
            scr_speaker("susie");
        }
    }
}
else if (phase == 5)
{
    if (phaseturn == 1)
    {
        myattackchoice = 5;
        difficulty = 0;
        global.battlemsg[0] = _battlemsg3;
    }
    if (phaseturn == 2)
    {
        myattackchoice = 15;
        difficulty = 0;
        global.battlemsg[0] = _battlemsg4;
    }
    if (phaseturn == 3)
    {
        myattackchoice = 11;
        difficulty = 0;
        phaseturn = 0;
        global.battlemsg[0] = _battlemsg5;
    }
}
else if (phase == 6)
{
    unleashmultiplierturn++;
    if (unleashmultiplierturn == 1)
        unleashmultiplier = 1.2;
    if (unleashmultiplierturn == 2)
        unleashmultiplier = 1.2;
    if (unleashmultiplierturn == 3)
        unleashmultiplier = 2;
    if (unleashmultiplierturn == 4)
        unleashmultiplier = 3;
    if (loopedphase6)
    {
        myattackchoice = 4;
        difficulty = 0;
        phaseturn = 1;
        global.battlemsg[0] = _battlemsg7;
    }
    else
    {
        switch (phase6turn)
        {
            case 1:
                myattackchoice = 3;
                difficulty = 0;
                phase6turn = 2;
                global.battlemsg[0] = "";
                break;
            case 2:
                myattackchoice = 4;
                difficulty = 0;
                phaseturn = 1;
                global.battlemsg[0] = _battlemsg7;
                if (loopedphase6 == true)
                {
                    global.battlemsg[0] = _battlemsg2;
                    scr_speaker("ralsei");
                }
                loopedphase6 = true;
                break;
        }
    }
}
else if (phase == 7)
{
    unleashmultiplier = 1;
    global.battlemsg[0] = _battlemsg6;
    if (phaseturn == 1)
    {
        myattackchoice = 20;
        difficulty = 0;
    }
    if (phaseturn == 2)
    {
        myattackchoice = 20;
        difficulty = 0;
    }
    if (phaseturn == 3)
    {
        myattackchoice = 20;
        difficulty = 0;
    }
}
else if (phase == 8)
{
    global.battlemsg[0] = _battlemsg6;
    if (dualbusterused)
        myattackchoice = 4;
    else
        myattackchoice = 15;
    difficulty = 0;
}
