sign_sprite = scr_84_get_sprite("spr_city_mice_sign_01")
if (room == room_dw_city_mice2)
    sign_sprite = scr_84_get_sprite("spr_city_mice_sign_02")
else if (room == room_dw_city_mice3)
    sign_sprite = scr_84_get_sprite("spr_city_mice_sign_03")
if (sign_sprite == scr_84_get_sprite("spr_city_mice_sign_01") && global.plot >= 72)
    instance_destroy()
if (sign_sprite == scr_84_get_sprite("spr_city_mice_sign_02") && global.plot >= 77)
    instance_destroy()
if (sign_sprite == scr_84_get_sprite("spr_city_mice_sign_03") && global.plot >= 78)
    instance_destroy()
start = 0
sign_alpha = 0
fade_in = 0
fade_out = 0
finish = 0
fade_counter = 0
layer_amount = 4
current_index = 0
scr_depth()
