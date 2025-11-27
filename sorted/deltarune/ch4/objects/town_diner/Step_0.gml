if (global.chapter == 4)
{
    if (nicecream_turn)
    {
        if (!nicecream_talk)
        {
            nicecream_turn_timer++;
            if (nicecream_turn_timer == 45)
            {
                with (nicecream)
                    image_index = 1;
            }
            if (nicecream_turn_timer == 105)
            {
                nicecream_turn_timer = 0;
                with (nicecream)
                    image_index = 0;
            }
        }
    }
    if (bratty_turn)
    {
        if (bratty_talk)
        {
            if (!d_ex())
            {
                bratty_talk = false;
                nicecream_talk = false;
            }
            else
            {
                with (bratty)
                    image_index = 0;
                with (nicecream)
                    image_index = 0;
                exit;
            }
        }
        bratty_turn_timer++;
        if (bratty_turn_timer == 120)
        {
            with (bratty)
                image_index = 1;
        }
        if (bratty_turn_timer == 180)
        {
            bratty_turn_timer = 0;
            with (bratty)
                image_index = 0;
        }
    }
}
