function Initialize()
	FileName = SKIN:GetMeasure('MeasureFile')
	FileCount = SKIN:GetMeasure('FileCount')
	TotalFile = 0
	File = ''
	math.randomseed(os.time())
	mode=0
	local anim = tonumber(SKIN:GetVariable('Animation'))
	if anim == 0 then
		skin0='Image0.ini'
		skin1='Image1.ini'
		else
		skin0='Anim0.ini'
		skin1='Anim1.ini'
	end

end

function begin()
	TotalFile=FileCount:GetValue()
	if TotalFile==0 then empty()
	else
	local delay = tonumber(SKIN:GetVariable('Delay'))
	delay = delay * 1000
	SKIN:Bang('!SetVariable', 'Delay', delay)
	SKIN:Bang('!UpdateMeasure', 'Animation')
	random_get()
	end
end

function random_get()
	local temp
	temp=math.random(TotalFile) 
	SKIN:Bang('!SetVariable', 'Index',temp)
	SKIN:Bang('!UpdateMeasure', 'MeasureFile')
	File=FileName:GetStringValue()
	image_load()
end

function image_load()
	SKIN:Bang('!WriteKeyValue', 'Variables', 'Image_file' , File, '#@#Settings.inc')
	if mode==0 then
		SKIN:Bang('!ActivateConfig', 'A Slideshow\\Display', skin0)
		mode=1
		else 
		SKIN:Bang('!ActivateConfig', 'A Slideshow\\Display', skin1)
		mode=0
	end
	SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 1')
end

function empty()
	SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 3')
	print('No image file found')
end