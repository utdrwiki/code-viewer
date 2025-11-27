flooractive = 1;
bookshelf = scr_marker_ext(1560, 1080, spr_movingBookshelf, 2, 2);
bookshelf2 = scr_marker_ext(1440, 1080, spr_movingBookshelf, 2, 2);
ladder = scr_marker_ext(520, 1120, spr_church_ladder, 2, 2, undefined, undefined, undefined, 999999);
book = scr_marker_ext(1502, 1046, spr_pxwhite, 10, 18, undefined, undefined, c_blue, 900000);
bookint = instance_create(1484, 1044, obj_trigger_interact);
with (bookint)
    scr_sizeexact(48, 36);
shelfblocker = instance_create(1240, 1120, obj_solidblocksized);
scr_size(1, 2, shelfblocker);
doorblocker = instance_create(320, 1040, obj_solidblocksized);
scr_size(2, 1, doorblocker);
ledgeblocker = instance_create(1680, 1080, obj_solid_temp);
ledgeblocker.extflag = "FLOOR2";
ledgeblocker.image_index = 5;
ladder2 = 0;
if (global.flag[867] == 1)
{
    bookint.myinteract = 4;
    book.image_blend = #3E3E3E;
    safe_delete(shelfblocker);
    safe_delete(doorblocker);
    ladder2 = scr_marker_ext(1240, 1120, spr_church_ladder, 2, 2, undefined, undefined, undefined, 999999);
    scr_marker_ext(320, 1000, spr_pxwhite, 80, 80, undefined, undefined, c_black, 999999);
}
