con = -1;
goulden_sam = scr_dark_marker(0, 90, spr_npc_gouldensam);
with (goulden_sam)
{
    scr_flip("x");
    x = 314;
    scr_depth();
}
suliver_sam = scr_dark_marker(325, 90, spr_npc_suliversam);
with (suliver_sam)
    scr_depth();
readable = instance_create(goulden_sam.x - 200, goulden_sam.y + 80, obj_readable_room1);
with (readable)
{
    extflag = "sams";
    image_xscale = 20;
    image_yscale = 2;
}
collider_left = instance_create(goulden_sam.x - 240, goulden_sam.y + 90, obj_solidblocksized);
with (collider_left)
    image_xscale = 6;
collider_right = instance_create(suliver_sam.x, suliver_sam.y + 90, obj_solidblocksized);
with (collider_right)
    image_xscale = 6;

choose_love = function()
{
    con = 10;
    with (readable)
        extflag = "love";
};

choose_hate = function()
{
    con = 20;
    with (readable)
        extflag = "hate";
};
