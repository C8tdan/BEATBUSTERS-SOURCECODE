var walkLoop:FlxTween;
var initialY:Float = dad.y;
var initialYBF:Float = boyfriend.y;
var blackScreen:FlxSprite;
var dadStumlineX:Float = strumLines.members[0].x;
var boyfriendStumlineX:Float = strumLines.members[1].x;

function create()
{
    introLength = 0;
}

function postCreate()
{
    for (i in 0...4)
    {
        var oppStrumsX:Float = cpuStrums.members[i].x;
        var plStrumsX:Float = playerStrums.members[i].x;

        cpuStrums.members[i].x = plStrumsX;
        playerStrums.members[i].x = oppStrumsX;
    }

    camHUD.visible = false;
    blackScreen = new FlxSprite(0, 0).makeGraphic(3500, 3000, 0xFF000000);
    blackScreen.scrollFactor.set();
    blackScreen.screenCenter();
    add(blackScreen);

    startWalkLoopDad();
}

function stepHit(curStep)
{
    switch(curStep)
    {
        case 16:
            blackScreen.visible = false;
            remove(blackScreen);
            camHUD.visible = true;
    }
}

function frameToSeconds(frame:Int, fps:Int = 24):Float
    return frame / fps;

var time_1:Int = frameToSeconds(10, 24);
var time_2:Int = frameToSeconds(8, 24);

function startWalkLoopDad():Void
    walkLoop = FlxTween.tween(dad, {y: initialY - 30}, time_1, {ease: FlxEase.circOut, onComplete: function(twn:FlxTween)
        {
            walkLoop = FlxTween.tween(dad, {y: initialY}, time_1, {ease: FlxEase.circIn, onComplete: function(twn:FlxTween)
                {
                    walkLoop = FlxTween.tween(dad, {y: initialY - 30}, time_1, {ease: FlxEase.circOut, onComplete: function(twn:FlxTween)
                    {
                        walkLoop = FlxTween.tween(dad, {y: initialY}, time_2, {ease: FlxEase.circIn, onComplete: function(twn:FlxTween)
                            {
                                startWalkLoopDad();
                            }});
                    }});
                }});
        }});