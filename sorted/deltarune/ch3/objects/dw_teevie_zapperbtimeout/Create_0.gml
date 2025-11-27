scr_depth();
var makeme = global.flag[1243];
chainact = 0;
con = 0;
if (makeme)
{
    if (obj_mainchara.x == 80)
    {
        global.facing = 0;
        obj_mainchara.x = 108;
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                x -= 4;
            if (name == "ralsei")
                x -= 34;
            scr_caterpillar_interpolate();
            facing[target] = 0;
        }
    }
    scr_marker_ext(x, y, sprite_index, 2, 2, 0, 1, c_white, 1000040);
    with (scr_marker_ext(x, y, sprite_index, 2, 2, 0, 0, c_white, 1000040))
        scr_depth();
    chain = scr_marker_ext(x + 110, y + 86, spr_dw_teevie_zapperbchain, 2, 2, 0, 0);
    chain.depth = depth - 1;
    chain.image_speed = 0;
    if (global.flag[1243] < 2)
    {
        chainblock = instance_create(150, 280, obj_solidblocksized);
        chainact = instance_create(153, 283, obj_trigger_interact);
        scr_size(2.5, 1, chainact);
    }
    else
    {
        chain.image_index = 1;
        con = 99;
    }
}
else
{
    if (obj_mainchara.x == 80)
    {
        with (obj_mainchara)
            setxy(56, 288);
        with (obj_caterpillarchara)
        {
            setxy(56, 258);
            scr_caterpillar_interpolate();
        }
    }
    with (instance_create(x, y, obj_solidblock))
    {
        sprite_index = other.sprite_index;
        scr_darksize();
        image_index = 0;
        image_speed = 0;
    }
}
