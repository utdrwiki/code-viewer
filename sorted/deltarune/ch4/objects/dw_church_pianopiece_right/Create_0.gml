if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("W")))
    {
        if (global.flag[710] >= 2)
            global.flag[710] = 0;
        else
            global.flag[710] = 2;
        var text = "Saw Ralsei's Room";
        if (global.flag[710] < 2)
            text = "Did not see Ralsei's Room";
        debug_print(text);
    }
}
global.flag[7] = 0;
layer_set_visible("debug_assets", 0);
layer_set_visible("debug_assets2", 0);
flooractive = 1;
shelf1 = instance_create(1000, 480, obj_bookshelf_moveable2x2);
shelf2 = instance_create(1000, 640, obj_bookshelf_moveable2x2);
shelf1.sprite_index = spr_dw_church_2x2shelf_purple;
shelf2.sprite_index = spr_dw_church_2x2shelf_orange;
piano1 = instance_create(680, 348, obj_dw_church_remote_piano);
piano1.myshelf[0] = shelf1;
piano1.myshelf[1] = shelf2;
piano1.sprite_index = spr_dw_church_remotepiano_twotone;
piano1.extflag = "piano";
piano1.camx = 560;
piano1.camy = 320;
shelf1.xflag = 882;
shelf1.yflag = 883;
shelf2.xflag = 884;
shelf2.yflag = 885;
wasactive = 0;
shelvesinit = 0;
sprite_array_size = -1;
layersprite = [];
init = 0;
siner = 0;
instance_create(x, y, obj_tutorial_text);
