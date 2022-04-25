oldway = true
yy = 0
topy = 100
siner++
draw_set_color(c_white)
scr_84_set_draw_font("main")
cy = cameray()
if oldway
{
    i = IMAGE_LOGO
    starti = round((sy / 480))
    displaymode = true
    if (displaymode == false)
    {
        i = IMAGE_LOGO
        while (i < myLastSprite)
        {
            if ((yy + sy) > (cy - 200) && (yy + sy) < (cy + 700))
            {
                draw_sprite_ext(mySprite[i], (siner / 5), 100, (((yy + topy) + sy) + 5), 2, 2, 0, c_white, 1)
                draw_set_color(c_black)
                draw_text(22, (((yy + topy) + sy) - 5), mySpriteName[i])
                draw_set_color(c_white)
                draw_text(20, (((yy + topy) + sy) - 3), mySpriteName[i])
                yy += ((mySpriteHeight[i] * 2) + 10)
                i++
                continue
            }
            else if ((yy + sy) > (cy + 700))
                break
            else
            {
                yy += ((mySpriteHeight[i] * 2) + 10)
                i++
                continue
            }
        }
    }
    i = -1
    if (displaymode == true)
    {
        while (i < myLastSprite)
        {
            if ((yy + sy) > (cy - 200) && (yy + sy) < (cy + 700))
            {
                for (j = 0; j < 3; j++)
                {
                    if (i < (myLastSprite - 1))
                        i++
                    draw_sprite_ext(mySprite[i], (siner / 5), (100 + (j * 130)), (((yy + topy) + sy) + 5), 2, 2, 0, c_white, 1)
                    if point_in_rectangle(mouse_x, mouse_y, ((j * 130) + 100), (((yy + topy) + sy) + 5), ((j * 130) + 200), ((((yy + topy) + sy) + 5) + 80))
                    {
                        draw_set_color(c_red)
                        draw_text(((j * 130) + 100), (((yy + topy) + sy) - 15), mySpriteName[i])
                        draw_set_color(c_white)
                        draw_text(((j * 130) + 100), (((yy + topy) + sy) - 17), mySpriteName[i])
                    }
                }
            }
            else
                i += 3
            yy += 100
            if (i >= (myLastSprite - 1))
                break
            else
                continue
        }
        draw_sprite(spr_maus_cursor, 0, mouse_x, mouse_y)
    }
    draw_text(0, 0, ((((string(sy) + " ") + string(yy)) + " ") + string((sy + yy))))
    if keyboard_check(vk_down)
        sy -= 30
    if keyboard_check(vk_up)
        sy += 30
    if keyboard_check(vk_right)
        sy -= 120
    if keyboard_check(vk_left)
        sy += 120
    if keyboard_check_pressed(vk_pageup)
        sy = IMAGE_LOGO
    if keyboard_check(vk_pagedown)
        sy -= 480
    if mouse_wheel_down()
        sy -= 200
    if mouse_wheel_up()
        sy += 200
}
if (!oldway)
{
    yy = 0
    if (sy < IMAGE_LOGO)
        sy = IMAGE_LOGO
    var last = (sy + 15)
    if (last > (myLastSprite - 1))
        last = (myLastSprite - 1)
    for (i = sy; i < last; i++)
    {
        draw_sprite_ext(mySprite[i], (siner / 5), 100, (yy + topy), 2, 2, 0, c_white, 1)
        draw_set_color(c_black)
        draw_text(22, ((yy + topy) - 6), mySpriteName[i])
        draw_set_color(c_white)
        draw_text(20, ((yy + topy) - 7), mySpriteName[i])
        yy += (mySpriteHeight[i] + 10)
        if ((i + 1) < last)
        {
            i++
            draw_sprite_ext(mySprite[i], (siner / 5), 400, (yy + topy), 2, 2, 0, c_white, 1)
            draw_set_color(c_black)
            draw_text(322, ((yy + topy) - 6), mySpriteName[i])
            draw_set_color(c_white)
            draw_text(320, ((yy + topy) - 7), mySpriteName[i])
            yy += (mySpriteHeight[i] + 10)
        }
    }
    if (keyboard_check(vk_up) && (siner % 6) == 0)
        sy -= 2
    if (keyboard_check(vk_down) && (siner % 6) == 0)
        sy += 2
    if keyboard_check(vk_left)
        sy -= 2
    if keyboard_check(vk_right)
        sy += 2
    if keyboard_check_pressed(vk_pageup)
        sy = 0
    if keyboard_check(vk_pagedown)
        sy = (myLastSprite - 1)
    if (sy < 0)
        sy = 0
    if (sy > (myLastSprite - 2))
        s = (myLastSprite - 2)
}
if keyboard_check_pressed(ord("F"))
{
    sy = 0
    myLastSprite = IMAGE_LOGO_CENTER
    mySprite[0] = spr_susie_chomp
    mySpriteName[0] = "Nothing found."
    var spriteCount = IMAGE_LOGO
    var findString = get_string("Search term!", "")
    for (i = IMAGE_LOGO; i < lastSprite; i++)
    {
        if (string_pos(findString, spriteName[i]) > 0)
        {
            mySprite[spriteCount] = i
            mySpriteName[spriteCount] = spriteName[i]
            mySpriteHeight[spriteCount] = spriteHeight[i]
            spriteCount++
            myLastSprite++
        }
    }
}
if keyboard_check_pressed(ord("D"))
{
    sy = 0
    found = 0
    spriteCount = IMAGE_LOGO
    findString = get_string("Search in your search!", "")
    for (i = 0; i <= myLastSprite; i++)
    {
        if (string_pos(findString, mySpriteName[i]) > 0)
        {
            found = 1
            mySprite[spriteCount] = mySprite[i]
            mySpriteName[spriteCount] = mySpriteName[i]
            mySpriteHeight[spriteCount] = mySpriteHeight[i]
            spriteCount++
        }
    }
    if (found == 0)
    {
        mySprite[0] = spr_susie_chomp
        mySpriteName[0] = "Nothing found."
        myLastSprite = IMAGE_LOGO_CENTER
    }
    else
        myLastSprite = spriteCount
}
draw_set_color(c_red)
draw_text((camerax() + 400), 80, "Arrows/Pageup/Pagedown: Move\nF: Search all sprites!\nD: Search again in current sprites!\nMouseover for names.")
