layer_set_visible("debug_assets", 0);
music = instance_create(x, y, obj_music_worship);
init = 0;
tcon = 0;
read = 0;
encounterflag = 1786;
encounterno = 156;
enemy = -4;
siner = 0;
timer = 0;
econ = 0;
organicstatue = scr_marker_ext(440, 158, spr_organ_enemy_petrified, 2, 2, undefined, undefined, undefined, undefined, 1);
if (room == room_dw_churchb_worshiproom)
    organicstatue.sprite_index = spr_organ_enemy;
organtriggerint = instance_create(452, 244, obj_trigger_interact);
organtriggerint.issolid = true;
organtriggerint.strict = true;
organtriggerint.talked = 0;
scr_size(3.375, 2.3125, organtriggerint);
layerarray = layer_get_all();
shelvesinit = 0;
sprite_array_size = -1;
layersprite = [];
for (var i = 0; i < array_length(layerarray); i++)
{
    if (layer_get_name(layerarray[i]) == "spr_wafers")
    {
        elements = layer_get_all_elements(layerarray[i]);
        for (var j = 0; j < array_length(elements); j++)
        {
            if (layer_get_element_type(elements[j]) == 4)
            {
                sprite_array_size++;
                layersprite[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_marker);
                layersprite[sprite_array_size].sprite_index = layer_sprite_get_sprite(elements[j]);
                layersprite[sprite_array_size].image_index = layer_sprite_get_index(elements[j]);
                with (layersprite[sprite_array_size])
                {
                    if (room == room_dw_churchb_worshiproom)
                        sprite_index = spr_npc_church_wafer_statue;
                    scr_size(2, 2);
                    if (x < 478)
                        scr_size(-2);
                    scr_depth_alt();
                    image_speed = 0.25;
                    image_index = x;
                    if (y >= 202)
                        scr_marker_ext(x, y + 8, sprite_index, image_xscale, image_yscale, image_speed, image_index, c_black, depth - 1);
                }
                layer_sprite_destroy(elements[j]);
            }
        }
        break;
    }
}
depth = 999990;
var _depth = 96750;
leftmarker = scr_marker_ext(0, 0, spr_pxwhite, 360, room_height, 0, undefined, c_black, _depth, undefined, undefined, 0.5);
leftmarker = scr_marker_ext(600, 0, spr_pxwhite, 360, room_height, 0, undefined, c_black, _depth, undefined, undefined, 0.5);
enemarker = -4;
if (global.flag[encounterflag] == 0)
{
    if (room == room_dw_churchb_worshiproom)
    {
        econ = 1;
        var src = organicstatue;
        enemarker = scr_marker_ext(src.x, src.y, src.sprite_index, src.image_xscale, src.image_yscale, undefined, undefined, undefined, undefined, 1);
        with (enemarker)
        {
            auraalph = 0;
            drawsiner = 0;
            movespeed = 0;
            con = 0;
            timer = 0;
        }
        setxy(room_width * 2, y, organicstatue);
        setxy(room_width * 2, y, organtriggerint);
    }
}
if (global.flag[encounterflag] == 1)
{
    setxy(room_width * 2, y, organicstatue);
    setxy(room_width * 2, y, organtriggerint);
}
if (global.plot >= 242)
{
    organicstatue.sprite_index = spr_npc_organik_0_talk_differentrobe;
    organicstatue.image_speed = 0;
}
if (scr_debug())
{
    if (keyboard_check(ord("1")))
    {
        debug_print("First visit");
        global.plot = 0;
        room_goto(room_dw_church_worshiproom);
    }
    if (keyboard_check(ord("2")))
    {
        debug_print("Church B Visit");
        global.plot = 0;
        room_goto(room_dw_churchb_worshiproom);
        global.flag[encounterflag] = 0;
    }
    if (keyboard_check(ord("3")))
    {
        debug_print("Church C, No Violence");
        global.plot = 242;
        room_goto(room_dw_church_worshiproom);
        global.flag[encounterflag] = 0;
    }
    if (keyboard_check(ord("4")))
    {
        debug_print("Church C, Violence Used");
        global.plot = 242;
        room_goto(room_dw_church_worshiproom);
        global.flag[encounterflag] = 1;
    }
}
