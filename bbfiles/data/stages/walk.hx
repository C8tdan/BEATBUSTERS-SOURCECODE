import flixel.math.FlxRandom;

var scrollSpeed:Float = 150;
var scrollingGroup:FlxSpriteGroup;
var spriteWidth:Float = 0;

function create()
{
	defaultCamZoom = 0.4;
	dad.x = 2000;
	dad.y = 0;
	dad.scale.set(2.5, 2.5);
	dad.updateHitbox();
	boyfriend.x = 475;
	boyfriend.y = 350;
	boyfriend.scale.set(2.5, 2.5);
	boyfriend.updateHitbox();

	remove(dad); //ik this may not be the best way to make the characters above but im not a good programmer, sowy
	remove(boyfriend);

	scrollingGroup = new FlxSpriteGroup();
	add(scrollingGroup);
		
	var xPosition:Float = 0;
	for (i in 0...2) 
	{
		var randomImage:Int = FlxG.random.int(1, 2);
		var bg:FlxSprite = new FlxSprite(xPosition, (FlxG.height / 2)).loadGraphic(Paths.image("stages/walk/" + randomImage));
		bg.y -= bg.height / 2;
		scrollingGroup.add(bg);

		if (i == 0)
		{
			spriteWidth = bg.width;
		}

		xPosition += bg.width;
	}
}

function postCreate()
{
	add(dad);
	add(boyfriend);
}

function update(elapsed)
{
	for (bg in scrollingGroup.members) {
		if (bg != null) {
			bg.x -= scrollSpeed * elapsed;
			
			if (bg.x < -bg.width) {
				var lastX:Float = -spriteWidth + 3;
				for (s in scrollingGroup.members) {
					if (s != null && s.x > lastX) {
						lastX = s.x;
					}
				}
				
				var randomImage = FlxG.random.int(1, 2);
				bg.loadGraphic(Paths.image("walk/" + randomImage));
				bg.x = lastX + spriteWidth - 3;
			}
		}
	}
}