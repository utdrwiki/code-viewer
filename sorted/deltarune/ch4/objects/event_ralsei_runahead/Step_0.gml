if (!i_ex(ralsei))
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (con == 0)
{
    if (i_ex(ralsei))
    {
        with (obj_doorparent)
        {
            if (touched)
                other.con = 1;
        }
    }
}
if (con == 1)
{
    var doevent = false;
    if (i_ex(ralsei))
        doevent = true;
    if (eventflag == -1)
    {
        if (scr_debug())
            doevent = true;
        else
            doevent = false;
    }
    else if (global.flag[eventflag] == 0)
    {
        doevent = true;
        global.flag[eventflag] = 1;
    }
    if (doevent)
    {
        if (i_ex(ralsei))
        {
            if (place_meeting(x, y, ralsei))
                doevent = true;
            else
                doevent = false;
        }
    }
    if (doevent)
    {
        debug_print("yes");
        ramark = scr_marker_ext(ralsei.x, ralsei.y, ralsei.sprite_index, 2, 2, animspeed, ralsei.image_index, ralsei.image_blend, ralsei.depth);
        ralsei.visible = false;
        if (dir == 0)
        {
            ramark.sprite_index = spr_ralsei_walk_down_unhappy;
            ramark.vspeed = walkspeed;
        }
        if (dir == 1)
        {
            ramark.sprite_index = spr_ralsei_walk_right_unhappy;
            ramark.hspeed = walkspeed;
        }
        if (dir == 2)
        {
            ramark.sprite_index = spr_ralsei_walk_up;
            ramark.vspeed = -walkspeed;
        }
        if (dir == 3)
        {
            ramark.sprite_index = spr_ralsei_walk_left_unhappy;
            ramark.hspeed = -walkspeed;
        }
        con = 2;
    }
}
