if (mycrowd == -4)
{
    if (room == room_dw_teevie_audiencepits)
    {
        with (obj_dw_teevie_cameras_cheer)
        {
            if (x == other.x && y == (other.y - 140))
                other.mycrowd = id;
        }
    }
}
var trig = false;
if (i_ex(obj_mainchara))
{
    if (place_meeting(x, y, obj_mainchara))
        trig = true;
}
with (mycrowd)
    active = trig;
