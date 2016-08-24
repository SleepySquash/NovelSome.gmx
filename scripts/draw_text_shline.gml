prevcolor = draw_get_colour();
shader_set(outline_text);        
shader_enable_corner_id(1);
var texture = font_get_texture(argument3);
var texel_width = texture_get_texel_width(texture);
var texel_height = texture_get_texel_height(texture);
draw_set_colour(c_white);
shader_set_uniform_f(global.Vtex_pixel_size,texel_width,texel_height);
draw_text(argument0,argument1,argument2)
shader_reset();
draw_set_colour(prevcolor);
