makecolorset = function(arg0, arg1, arg2, arg3)
{
    return 
    {
        r: arg0,
        g: arg1,
        b: arg2,
        l: arg3
    };
};

makegradientset = function(arg0, arg1)
{
    return 
    {
        t: arg0,
        b: arg1
    };
};

con = 0;
bgsurface = surface_create(640, 480);
windowsurface = surface_create(302, 122);

draw_to_window = function(arg0)
{
    with (arg0)
        draw_self();
};

delay = 0;
hammeralpha = 0;
cityalpha = 0;
to_draw = ds_list_create();
window_opacity = 1;

create_object_to_draw = function(arg0, arg1, arg2)
{
    var obj = instance_create(arg0, arg1, obj_marker_fancy);
    with (obj)
    {
        scr_darksize();
        sprite_index = arg2;
        
        draw_func = function()
        {
        };
    }
    ds_list_add(to_draw, obj);
    return obj;
};

timer = 0;
cityobj = create_object_to_draw(0, 0, 3079);
cityobj.image_alpha = 0;
cityobj.image_blend = c_black;
hammerobj = create_object_to_draw(100, 10, 530);
hammerobj.image_alpha = 0;
hammerobj.timer = 0;
with (hammerobj)
{
    step_func = function()
    {
        timer++;
        if (image_alpha > 0 && (timer % 12) == 0)
        {
            if (!i_ex(obj_dw_church_arena))
            {
                instance_destroy();
                exit;
            }
            else
            {
                image_blend = c_white;
            }
        }
    };
}
for (var i = 0; i < 10; i++)
{
    var petal = create_object_to_draw((i * 30) + random_range(0, 15), random_range(20, 120), 3578);
    petal.image_alpha = 0;
    petal.image_speed = random_range(0.125, 0.25);
    petal.image_blend = #323299;
    petal.direction = random_range(-15, 15);
    petal.timer = 0;
    with (petal)
    {
        step_func = function()
        {
            timer++;
            if (i_ex(obj_dw_church_arena_bg))
                image_alpha = obj_dw_church_arena_bg.staralpha * 0.8;
        };
    }
}
bellalpha = 0;
staralpha = 0;
petalalpha = 0;
depth = 500;
colors_default = makecolorset(3165210, 5163080, 201738, 2584886);
colors_cardcastle = makecolorset(4139303, 8667457, 2692114, 7819857);
colors_mansion = makecolorset(5959081, 13873450, 3483914, 11184674);
colors_teevie = makecolorset(4591889, 6697522, 3483683, 8931914);
colors_garden = makecolorset(4261519, 2992324, 2102325, 6663647);
colors_dark = makecolorset(3278918, 5910896, 2952729, 4850001);
colors_greenish = makecolorset(3165210, 5163080, 201738, 2584886);
bgcolors_default = makegradientset(3297554, 2381604);
bgcolors_cardcastle = makegradientset(7623249, 4790561);
bgcolors_cybercity = makegradientset(6478178, 14065681);
bgcolors_teevie = makegradientset(4591889, 7811634);
bgcolors_garden = makegradientset(52667135, 7410175);
bgcolors_dark = makegradientset(6422882, 2752785);
bgcolors_greenish = makegradientset(3297554, 2381604);
colors_index = 1;
colors_current = colors_default;
colors_last = colors_current;
colors_lerp = 0;
gradient_current = bgcolors_default;
gradient_last = gradient_current;
gradient_lerp = 0;
image_alpha = 0;

change_color_set = function(arg0)
{
    colors_index++;
    colors_last = colors_current;
    colors_current = arg0;
    colors_lerp = 0;
};

change_gradient_set = function(arg0)
{
    gradient_last = gradient_current;
    gradient_current = arg0;
    gradient_lerp = 0;
};

colcon = 0;
introflashalpha = 4;
uniform_red = shader_get_uniform(shd_rgb_replace, "in_red");
uniform_green = shader_get_uniform(shd_rgb_replace, "in_green");
uniform_blue = shader_get_uniform(shd_rgb_replace, "in_blue");

disappear = function()
{
    depth = 1000000;
    scr_lerpvar("image_blend", 16777215, 0, 15);
    scr_lerpvar("image_alpha", 1, 0, 15);
    scr_doom(self, 15);
};

myShader = 24;
textureSprite1 = 2081;
sampler1 = shader_get_sampler_index(myShader, "sampler_1");
textureSprite2 = 4679;
sampler2 = shader_get_sampler_index(myShader, "sampler_2");
uniformTime = shader_get_uniform(myShader, "time");
uniformOpacity = shader_get_uniform(myShader, "opacity");
uniformCol = shader_get_uniform(myShader, "col");
colour = [0.2588, 0.8157, 1];
