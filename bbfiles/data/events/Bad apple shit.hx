var bg:FlxSprite;

function onEvent(event)
{
	if (event.event.name == "Bad apple shit")
	{
		var params:Array = event.event.params;

		if (params[0])
		{
			for(a in stage.stageSprites)
            a.visible = false;
			remove(dad);
			remove(boyfriend);
			bg = new FlxSprite(0, 0).makeGraphic(3000, 3000, FlxColor.WHITE);
			bg.screenCenter();
			bg.scrollFactor.set();
			add(bg);
			add(dad);
			add(boyfriend);
		
			dad.colorTransform.color = params[1];
			boyfriend.colorTransform.color = params[1];
		}
		else
		{
			for(a in stage.stageSprites)
            a.visible = true;
			remove(bg);
			dad.setColorTransform();
			boyfriend.setColorTransform();
		}
    }
}