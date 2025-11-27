count = 22;
timer = 0;
con = 0;
init = 0;
minstack = 8;
stack = 8;
stacksize = stack;
maxstack = 20;
image_speed = 0;
scr_darksize();
onboard = false;
scr_depth_alt();
extended = false;
roomtarg = room;
cupmarker = 0;
remalpha = -1;
cutscene_mode = true;
if (global.interact == 7 && global.tempflag[93] == 1)
{
    con = 10;
    timer = 0;
    global.interact = 1;
}
sumarker = 0;
ramarker = 0;
sustayvis = false;
rastayvis = false;
krstayvis = false;
dofade = false;
siner = 0;
sine_interval = 1;
anim = 0;
jack_index = 0;
var recruit_ids = scr_get_chapter_recruit_data(4);
var recruited_list = [];
recruited_sprites = [];
sprite_heights = [];
for (var i = 0; i < array_length(recruit_ids); i++)
{
    if (global.flag[recruit_ids[i] + 600] == 1)
        recruited_list[array_length(recruited_list)] = recruit_ids[i];
}
total_height = 0;
for (var i = 0; i < array_length(recruited_list); i++)
{
    scr_recruit_info(recruited_list[i]);
    var recruit_sprite = _sprite;
    if (_sprite == spr_npc_halo_bat)
        recruit_sprite = 4188;
    recruited_sprites[array_length(recruited_sprites)] = recruit_sprite;
    var height = (sprite_get_height(recruit_sprite) * 2) - 20;
    if (_sprite == spr_npc_guei)
        height -= 20;
    else if (_sprite == spr_holywater_idle)
        height -= 10;
    sprite_heights[array_length(sprite_heights)] = height;
    total_height += height;
}
if (array_length(recruited_list) > 0 && scr_flag_get(254) > 0)
{
    var recruit_sprite = 266;
    recruited_sprites[array_length(recruited_sprites)] = recruit_sprite;
    var height = (sprite_get_height(recruit_sprite) * 2) - 20;
    height -= 10;
    sprite_heights[array_length(sprite_heights)] = height;
    total_height += height;
}

get_total_height = function()
{
    return total_height + scr_even(24 * count) + 140 + 200;
};
