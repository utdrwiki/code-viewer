con = -1;
customcon = 0;
var counter_marker = scr_dark_marker(640, 240, spr_dw_ranking_counter);
with (counter_marker)
    scr_depth();
zapper_marker = scr_dark_marker(662, 126, spr_npc_zapper_talk);
zapper_marker.depth = counter_marker.depth + 10;
zapper_talk_active = false;
zapper_readable = instance_create(zapper_marker.x + 40, zapper_marker.y + 100, obj_readable_room1);
with (zapper_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "zapper";
}
mystery_door_readable = instance_create(170, 240, obj_readable_room1);
with (mystery_door_readable)
{
    image_xscale = 6;
    extflag = "construction";
}
code_entry = -4;
code_prompt = false;
code_door_block = -4;
code_door_readable = -4;
code_door_unlocked = scr_flag_get(1645) == 1;
code_timer = 0;
mystery_door_marker = -4;

unlock_mystery_door = function()
{
    mystery_door_marker = scr_dark_marker(160, 170, spr_dw_ranking_doors_narrow_mike_unlocked);
    with (mystery_door_marker)
        scr_depth();
    with (mystery_door_readable)
        instance_destroy();
    with (code_door_block)
        instance_destroy();
};

create_hint_paper = function()
{
    var paper_marker = scr_dark_marker(306, 210, spr_dw_castle_tv_paper);
    with (paper_marker)
        scr_depth();
    var paper_readable = instance_create(paper_marker.x + 4, paper_marker.y, obj_readable_room1);
    with (paper_readable)
    {
        image_yscale = 2;
        extflag = "code_entry_hint";
    }
};

if (!code_door_unlocked)
{
    var required_recruits = [654, 659, 656];
    var all_recruited = true;
    for (var i = 0; i < array_length(required_recruits); i++)
    {
        var is_recruited = scr_flag_get(required_recruits[i]) == 1;
        if (!is_recruited)
        {
            all_recruited = false;
            break;
        }
    }
    if (all_recruited)
    {
        code_prompt = true;
    }
    else
    {
        mystery_door_marker = scr_dark_marker(160, 170, spr_dw_castle_tv_door_caution);
        with (mystery_door_marker)
            scr_depth();
    }
}
if (code_prompt)
{
    code_door_block = instance_create(160, 240, obj_solidblockDark);
    with (code_door_block)
        image_xscale = 3;
    with (mystery_door_readable)
        extflag = "code_entry";
    if (global.plot >= 243)
        create_hint_paper();
}
else if (!code_door_unlocked)
{
    code_door_block = instance_create(160, 240, obj_solidblockDark);
    with (code_door_block)
        image_xscale = 3;
}
else
{
    if (global.plot >= 243)
        create_hint_paper();
    unlock_mystery_door();
    if (global.flag[1696] == 1 && global.flag[1702] == 0)
        con = 50;
    if (global.flag[1702] == 1)
        mystery_door_marker.sprite_index = spr_dw_ranking_doors_narrow_mouse;
}
if (!scr_recruited_all_in_chapter(3))
{
    var door_marker = scr_dark_marker(400, 170, spr_dw_castle_tv_door_caution);
    with (door_marker)
        scr_depth();
    var door_block = instance_create(400, 240, obj_solidblocksized);
    with (door_block)
        image_xscale = 4;
    var door_readable = instance_create(door_block.x, door_block.y, obj_readable_room1);
    with (door_readable)
    {
        image_xscale = 8;
        extflag = "rhythm_closed";
    }
    with (zapper_marker)
        instance_destroy();
    var note_marker = scr_dark_marker(counter_marker.x + 70, counter_marker.y, spr_church_letter_alvin);
    note_marker.depth = counter_marker.depth - 10;
    with (zapper_readable)
    {
        image_xscale = 2;
        image_yscale = 2;
        extflag = "desk_empty";
    }
}

show_code_entry = function()
{
    con = 20;
};
