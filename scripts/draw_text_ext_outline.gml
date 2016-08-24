//draw_text_ext_outline
//Draw a outlined text (Extra)

draw_set_colour(argument5)
draw_text_ext_colour(argument1-1,argument2,argument0,argument3,argument4,argument6,argument6,argument6,argument6,draw_get_alpha())
draw_text_ext_colour(argument1+1,argument2,argument0,argument3,argument4,argument6,argument6,argument6,argument6,draw_get_alpha())
draw_text_ext_colour(argument1,argument2-1,argument0,argument3,argument4,argument6,argument6,argument6,argument6,draw_get_alpha())
draw_text_ext_colour(argument1,argument2+1,argument0,argument3,argument4,argument6,argument6,argument6,argument6,draw_get_alpha())

draw_set_colour(argument3)
draw_text_ext_colour(argument1,argument2,argument0,argument3,argument4,argument5,argument5,argument5,argument5,draw_get_alpha())
