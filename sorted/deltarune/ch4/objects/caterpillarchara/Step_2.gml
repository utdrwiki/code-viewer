if (scr_debug())
{
    if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("N")))
    {
        target--;
        debug_message("name:" + name + " | target=" + string(target));
    }
}
if (!init)
{
    ignoredepth = 0;
    init = 1;
}
if (name != "susie" && !sprite_init)
{
    sprite_init = true;
    if (name == "noelle")
    {
        usprite = (global.darkzone == 1) ? spr_noelle_walk_up_dw : spr_noelle_walk_up_lw;
        rsprite = (global.darkzone == 1) ? spr_noelle_walk_right_dw : spr_noelle_walk_right_lw;
        lsprite = (global.darkzone == 1) ? spr_noelle_walk_left_dw : spr_noelle_walk_left_lw;
        dsprite = (global.darkzone == 1) ? spr_noelle_walk_down_dw : spr_noelle_walk_down_lw;
    }
    if (name == "ralsei")
        climbsprite = 4837;
}
if (!ignoredepth)
{
    if (name == "susie")
    {
        if (scr_havechar("no") && global.darkzone == 0)
            target = 8;
        halign = (global.darkzone == 0) ? 3 : 6;
        valign = (global.darkzone == 0) ? 6 : 16;
        if (room == room_dw_castle_town)
        {
            if (scr_flag_get(793) == 1)
            {
                valign = 20;
                y = remy[target] - valign;
            }
        }
    }
}
if (name == "noelle")
{
    usprite = (global.darkzone == 1) ? spr_noelle_walk_up_dw : spr_noelle_walk_up_lw;
    rsprite = (global.darkzone == 1) ? spr_noelle_walk_right_dw : spr_noelle_walk_right_lw;
    lsprite = (global.darkzone == 1) ? spr_noelle_walk_left_dw : spr_noelle_walk_left_lw;
    dsprite = (global.darkzone == 1) ? spr_noelle_walk_down_dw : spr_noelle_walk_down_lw;
    if (global.darkzone == 0)
        target = scr_havechar("su") ? 17 : 12;
    halign = (global.darkzone == 0) ? 2 : 4;
    valign = (global.darkzone == 0) ? 9 : 18;
}
if (name == "ralsei")
{
    slidesprite = spr_ralsei_slide;
    climbsprite = 4837;
    halign = 2;
    valign = 12;
    if (global.chapter == 4)
    {
        if (sprite_index == spr_ralsei_splat_caterpillar)
            halign = 12;
        if (room == room_dw_castle_town)
        {
            if (scr_flag_get(793) == 1)
            {
                if (sprite_index == spr_ralsei_walk_left)
                    halign -= 12;
                if (sprite_index == spr_ralsei_walk_right)
                    halign += 12;
                valign = 16;
                y = remy[target] - valign;
            }
        }
    }
}
if (!ignoredepth)
{
    scr_depth();
    depth += 5;
    if (name == "ralsei")
        depth -= 80;
    if (name == "ralsei")
    {
        if (global.chapter == 4)
        {
            if (sprite_index == spr_ralsei_splat_caterpillar)
                depth += 100;
        }
    }
    if (name == "susie" && global.darkzone == 1)
        depth -= 60;
    if (name == "noelle")
        depth += 10;
}
nowx = x;
nowy = y;
moved = 0;
walk = 0;
runmove = 0;
slided = 0;
if (obj_mainchara.x != remx[0])
    moved = 1;
if (obj_mainchara.y != remy[0])
    moved = 1;
if (sliding[target] == 1)
    moved = 1;
if (moved == 1 && follow == 1)
{
    blushtimer = 0;
    for (i = 75; i > 0; i -= 1)
    {
        remx[i] = remx[i - 1];
        remy[i] = remy[i - 1];
        facing[i] = facing[i - 1];
        sliding[i] = sliding[i - 1];
        if (global.chapter == 4)
            special[i] = special[i - 1];
    }
    remx[0] = obj_mainchara.x;
    remy[0] = obj_mainchara.y;
    sliding[0] = obj_mainchara.sliding;
    facing[0] = global.facing;
    if (global.chapter == 4)
        special[0] = obj_mainchara.climbing;
    x = remx[target] - halign;
    y = remy[target] - valign;
    if (sliding[target] == 1)
    {
        x = remx[target];
        y = remy[target];
        sprite_index = slidesprite;
        slided = 1;
    }
    if (special[target] == 1 && global.chapter == 4)
    {
        sprite_index = climbsprite;
        specialed = 1;
    }
    else
    {
        specialed = 0;
    }
    if (abs(remx[target + 1] - remx[target]) > 4)
        runmove = 1;
    if (abs(remy[target + 1] - remy[target]) > 4)
        runmove = 1;
    dir = facing[target];
}
if (x != nowx)
    walk = 1;
if (y != nowy)
    walk = 1;
if (walk == 1)
    walkbuffer = 6;
if (walkbuffer > 3 && fun == 0)
{
    walktimer += 1.5;
    if (runmove == 1)
        walktimer += 1.5;
    if (walktimer >= 40)
        walktimer -= 40;
    if (walktimer < 10)
        image_index = 0;
    if (walktimer >= 10)
        image_index = 1;
    if (walktimer >= 20)
        image_index = 2;
    if (walktimer >= 30)
        image_index = 3;
}
if (walkbuffer <= 0 && fun == 0)
{
    if (walktimer < 10)
        walktimer = 9.5;
    if (walktimer >= 10 && walktimer < 20)
        walktimer = 19.5;
    if (walktimer >= 20 && walktimer < 30)
        walktimer = 29.5;
    if (walktimer >= 30)
        walktimer = 39.5;
    image_index = 0;
}
walkbuffer -= 0.75;
if (fun == 0 && slided == 0 && specialed == 0)
{
    if (facing[target] == 0)
        sprite_index = dsprite;
    if (facing[target] == 1)
        sprite_index = rsprite;
    if (facing[target] == 2)
        sprite_index = usprite;
    if (facing[target] == 3)
        sprite_index = lsprite;
}
if ((dsprite == spr_ralseid || dsprite == spr_ralsei_walk_down) && global.interact == 0 && fun == 0)
{
    distfrommcx = obj_mainchara.x - (x + 2);
    distfrommcy = obj_mainchara.y - (y + 12);
    if (abs(distfrommcy) <= 14 && abs(distfrommcx) <= 20)
    {
        if (distfrommcx <= 0 && global.facing == 1)
            blushtimer += 1;
        if (distfrommcx >= 0 && global.facing == 3)
            blushtimer += 1;
    }
    else
    {
        blushtimer = 0;
    }
    if (blushtimer >= 300)
    {
        if (sprite_index == dsprite)
            sprite_index = dsprite_blush;
        if (sprite_index == rsprite)
            sprite_index = rsprite_blush;
        if (sprite_index == usprite)
            sprite_index = usprite_blush;
        if (sprite_index == lsprite)
            sprite_index = lsprite_blush;
    }
}
else
{
    blushtimer = 0;
}
if (name == "ralsei")
{
    if (sprite_index == dsprite)
        depth += 20;
    if (global.chapter == 4)
    {
        if (!init_clothes && i_ex(obj_ch4_PDC06) && scr_flag_get(706) == 1)
        {
            init_clothes = true;
            dsprite = spr_ralsei_splat_caterpillar;
            rsprite = spr_ralsei_splat_caterpillar;
            lsprite = spr_ralsei_splat_caterpillar;
            usprite = spr_ralsei_splat_caterpillar;
        }
        if (room == room_dw_church_glass && global.plot < 120)
        {
            rsprite = spr_ralsei_walk_right_unhappy;
            dsprite = spr_ralsei_walk_down_unhappy;
            lsprite = spr_ralsei_walk_left_unhappy;
        }
        if (room == room_dw_church_jackenstein && global.plot >= 170 && global.plot < 190)
        {
            rsprite = spr_ralsei_walk_right_unhappy;
            dsprite = spr_ralsei_walk_down_unhappy;
            lsprite = spr_ralsei_walk_left_unhappy;
        }
        if (room == room_dw_churchc_titanclimb1_post || room == room_dw_churchc_titanclimb2_post)
        {
            rsprite = spr_ralsei_walk_right_unhappy;
            dsprite = spr_ralsei_walk_down_unhappy;
            lsprite = spr_ralsei_walk_left_unhappy;
        }
    }
}
if (name == "susie")
{
    if (global.chapter == 4)
    {
        if (!init_clothes && global.darkzone == 0)
        {
            init_clothes = true;
            if (global.plot >= 11 && global.plot < 35)
            {
                dsprite = spr_susie_walk_down_church;
                rsprite = spr_susie_walk_right_church;
                lsprite = spr_susie_walk_left_church;
                usprite = spr_susie_walk_up_church;
            }
            else
            {
                usprite = spr_susie_walk_up_lw;
                rsprite = spr_susie_walk_right_lw;
                lsprite = spr_susie_walk_left_lw;
                dsprite = spr_susie_walk_down_lw;
                if (global.plot >= 220)
                {
                    rsprite = spr_susie_walk_right_lw_unhappy;
                    dsprite = spr_susie_walk_down_lw_unhappy;
                    lsprite = spr_susie_walk_left_lw_unhappy;
                }
            }
        }
        if (global.darkzone == 1)
        {
            if (room == room_dw_castle_town)
            {
                if (scr_flag_get(793) == 1)
                {
                    dsprite = spr_susie_lancer_carry_walk_down;
                    rsprite = spr_susie_lancer_carry_walk_right;
                    lsprite = spr_susie_lancer_carry_walk_left;
                    usprite = spr_susie_lancer_carry_walk_up;
                    depth += 135;
                }
            }
            if (room == room_dw_church_glass && global.plot < 120)
            {
                rsprite = spr_susie_walk_right_dw_unhappy;
                dsprite = spr_susie_walk_down_dw_unhappy;
                lsprite = spr_susie_walk_left_dw_unhappy;
            }
            if (room == room_dw_church_jackenstein && global.plot >= 170 && global.plot < 190)
            {
                rsprite = spr_susie_walk_right_dw_unhappy;
                dsprite = spr_susie_walk_down_dw_unhappy;
                lsprite = spr_susie_walk_left_dw_unhappy;
            }
            if (room == room_dw_churchc_titanclimb1_post || room == room_dw_churchc_titanclimb2_post)
            {
                rsprite = spr_susie_walk_right_dw_unhappy;
                dsprite = spr_susie_walk_down_dw_unhappy;
                lsprite = spr_susie_walk_left_dw_unhappy;
            }
        }
        else if (global.chapter == 4 && room == room_krishallway)
        {
            if (i_ex(obj_hallway_mirror))
            {
                var _sprite_index = sprite_index;
                var _sprite_d = dsprite;
                var _sprite_u = usprite;
                var _image_index = image_index;
                var _x = x;
                var _y = y;
                with (obj_hallway_mirror)
                {
                    if (shadow_susie != -4)
                    {
                        with (shadow_susie)
                        {
                            x = _x;
                            sprite_index = _sprite_index;
                            image_index = _image_index;
                            y = 180 - _y;
                            if (_sprite_index == _sprite_d)
                                sprite_index = _sprite_u;
                            if (_sprite_index == _sprite_u)
                                sprite_index = _sprite_d;
                        }
                        if ((shadow_susie.y + 6) < shadow.y)
                            shadow_susie.depth = shadow.depth + 10;
                        else
                            shadow_susie.depth = shadow.depth - 10;
                    }
                }
            }
        }
    }
}
with (obj_mouse_hat)
{
    if (linked_char == other.id)
    {
        var _xoff = 0;
        var _yoff = 0;
        if (linked_char.object_index == obj_caterpillarchara)
        {
            switch (linked_char.name)
            {
                case "susie":
                    _yoff = 4;
                    _xoff = 7;
                    if (sprite_index == spr_treasurebox)
                        _xoff = 10;
                    break;
                case "ralsei":
                    _yoff = 12;
                    _xoff = 7;
                    if (sprite_index == spr_treasurebox)
                        _xoff = 10;
                    break;
            }
        }
        if (linked_char.facing[linked_char.target] == 1)
            image_xscale = -2;
        if (linked_char.facing[linked_char.target] == 3)
            image_xscale = 2;
        _xoff = -_xoff * image_xscale;
        x = linked_char.x + _xoff + (linked_char.sprite_width / 2);
        y = ((linked_char.y + _yoff) - 28) + sin(linked_char.image_index * 2);
        with (linked_char)
        {
            if (name == "ralsei")
                depth += 1;
        }
        depth = linked_char.depth - 1;
    }
}
