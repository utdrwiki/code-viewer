scr_tb_make = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_tb_make
{
    var _mytbullet = instance_create(x, (y - argument0), obj_teacup_bullet)
    with (_mytbullet)
    {
        spin = argument1
        spinrate = argument2
        hitType = argument3
        master = other.id
        if (hitType == 1)
        {
            colClose = c_fuchsia
            colFar = 16711680
            image_blend = c_fuchsia
        }
        if (hitType == 2)
        {
            colClose = c_lime
            colFar = 16711680
            image_blend = c_lime
        }
        if (hitType == 3)
        {
            colClose = 0xFF4040
            colFar = 8388608
            image_blend = colClose
        }
        if (hitType == 5)
        {
            image_blend = 0x3F557F
            colClose = image_blend
            colFar = image_blend
        }
        if (hitType == 4)
        {
            sprite_index = spr_teacup_bullet_big
            bulletCollisionAngle = 20
        }
        lineToCenter = argument4
        if (hitType == 3 || hitType == 5)
            lineToCenter = 0
        if (hitType == 1 || hitType == 2)
        {
            sprite_index = spr_teacup_bullet_good
            groundForgiveness = 1
            bulletCollisionAngle = 28
            bulletHitHeight = 80
        }
        spriteWidthRoot = sprite_get_width(sprite_index)
        spriteHeightRoot = sprite_get_width(sprite_index)
    }
    return _mytbullet;
}

