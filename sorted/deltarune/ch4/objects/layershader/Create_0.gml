if (targetLayer != "self")
    layer = layer_get_id(targetLayer);
if (myShader == 24)
{
    textureSprite1 = 2081;
    sampler1 = shader_get_sampler_index(myShader, "sampler_1");
    textureSprite2 = 4679;
    sampler2 = shader_get_sampler_index(myShader, "sampler_2");
    uniformTime = shader_get_uniform(myShader, "time");
    uniformOpacity = shader_get_uniform(myShader, "opacity");
    uniformCol = shader_get_uniform(myShader, "col");
    
    startFunc = function()
    {
        if (event_type == ev_draw && event_number == 0)
        {
            var _tex1 = sprite_get_texture(IMAGE_DEPTH_EXTEND_MONO_SEAMLESS_POW2, 0);
            var _tex2 = sprite_get_texture(textureSprite2, 0);
            shader_set(myShader);
            shader_set_uniform_f(uniformTime, (get_timer() / 1000000) * 15);
            shader_set_uniform_f(uniformOpacity, opacity);
            shader_set_uniform_f(uniformCol, colour[0], colour[1], colour[2]);
            texture_set_stage(sampler1, _tex1);
            texture_set_stage(sampler2, _tex2);
        }
    };
}

endFunc = function()
{
    shader_reset();
};

layer_script_begin(layer, startFunc);
layer_script_end(layer, endFunc);
instance_destroy();
