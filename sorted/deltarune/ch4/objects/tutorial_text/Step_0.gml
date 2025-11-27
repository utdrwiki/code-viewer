if (i_ex(obj_dw_church_bookshelfpuzzle))
{
    active = false;
    with (obj_dw_church_remote_piano)
    {
        if (con == 2)
            other.active = true;
    }
}
if (i_ex(obj_dw_church_pianopiece_right))
{
    active = false;
    with (obj_dw_church_remote_piano)
    {
        if (con == 2 || con == -999)
            other.active = true;
    }
}
if (i_ex(obj_church_piano_playable))
{
    active = false;
    with (obj_church_piano_playable)
    {
        if (con == 1 && forceend == 0)
            other.active = true;
    }
}
if (i_ex(obj_dw_church_remotepianomove))
{
    active = false;
    with (obj_dw_church_remotepianomove)
    {
        if (engaged)
            other.active = true;
    }
}
if (i_ex(obj_dw_church_organ))
{
    active = false;
    with (obj_dw_church_organ)
    {
        if (engaged)
            other.active = true;
    }
}
if (i_ex(obj_church_secretpiano_playable))
{
    active = false;
    with (obj_church_secretpiano_playable)
    {
        if (con == 1 || con == 40)
            other.active = true;
    }
}
if (instance_exists(obj_dw_church_sideclimb))
{
    active = false;
    if (obj_dw_church_sideclimb.con == 1)
        active = true;
    if (!instance_exists(obj_climb_kris))
        active = false;
    if (scr_trigcheck_ext("nohud", 27))
        active = false;
}
