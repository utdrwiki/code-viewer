with (shadow)
{
    x = obj_mainchara_ch1.x
    sprite_index = obj_mainchara_ch1.sprite_index
    image_index = obj_mainchara_ch1.image_index
    y = (192 - obj_mainchara_ch1.y)
    if (obj_mainchara_ch1.sprite_index == spr_krisd_ch1)
        sprite_index = spr_krisu_ch1
    if (obj_mainchara_ch1.sprite_index == spr_krisu_ch1)
        sprite_index = spr_krisd_ch1
    if (obj_mainchara_ch1.sprite_index == spr_krisl_ch1)
        sprite_index = spr_krisl_ch1
    if (obj_mainchara_ch1.sprite_index == spr_krisr_ch1)
        sprite_index = spr_krisr_ch1
}
