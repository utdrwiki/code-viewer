scr_spritecenter_y = function(argument0) //gml_Script_scr_spritecenter_y
{
    var _spriteCenterLen = point_distance(0, 0, (argument0.sprite_width / 2), argument0.sprite_height)
    var _spriteCenterDir = point_direction(0, 0, (argument0.sprite_width / 2), argument0.sprite_height)
    return (argument0.y + lengthdir_y(_spriteCenterLen, (_spriteCenterDir + argument0.image_angle)));
}

