var whiteStage:FlxSprite;
var lightShader:CustomShader;
var blackScreen:FlxSprite;

function create()
{
    whiteStage = new FlxSprite(0, 0).makeGraphic(3000, 3000, FlxColor.WHITE);
    whiteStage.scrollFactor.set();
    whiteStage.screenCenter();

    blackScreen = new FlxSprite(0, 0).makeGraphic(3000, 3000, FlxColor.BLACK);
    blackScreen.scrollFactor.set();
    blackScreen.screenCenter();
    

    lightShader = new CustomShader("lightHandlerShader");
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
        case 1176:
            boyfriend.cameraOffset.x += 200;
            boyfriend.cameraOffset.y += 50;

            camGame.addShader(lightShader);

            FlxTween.num(0, 40, (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.hue = v;
            });
            FlxTween.num(lightShader.brightness, -20, (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.brightness = v;
            });
            FlxTween.num(lightShader.contrast, (lightShader.contrast + 10), (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.contrast = v;
            });
            FlxTween.num(lightShader.saturation, (lightShader.saturation - 10), (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.saturation = v;
            });
        case 1312:
            boyfriend.cameraOffset.x -= 200;
            boyfriend.cameraOffset.y -= 50;


            FlxTween.num(40, 0, (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.hue = v;
            });
            FlxTween.num(lightShader.brightness, 0, (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.brightness = v;
            });
            FlxTween.num(lightShader.contrast, 0, (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.contrast = v;
            });
            FlxTween.num(lightShader.saturation, 0, (Conductor.stepCrochet * 8 / 1000), {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.saturation = v;
            });
        case 1322:
            camGame.removeShader(lightShader);
        case 1632:
            boyfriend.cameraOffset.x += 175;
            boyfriend.cameraOffset.y += 40;
        case 1695:
            insert(100, blackScreen);
            camHUD.visible = false;
    }
}