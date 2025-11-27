function scr_board_battlehealth()
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            global.hp[1] = round((myhealth / maxhealth) * global.maxhp[1]);
        if (name == "susie")
            global.hp[2] = round((myhealth / maxhealth) * global.maxhp[2]);
        if (name == "ralsei")
            global.hp[3] = round((myhealth / maxhealth) * global.maxhp[3]);
    }
}

function scr_board_boardhealth()
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
        {
            global.hp[1] = round((myhealth / maxhealth) * global.maxhp[1]);
            myhealth = round((global.hp[1] / global.maxhp[1]) * maxhealth);
            if (myhealth < 1)
                myhealth = 1;
        }
        if (name == "susie")
        {
            myhealth = round((global.hp[2] / global.maxhp[2]) * maxhealth);
            if (myhealth < 1)
                myhealth = 1;
        }
        if (name == "ralsei")
        {
            myhealth = round((global.hp[3] / global.maxhp[3]) * maxhealth);
            if (myhealth < 1)
                myhealth = 1;
        }
    }
}
