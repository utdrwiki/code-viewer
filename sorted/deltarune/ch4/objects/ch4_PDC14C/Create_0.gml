snd_stop(mus_undynescary);
con = 1;
customcon = 0;
scr_losechar();
door_marker = scr_marker(423, 295, spr_noellehouse_door_dess);
with (door_marker)
    scr_depth();
kitchen_door_marker = scr_marker(540, 435, spr_noellehouse_door);
with (kitchen_door_marker)
    scr_depth();
couch_marker = scr_marker(405, 512, spr_noellehouse_main_couch_big);
with (couch_marker)
    scr_depth();
carol_bgm = false;
carol_bgm_file = -4;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
snacktray_marker = instance_create(460, 590, obj_marker_palette);
snacktray_marker.sprite_index = spr_noellehouse_platter;
snacktray_marker.depth = 93530;
susie_play_tracks = [85, 552, 590, 49];
susie_play_index = 0;
susie_play_loop = false;
susie_play_loop_stop = false;
susie_play_timer = 0;

block_doors = function()
{
    with (obj_doorAny)
    {
        var _door_readable = instance_create(x, y, obj_readable_room1);
        with (_door_readable)
        {
            image_xscale = 2;
            extflag = "door_blocked";
        }
        var _door_block = instance_create(x, y, obj_solidblockLight);
        with (_door_block)
            image_xscale = 2;
        instance_destroy();
    }
};
