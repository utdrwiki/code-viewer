if (i_ex(obj_climb_kris))
{
    with (obj_trigger)
    {
        if (extflag == "tut1")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                with (obj_tutorial_text)
                    active = true;
            }
        }
    }
    with (obj_trigger)
    {
        if (extflag == "tut2")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                with (obj_tutorial_text)
                    active = false;
                with (obj_trigger)
                {
                    if (extflag == "tut1")
                        instance_destroy();
                }
            }
        }
    }
}
else
{
    with (obj_tutorial_text)
        active = false;
}
if (solidmake)
{
    solidmake = false;
    var solidmaker = scr_genmarker("solidmake");
    with (instance_create(solidmaker.x, solidmaker.y, obj_solidblocksized))
        scr_sizeexact(solidmaker.sprite_width, solidmaker.sprite_height);
}
if (global.plot >= 242)
{
}
