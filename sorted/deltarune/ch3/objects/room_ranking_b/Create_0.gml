with (obj_border_controller)
{
    stop_custom_effect();
    show_border();
}
freezewall = false;
visible = true;
depth = 10;
drawblue = false;
if (global.flag[1226] == 0)
{
    gatrig = instance_create(280, 340, obj_trigger_interact);
    with (gatrig)
    {
        strict = true;
        scr_size(5.25, 2.5);
        visible = false;
    }
    gacon = 0;
    garead = 0;
    gacha_active = false;
    gacha_con = -1;
    var _vending_marker = scr_dark_marker(440, 234, spr_dw_tvland_preview_vending);
    with (_vending_marker)
        scr_depth();
    gachapon = instance_create(214, 78, obj_ch3_gachapon);
    gachaslot = scr_marker_ext(296, 294, spr_dw_tv_gachapon_coinslot, 2, 2, 0, 0, undefined, _vending_marker.depth - 10);
    gachaslot.visible = false;
    gacha_block = instance_create(gachapon.x, gachapon.y + 220, obj_solidblocksized);
    with (gacha_block)
    {
        image_xscale = 5;
        image_yscale = 2;
    }
    prompt_text = "";
    var _vending_readable = instance_create(_vending_marker.x + 8, _vending_marker.y + 40, obj_readable_room1);
    with (_vending_readable)
    {
        extflag = "vending";
        image_xscale = 2;
        image_yscale = 2;
    }
    var _vending_block = instance_create(_vending_marker.x, _vending_marker.y, obj_solidblocksized);
    with (_vending_block)
    {
        image_xscale = 1.5;
        image_yscale = 2;
    }
    var _sign = instance_create(145, 411, obj_npc_sign);
    with (_sign)
    {
        scr_depth();
        extflag = "gacha_instructions";
    }
    
    show_vending_prompt = function()
    {
        gacha_con = 0;
    };
    
    start_gacha_event = function()
    {
        gacha_active = true;
        with (obj_ch3_gachapon)
        {
            con = 0;
            dispense = 1;
        }
    };
    
    finish_gacha_event = function()
    {
        gacha_active = false;
        with (obj_ch3_gachapon)
            con = -1;
        regain_control();
    };
    
    regain_control = function()
    {
        if (gacha_active)
            finish_gacha_event();
        else
            gacha_con = 90;
    };
    
    gachacost = 100;
    numentry = 0;
    siner = 0;
    bgalpha = 0;
    controltext1 = 0;
    controltext2 = 0;
}
else if (global.entrance == 5)
{
    with (obj_caterpillarchara)
        visible = false;
}
shine = -4;
if (global.flag[1226] == 1)
{
    if (global.flag[1092] == 5)
    {
        show_debug_message_concat("yes");
        shine = instance_create(245, 305, obj_trigger_interact);
        with (shine)
        {
            sprite_index = spr_shine_white;
            scr_darksize();
            image_speed = 0.2;
            image_alpha = 1;
            visible = true;
            scr_depth();
            depth += 5000;
        }
    }
}
if (global.entrance != 5)
    scr_musicer("greenroom_detune.ogg");
