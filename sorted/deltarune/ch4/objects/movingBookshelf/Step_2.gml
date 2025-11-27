if (riding == true)
{
    with (obj_mainchara)
    {
        global.facing = 2;
        setxy((other.x + (other.sprite_width / 2)) - 20, (other.y + (other.sprite_height / 2)) - 26);
        ignoredepth = 1;
        depth = other.depth - 5;
        fun = 1;
        sprite_index = other.kriscling;
        image_index = 2;
        image_speed = 0;
    }
    if (ralsei != 0)
    {
        with (ralsei)
        {
            setxy((other.x + (other.sprite_width / 2)) - 62, (other.y + (other.sprite_height / 2)) - 36);
            follow = 0;
            ignoredepth = 1;
            depth = other.depth - 3;
            fun = 1;
            sprite_index = other.ralseicling;
            image_index = 0;
        }
    }
    if (susie != 0)
    {
        with (susie)
        {
            setxy(other.x + (other.sprite_width / 2) + 18, (other.y + (other.sprite_height / 2)) - 38);
            follow = 0;
            ignoredepth = 1;
            depth = other.depth - 3;
            fun = 1;
            sprite_index = other.susiecling;
            image_index = 0;
        }
    }
}
