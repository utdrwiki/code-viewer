event_inherited()
con = 0
closetimer = 0
image_yscale = 2
blue = 0x000001
green = 2
yellow = 0x000003
orange = 4
red = 0x000005
current_pal = red
if (swatch_color != "")
{
    switch swatch_color
    {
        case "blue":
            current_pal = blue
            break
        case "green":
            current_pal = green
            break
        case "yellow":
            current_pal = yellow
            break
        case "orange":
            current_pal = orange
            break
        case "red":
            current_pal = red
            break
    }

}
sprite_palette = spr_swatchling_palette
color_init = 0
new_color = c_black
base_colors[0] = blue
base_colors[1] = red
base_colors[2] = yellow
