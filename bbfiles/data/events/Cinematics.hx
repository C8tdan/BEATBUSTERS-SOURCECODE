var upperBar:FlxSprite;
var lowerBar:FlxSprite;

var BAR_HEIGHT:Int = 300;

function postCreate()
{
    upperBar = new FlxSprite(-500, -BAR_HEIGHT - 310).makeGraphic(2500, BAR_HEIGHT, FlxColor.BLACK);
    upperBar.scrollFactor.set();
    upperBar.updateHitbox();
    add(upperBar);

    lowerBar = new FlxSprite(-500, 720 + 310).makeGraphic(2500, BAR_HEIGHT, FlxColor.BLACK);
    lowerBar.scrollFactor.set();
    lowerBar.updateHitbox();
    add(lowerBar);
}

function onEvent(event)
{
    if (event.event.name == "Cinematics")
    {
        var show:Bool = event.event.params[0];
        var distance:Float = event.event.params[1];
        var time:Float = event.event.params[2];
        var easeFunc = Reflect.field(FlxEase, event.event.params[3]);

        var targetUpper:Float = show ? -BAR_HEIGHT : -BAR_HEIGHT - 300;
        var targetLower:Float = show ? 720 : (720 + 300) ;

        FlxTween.tween(upperBar, {y: targetUpper}, time, {ease: easeFunc});
        FlxTween.tween(lowerBar, {y: targetLower}, time, {ease: easeFunc});
    }
}