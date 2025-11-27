scr_musicer("tv_world.ogg");
con = 0;
timer = 0;
init = 0;
crowdvolume = 0;
crowdcheer = 0;
activechase = false;
con = 0;
active = true;
alert = 0;
fade = false;
gray = 0;
for (var i = 0; i < 5; i++)
{
    for (var ii = 0; ii < 5; ii++)
    {
        if ((ii % 2) == 0)
        {
            instance_create(340 + (400 * i), 320 + (160 * ii), obj_dw_teevie_stealth_chaselamp);
            instance_create(540 + (400 * i), 400 + (160 * ii), obj_dw_teevie_stealth_chaselamp);
        }
    }
}
