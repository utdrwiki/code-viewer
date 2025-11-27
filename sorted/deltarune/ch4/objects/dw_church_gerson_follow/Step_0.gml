scr_populatechars();
if (!init)
{
    setxy(locx[1], locy[1]);
    init = 1;
}
if (con == 0)
{
    scr_depth();
    image_index += 0.125;
    speed = 2;
    if (global.interact != 0)
    {
        speed = 0;
        image_index = 0;
    }
    move_towards_point(locx[moveindex], locy[moveindex], speed);
    if (scr_checklocation(id, locx[moveindex], locy[moveindex], 2))
    {
        speed = 0;
        con = 1;
    }
}
if (con == 1)
{
    var proceed = false;
    if (moveindex < (array_length(locx) - 1))
    {
        if (moveindex < 3)
        {
            if (ralsei.y < locy[moveindex + 1])
                proceed = true;
        }
        else if (ralsei.x < locx[moveindex + 1])
        {
            proceed = true;
        }
    }
    if (proceed)
    {
        con = 0;
        moveindex++;
    }
    else
    {
        image_index = 0;
        if (moveindex == (numofgersons - 1))
        {
            con = 20;
            interactable = instance_create(x, y, obj_trigger_interact);
            var truex = bbox_left;
            var truey = bbox_top;
            var truexscale = bbox_right - bbox_left;
            var trueyscale = bbox_bottom - bbox_top;
            setxy(truex, truey, interactable);
            scr_sizeexact(truexscale, trueyscale, interactable);
            interactable.strict = true;
            interactable.depth = 0;
            interactable.talked = 0;
            image_index = 0;
        }
    }
}
if (i_ex(interactable))
{
    with (interactable)
    {
        if (myinteract == 3)
        {
            if (d_ex())
            {
                myinteract = 0;
            }
            else
            {
                scr_speaker("gerson");
                msgsetloc(0, "* Hmm^1! The prophecy^1! A very nice fairytale^1, that.../%", "obj_dw_church_gerson_follow_slash_Step_0_gml_93_0");
                if (talked)
                {
                    scr_speaker("gerson");
                    msgsetloc(0, "* Hm? What's the holdup? You kids sure are takin' your sweet time!/%", "obj_dw_church_gerson_follow_slash_Step_0_gml_98_0");
                }
                d_make();
                talked++;
                global.interact = 1;
                myinteract = 4;
            }
        }
        if (myinteract == 4 && !d_ex())
        {
            myinteract = 0;
            global.interact = 0;
        }
    }
}
