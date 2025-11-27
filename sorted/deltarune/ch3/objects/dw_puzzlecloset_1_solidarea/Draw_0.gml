var sword = global.flag[1055];
if (global.flag[1091] == 0)
{
    if (i_ex(obj_board_swordhitbox))
        global.flag[1091] = 1;
}
with (trigger)
    other.pressed = place_meeting(x, y, obj_board_solid);
var drawcorner = true;
if (i_ex(swordswitch))
{
    pressed = swordswitch.switchstate;
    drawcorner = false;
}
var smokecolor = 12446975;
if (pressed == 0)
{
    formation = 0;
    if (pressinit == 0)
    {
        snd_play(snd_board_splash);
        for (var i = 0; i < 3; i++)
        {
            with (instance_create(x + (i * 32), y, obj_board_smokepuff))
                image_blend = smokecolor;
            with (instance_create(x + (i * 32), y + 32 + 16, obj_board_smokepuff))
                image_blend = smokecolor;
        }
        for (var i = 0; i < 2; i++)
        {
            with (instance_create(x + (i * 32), y + 96, obj_board_smokepuff))
                image_blend = smokecolor;
        }
        pressinit = 1;
    }
}
if (pressed == 1)
{
    if (pressinit == 1)
    {
        snd_play(snd_board_splash);
        pressinit = 0;
        for (var i = 0; i < 3; i++)
        {
            with (instance_create(x + (i * 32), y, obj_board_smokepuff))
                image_blend = smokecolor;
            with (instance_create(x + (i * 32), y + 32 + 16, obj_board_smokepuff))
                image_blend = smokecolor;
        }
        for (var i = 0; i < 2; i++)
        {
            with (instance_create(x + (i * 32), y + 96, obj_board_smokepuff))
                image_blend = smokecolor;
        }
    }
    formation = 1;
}
if (susieexistsed == 0)
{
    if (i_ex(obj_mainchara_board))
        susieexistsed = 1;
}
if (neverpressed == 0 && view_current == 1 && susieexistsed == 1)
{
    if (formation == 1)
        neverpressed = 1;
    else
        nopresstimer++;
}
if (formation == 1)
    draw_sprite_ext(spr_dw_puzzlecloset_1_solidarea, formation, x, y, 2, 2, 0, c_white, 1);
if (drawcorner)
    draw_sprite_ext(spr_dw_puzzlecloset_mysterytile, 0, trigger.x, trigger.y, 2, 2, 0, c_white, 1);
if (neverpressed == 0 && nopresstimer > 1200)
{
    var amt = round(abs(sin(nopresstimer / 15) * 4)) / 8;
    var col = merge_color(#FEEA88, #F37432, amt);
    draw_sprite_ext(spr_pxwhite, 0, trigger.x + 8, trigger.y + 8, 16, 14, 0, col, 1);
    draw_sprite_ext(spr_pxwhite, 0, trigger.x + 8 + 2, trigger.y + 8 + 2, 12, 10, 0, #F37432, 1);
}
if (everpressed == 0 && pressed == 1)
    everpressed = 1;
