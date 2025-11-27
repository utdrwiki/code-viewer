test_timer = 0;
con = -1;
open_closet = false;
close_closet = false;
closet_fadein = false;
kris_pickup = false;
finish_sequence = false;
finish_con = 0;
finish_timer = 0;
kris_marker = -4;
closet = -4;
heart = -4;
kris = -4;
pile_marker = -4;
present = -4;
present2 = -4;
guitar_marker = -4;
ladder_marker = -4;
santa = [];
shelf_cover = [];

clean_up = function()
{
    with (closet)
        clean_up();
    with (kris)
        clean_up();
    with (pile_marker)
        instance_destroy();
    with (present)
        instance_destroy();
    with (present2)
        instance_destroy();
    with (guitar_marker)
        instance_destroy();
    with (ladder_marker)
        instance_destroy();
    with (obj_marker)
    {
        if (sprite_index == spr_noellehouse_dess_closet_shelf_cover)
            instance_destroy();
    }
    shelf_cover = [];
    with (obj_homealone_dancing_santa_mini)
        instance_destroy();
    santa = [];
    instance_destroy();
};

if (global.plot < 63)
{
    instance_destroy();
    exit;
}
