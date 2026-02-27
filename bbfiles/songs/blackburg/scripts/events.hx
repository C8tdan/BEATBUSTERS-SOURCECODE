var whiteStage:FlxSprite;

function create()
{
    whiteStage = new FlxSprite(0, 0).makeGraphic(3000, 3000, FlxColor.WHITE);
    whiteStage.scrollFactor.set();
    whiteStage.screenCenter();
}

function stepHit()
{
    switch (curStep)
    {
        case 544:
            insert(13, whiteStage);
            FlxTween.num(0, 1, 0.3, {ease: FlxEase.circOut}, function(v:Float) {
                whiteStage.alpha = v;
            });

            FlxTween.num(1, 0, 0.3, {ease: FlxEase.circOut}, function(v:Float) {
                boyfriend.setColorTransform(v, v, v, 1, v, v, v, v);
                dad.setColorTransform(v, v, v, 1, v, v, v, v);
            });

        case 576:
            FlxTween.num(1, 0, (Conductor.stepCrochet * 48 / 1000), {ease: FlxEase.sineInOut}, function(v:Float) {
                whiteStage.alpha = v;
            });

            FlxTween.num(0, 1, (Conductor.stepCrochet * 48 / 1000), {ease: FlxEase.sineInOut}, function(v:Float) {
                boyfriend.setColorTransform(v, v, v, 1, v, v, v, v);
                dad.setColorTransform(v, v, v, 1, v, v, v, v);
            });
    }
}