con = -1;
customcon = 0;
if (global.plot >= 280)
{
    instance_destroy();
    exit;
}
door_blocker = -4;
npc_setup = false;
post_nap = false;
blood_drinker = false;
shyren_siner = 0;
shyren_move = false;
snowy_dont_laugh = 0;
rudy_con = 0;
rudy_asgore_con = 0;
susie_npc = -4;
susie_drink_sfx = false;
susie_drink_timer = 0;
susie_notice = -4;
leave_con = -1;
bowl_marker = -4;
bowl_readable = -4;
if (global.plot < 30)
{
    door_blocker = instance_create(380, 616, obj_solidblockLight);
    door_blocker.image_xscale = 4;
    door_blocker.visible = 0;
    leave_con = 0;
    with (obj_doorAny)
        instance_destroy();
}
else
{
    instance_destroy();
}

create_susie_npc = function()
{
    if (bowl_marker == -4)
    {
        bowl_marker = scr_marker(351, 473, spr_church_punch_bowl);
        bowl_marker.depth = 90000;
    }
    if (bowl_readable == -4)
    {
        bowl_readable = instance_create(420, 480, obj_readable_room1);
        with (bowl_readable)
        {
            extflag = "punch";
            image_xscale = 3;
        }
    }
    cup_marker = scr_marker(461, 484, spr_church_punch_cups);
    cup_marker.depth = 90000;
    susie_npc = scr_marker(382, 444, spr_susie_church_punch_bowl);
    susie_npc.image_speed = 0;
    susie_npc.depth = bowl_marker.depth - 10;
    susie_readable = instance_create(390, 478, obj_readable_room1);
    with (susie_readable)
        extflag = "susie";
    susie_notice = scr_marker(susie_npc.x + 16, susie_npc.y + 2, spr_exc);
    susie_notice.depth = susie_npc.depth - 10;
    with (susie_notice)
        visible = 0;
    susie_drink_sfx = true;
};

susie_ready = function()
{
    susie_drink_sfx = false;
    with (susie_notice)
    {
        sprite_index = spr_exc;
        visible = true;
    }
    with (susie_npc)
    {
        sprite_index = spr_susie_church_punch_bowl_sideeye;
        image_speed = 0;
        image_index = 0;
    }
    with (bowl_marker)
        visible = false;
    with (obj_ch4_PDC03)
    {
        with (bowl_marker)
            visible = false;
    }
    var red_marker = scr_marker(376, 483, spr_church_bowl_mess);
    red_marker.depth = 94600;
    var yellow_marker = scr_marker(422, 480, spr_church_punch_bowl_yellow);
    yellow_marker.depth = bowl_marker.depth;
};

found_clue = function()
{
    with (susie_readable)
        read = 0;
};

if (global.plot >= 25)
{
    bowl_marker = scr_marker(351, 473, spr_church_punch_bowl);
    bowl_marker.depth = 90000;
    post_nap = true;
    with (obj_caterpillarchara)
    {
        sprite_index = spr_susie_church_punch_bowl;
        fun = 1;
        follow = 0;
        visible = 0;
    }
    create_susie_npc();
    if (scr_flag_get(1619) == 1)
        found_clue();
    else if (scr_flag_get(1619) == 2)
        susie_ready();
}
