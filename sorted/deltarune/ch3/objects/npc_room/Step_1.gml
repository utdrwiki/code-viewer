if (init == 0)
{
    init = 1;
    if (room == room_dw_teevie_dust_south)
    {
        if (scr_enemylostcheck("shuttah"))
            instance_destroy();
    }
    if (room == room_dw_b3bs_cooltrashy)
    {
        scr_darksize();
        if (extflag == "trashy")
            sprite_index = spr_ch3_b3bs_cooltrashy_shades;
        if (extflag == "ribbick")
            sprite_index = spr_ribbick_small;
    }
    if (room == room_dw_ch3_man)
    {
        if (extflag == "rudinn1" || extflag == "rudinn2" || extflag == "rudinn3" || extflag == "rudinn4" || extflag == "rudinn5" || extflag == "rudinn6")
        {
            sprite_index = choose(spr_board_rudinn_blue, spr_board_rudinn_yellow);
            image_index = 0;
            image_speed = 0;
        }
        if (extflag == "rudinn3")
            sprite_index = spr_board_rudinn_pink;
        if (extflag == "binos")
            sprite_index = spr_board_binos;
        if (extflag == "sign1" || extflag == "sign2" || extflag == "sign3" || extflag == "sign4")
            sprite_index = spr_board_sign_dmg;
        scr_depth();
    }
    if (room == room_dw_b3bs_cheaterpippins)
    {
        sprite_index = spr_npc_pippins;
        scr_depth();
    }
    if (room == room_dw_b3bs_watercooler)
        sprite_index = spr_npc_zapper;
    if (room == room_dw_b3bs_zapper_b)
    {
        if (extflag == "watercooler")
            sprite_index = spr_b3bs_watercooler;
    }
    if (room == room_dw_b3bs_jail1)
    {
        if (extflag == "sam")
            sprite_index = spr_npc_gouldensamFaceOnly;
        if (extflag == "starwalker")
            sprite_index = spr_npc_originalstarwalker;
        if (extflag == "jailpippins" || extflag == "freepippins")
            sprite_index = spr_npc_pippins;
        if (extflag == "shadowguy")
            sprite_index = spr_shadowman_sax_a;
    }
    if (room == room_dw_b3bs_sadshadowguys)
    {
        if (extflag == "poppins")
            sprite_index = spr_npc_pippins;
    }
}
var objInd = 1156;
if (global.chapter == 3 && room == room_dw_ch3_man)
    objInd = 184;
if (normalanim == 1)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        if (objInd.halt == 0)
            image_speed = remanimspeed;
    }
}
if (normalanim == 1 || normalanim == 2)
{
    if (myinteract == 0)
    {
        image_index = 0;
        image_speed = 0;
    }
}
if (normalanim == 3)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
            image_speed = remanimspeed;
        if (objInd.halt == 0)
            image_speed = remanimspeed / 2;
    }
    else
    {
        image_speed = remanimspeed;
    }
}
if (normalanim == 4)
{
    image_index = 0;
    image_speed = 0;
}
if (normalanim == 5)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        image_speed = 0;
        image_index = 1;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}
if (normalanim == 6)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        if (objInd.halt == 0)
        {
            image_speed = 0;
            image_index = 1;
        }
    }
}
