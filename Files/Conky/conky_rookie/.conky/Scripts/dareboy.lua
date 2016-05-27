--[[ EQUALIZER WIDGET
	v1.0 by wlourf (10 Feb. 2010) and modifier by dareboy (29 Nov. 2014)
	This widget draw a simple bar like (old) equalizers on hi-fi systems.
	http://u-scripts.blogspot.com/
	
	The arguments are :
	- "name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
    - "arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. 
    	If you would not use an argument in the Conky variable, use ''.
	- "max" is the maximum value of the bar. If the Conky variable outputs a percentage, use 100.
	- "nb_blocks" is the umber of block to draw
	- "cap" id the cap of a block, possibles values are CAIRO_LINE_CAP_ROUND , CAIRO_LINE_CAP_SQUARE or CAIRO_LINE_CAP_BUTT
	  see http://www.cairographics.org/samples/set_line_cap/
	- "xb" and "yb" are the coordinates of the bottom left point of the bar
	- "w" and "h" are the width and the height of a block (without caps)
	- "space" is the space betwwen two blocks, can be null or negative
	- "bgc" and "bga" are background colors and alpha when the block is not LIGHT OFF
	- "fgc" and "fga" are foreground colors and alpha when the block is not LIGHT ON
	- "alc" and "ala" are foreground colors and alpha when the block is not LIGHT ON and ALARM ON
	- "alarm" is the value where blocks LIGHT ON are in a different color (values from 0 to 100)
	- "led_effect" true or false : to show a block with a led effect
	- "led_alpha" alpha of the center of the led (values from 0 to 1)
	- "smooth" true or false : colors in the bar has a smooth effect
	- "mid_color",mid_alpha" : colors of the center of the bar (mid_color can to be set to nil)
	- "rotation" : angle of rotation of the bar (values are 0 to 360 degrees). 0 = vertical bar, 90 = horizontal bar
	
]]
require 'cairo'

function equalizer(cr, xb, yb, name, arg, max, nb_blocks, cap, w, h, space, bgc, bga, fgc, fga,alc,ala,alarm,led_effect,led_alpha,smooth,mid_color,mid_alpha,rotation)

-- recoding function of color

 	local function rgb_to_r_g_b(colour, alpha)
		return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
	end
-- data necessary for the type of input divisions Equaliser

	local cap_round = CAIRO_LINE_CAP_ROUND		-- in the form of a circle
	local cap_square = CAIRO_LINE_CAP_SQUARE	-- in the form of a rectangle
	local cap_butt = CAIRO_LINE_CAP_BUTT		-- in the form of rectangular (other)

	local function setup_equalizer()

-- making data from OS
		
		local str = conky_parse(string.format('${%s %s}', name, arg))
		
		local value = tonumber(str)
		if value == nil then value = 0 end

		local pct = 100*value/max
		local pcb = 100/nb_blocks
-- set the size and type of scale
		cairo_set_line_width (cr, h)
		cairo_set_line_cap  (cr, cap)
-- Unscrew Equaliser	
		local angle= rotation*math.pi/180
		for pt = 1,nb_blocks do  
			local light_on=false
			--set colors
			local col,alpha = bgc,bga
			if pct>=(100/nb_blocks/2) then --start after an half bloc
				if pct>=(pcb*(pt-1)) then 
					light_on=true
					col,alpha = fgc,fga
					if pct>=alarm and (pcb*pt)>alarm then col,alpha = alc,ala end
				end
			end

			--vertical points
			local x1=xb
			local y1=yb-pt*(h+space)
			local radius0 = yb-y1
	
			local x2=xb+radius0*math.sin(angle)
			local y2=yb-radius0*math.cos(angle)
			
			--line on angle
			local a1=(y2-yb)/(x2-xb)
			local b1=y2-a1*x2

			--line perpendicular to angle
			local a2=-1/a1
			local b2=y2-a2*x2
			
			--dots on perpendicular
			local xx0,xx1,yy0,yy1=0,0,0,0
			if rotation == 90  or rotation == 270 then
				xx0,xx1=x2,x2
				yy0=yb
				yy1=yb+w
			else
				xx0,xx1=x2,x2+w*math.cos(angle)
				yy0=xx0*a2+b2
				yy1=xx1*a2+b2
			end

			--perpendicular segment
			cairo_move_to (cr, xx0 ,yy0)
			cairo_line_to (cr, xx1 ,yy1)
		
			--colors
			local xc,yc=(xx0+xx1)/2,(yy0+yy1)/2
			if light_on and led_effect then
				local pat = cairo_pattern_create_radial (xc, yc, 0, xc,yc,w/1.5)
				cairo_pattern_add_color_stop_rgba (pat, 0, rgb_to_r_g_b(col,led_alpha))
				cairo_pattern_add_color_stop_rgba (pat, 1, rgb_to_r_g_b(col,alpha))
				cairo_set_source (cr, pat)
				cairo_pattern_destroy(pat)
			else
				cairo_set_source_rgba(cr, rgb_to_r_g_b(col,alpha))
			end 

			if light_on and smooth then
				local radius = (nb_blocks+1)*(h+space)
				if pt==1 then 
					xc0,yc0=xc,yc --remember the center of first block
				end
				cairo_move_to(cr,xc0,yc0)
				local pat = cairo_pattern_create_radial (xc0, yc0, 0, xc0,yc0,radius)
				cairo_pattern_add_color_stop_rgba (pat, 0, rgb_to_r_g_b(fgc,fga))
				cairo_pattern_add_color_stop_rgba (pat, 1, rgb_to_r_g_b(alc,ala))
				if mid_color ~=nil then
					cairo_pattern_add_color_stop_rgba (pat, 0.5,rgb_to_r_g_b(mid_color,mid_alpha))
				end
				cairo_set_source (cr, pat)
				cairo_pattern_destroy(pat)
			end 
		
			cairo_stroke (cr);

		end
	end	
	--prevent segmentatioon error
	local updates=tonumber(conky_parse('${updates}'))

		setup_equalizer()
end
--[[ END WIDGET ]]
-- -------------------------------------------------------------------------------------
--[[ TEXT WIDGET ]]

function text_widget(cr, x, y, prefix, name, arg, suffix, fsize, fgc, fga, rotation)

-- recoding function of color

 	local function rgb_to_r_g_b(colour, alpha)
		return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
	end



	function addzero100(num)

		if tonumber(num) < 10 then
		return "00" .. num
		elseif tonumber(num) <100 then
		return "0" .. num
		else
		return num
		end
	end

-- making data from OS

	local str = conky_parse(string.format('${%s %s}', name, arg))
	local value = tonumber(str)
	if value == nil then value = 0 end

-- indicate font size
	cairo_set_font_size (cr, fsize)
-- indicate the point of departure	
	cairo_move_to(cr, x, y)
-- indicate the font color
	cairo_set_source_rgba(cr, rgb_to_r_g_b(fgc, fga))
-- rotate text
	cairo_rotate (cr, rotation*math.pi/180)
-- display text
	cairo_show_text(cr, prefix .. (addzero100(value)) .. suffix)	
end
--[[ END TEXT WIDGET ]]


-- -------------------------------------------------------------------------------------
	function conky_widgets()
		if conky_window == nil then return end
		local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
-- -------------------------------------------------------------------------------------
--[[
equalizer(cr, xb, yb, name, arg, max, nb_blocks, cap, w, h, space, bgc, bga, fgc, fga,alc,ala,alarm,led_effect,led_alpha,smooth,mid_color,mid_alpha,rotation)
  ]]
cr = cairo_create(cs)
--text_widget(cr, 25, 120, "CPU6 ", 'cpu', 'cpu6', " %", 10, 0xffffff, 1, 50)
-- Core 0
cr = cairo_create(cs)
equalizer(cr, 0, 280, 'cpu', 'cpu0', 100, 100, CAIRO_LINE_CAP_SQUARE, 20, 2, 1, 0x606070, 1, 0x00ff0c, 1, 0xff0000, 1, 80, true, 1, true, 0xff0000, 1, 90)
cairo_destroy(cr)
-- cpu temperature
cr = cairo_create(cs)
equalizer(cr, 0, 330, 'acpitemp', '', 100, 100, CAIRO_LINE_CAP_SQUARE, 10, 2, 1, 0x606070, 1, 0x00ff0c, 1, 0xff0000, 1, 80, true, 1, true, 0xff0000, 1, 90)
cairo_destroy(cr)
-- memory
cr = cairo_create(cs)
equalizer(cr, 0, 635, 'memperc', '', 100, 100, CAIRO_LINE_CAP_SQUARE, 7, 2, 1, 0x606070, 1, 0x00ff0c, 1, 0xff0000, 1, 80, true, 1, true, 0xff0000, 1, 90)
cairo_destroy(cr)
--hdd Stockage
cr = cairo_create(cs)
equalizer(cr, 0, 705, 'fs_used_perc', '/', 100, 100, CAIRO_LINE_CAP_SQUARE, 7, 2, 1, 0x606070, 1, 0x00ff0c, 1, 0xff0000, 1, 80, true, 1, true, 0x66ff00, 1, 90)
cairo_destroy(cr)
-- lan downspeed
cr = cairo_create(cs)
equalizer(cr, 0, 818, 'downspeedf', 'wlp7s0', 2000, 100, CAIRO_LINE_CAP_SQUARE, 10, 2, 1, 0x606070, 1, 0x00ff0c, 1, 0xff0000, 1, 80, true, 1, true, 0xff0000, 1, 90)
text_widget(cr, 30, 801, "Download  ", 'downspeedf', 'wlp7s0', " Kb/s", 16, 0xffffff, 1, 0)
cairo_destroy(cr)
-- lan upspeed
cr = cairo_create(cs)
equalizer(cr, 0, 872, 'upspeedf', 'wlp7s0', 600, 100, CAIRO_LINE_CAP_SQUARE, 10, 2, 1, 0x606070, 1, 0x00ff0c, 1, 0xff0000, 1, 80, true, 1, true, 0xff0000, 1, 90)
text_widget(cr,30 , 856, "Upload ", 'upspeedf', 'wlp7s0', " Kb/s", 16, 0xffffff, 1, 0)
end