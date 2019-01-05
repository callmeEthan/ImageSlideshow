function Initialize()
	local measure=SKIN:GetMeasure('ImageSize')
	measure:Enable()
	SKIN:Bang("!UpdateMeasure","ImageSize")
	width = measure:GetValue()
	SKIN:Bang("!SetOption","ImageSize", "Dimension", "Height")
	SKIN:Bang("!UpdateMeasure","ImageSize")
	height = measure:GetValue()
	skin_width = tonumber(SKIN:GetVariable('CURRENTCONFIGWIDTH'))
	skin_height = tonumber(SKIN:GetVariable('CURRENTCONFIGHEIGHT'))
	step=-1.5
	if (skin_width/skin_height)<(width/height) then
		SKIN:Bang("!SetOption","Meter0", "W", skin_height*(width/height))
		distance=(skin_height*(width/height))-skin_width
		direction=1
		else
		SKIN:Bang("!SetOption","Meter0", "H", skin_width/(width/height))
		distance=(skin_width/(width/height))-skin_height
		direction=2
	end
	ImageMeter = SKIN:GetMeter('Meter0')
	
	local delay = tonumber(SKIN:GetVariable('Duration'))
	local update = 40
	total_step = (delay * 1000) / (update)
	end_step=-1.5+(3*tonumber(SKIN:GetVariable('Repeat')))
	SKIN:Bang("!DisableMeasure","ImageSize")

end

function animate()
	if step < end_step then
	step = step + (3/total_step)
	local multiplier=(math.sin(step)+1)/2
	if direction == 1 then
		ImageMeter:SetX(-distance*multiplier)
		SKIN:Bang("!Redraw")
		else
		ImageMeter:SetY(-distance*multiplier)
		SKIN:Bang("!Redraw")
		end
	else
	SKIN:Bang("!DisableMeasure","Animate")
	end
end