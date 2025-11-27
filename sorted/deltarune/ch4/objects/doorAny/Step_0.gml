if (init == 0)
{
    switch (image_index)
    {
        case 1:
            doorRoom = room + ROOM_INITIALIZE;
            break;
        case 2:
            doorRoom = room - ROOM_INITIALIZE;
            break;
        case 3:
            doorRoom = room + room_title_placeholder;
            break;
        case 4:
            doorRoom = room - room_title_placeholder;
            break;
        case 5:
            doorRoom = room + room_battletest;
            break;
        case 6:
            doorRoom = room - room_battletest;
            break;
        default:
            break;
    }
    if (image_index != 0)
        doorEntrance = image_index;
    if (doorSpecial != "none")
    {
        if (doorSpecial == "queen")
        {
            if (scr_get_total_recruits(2) == 0)
                doorFadeMusic = 0;
        }
        else if (doorSpecial == "noelle_bathroom")
        {
            if (scr_sideb_active() && global.plot == 90)
                doorRoom = room_town_noellehouse;
        }
        else if (doorSpecial == "shelter")
        {
            if (global.plot >= 90)
                doorFadeMusic = 0;
        }
        else if (doorSpecial == "gerson_study_north")
        {
            if (global.plot >= 230)
            {
                if (scr_flag_get(1642) == 0)
                    doorRoom = room_dw_church_dogclimb;
            }
        }
        else if (doorSpecial == "lancer_parade")
        {
            doorFadeMusic = 1;
        }
        else if (doorSpecial == "mike")
        {
            if (global.flag[1702] == 1)
            {
                doorRoom = room_dw_castle_tv_zone_minigame;
                doorFadeMusic = -1;
            }
        }
        else if (doorSpecial == "tv" || doorSpecial == "cafe" || doorSpecial == "bakery")
        {
            if (global.flag[1661] > 0 && global.plot >= 240)
                doorFadeMusic = 1;
        }
    }
    init = 1;
}
