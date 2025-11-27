if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (kr_real == 0)
{
    with (obj_mainchara)
        other.kr_real = id;
}
if (active == 1)
{
    var _solid = instance_create(x, y, obj_board_solid);
    with (_solid)
    {
        setxy_board(4320, 1184);
        image_yscale = 8;
    }
}
