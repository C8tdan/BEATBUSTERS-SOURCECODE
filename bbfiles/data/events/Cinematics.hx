var upperBar:FlxSprite;
var lowerBar:FlxSprite;

function postCreate()
{
    upperBar = new FlxSprite(-1010, -1060).makeGraphic(3500, 700, FlxColor.BLACK);
    upperBar.scrollFactor.set();
    upperBar.updateHitbox();
    add(upperBar);

    lowerBar = new FlxSprite(-1010, 1050).makeGraphic(3500, 700, FlxColor.BLACK);
    lowerBar.scrollFactor.set();
    lowerBar.updateHitbox();
    add(lowerBar);
}
        
function onEvent(event) {
  if(event.event.name == "Cinematics")
  {
    FlxTween.tween(upperBar, {y: upperBar.y + event.event.params[0]}, event.event.params[1], {ease:FlxEase.quadOut});
    FlxTween.tween(lowerBar, {y: lowerBar.y - event.event.params[0]}, event.event.params[1], {ease: FlxEase.quadOut});
  }
}