var vhs:CustomShader;
var test:CustomShader;
var black:FlxSprite;

function create()
{
    test = new CustomShader("ntsc");
    vhs = new CustomShader("vhs");
    vhs.chromaKey = false;
    vhs.iTime = 0;
    vhs.timeScale = 1.0;
    vhs.distortionIntensity = 0.0; // <-- 1.0 = intensità normale
    vhs.chromaticIntensity = 1.0;
    vhs.noiseIntensity = 1.0;
    vhs.chromaticColor = [1.0, 0.8, 1.0];
}

function postCreate()
{
    black = new FlxSprite(0, 0).makeGraphic(3000, 3000, FlxColor.BLACK);
    black.scrollFactor.set();
    black.screenCenter();
    black.camera = camGame;
}

var totalTime:Float = 0;
var time:Float = 1;
function update(elapsed)
{
    totalTime += elapsed;
    vhs.iTime = totalTime;
}

function stepHit()
{
    switch(curStep)
    {
        case 1534:
            FlxG.camera.addShader(vhs);
        case 1536:
            FlxTween.num(0.0, 0.5, 1.0, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.distortionIntensity = v;
            });
            FlxTween.num(0.0, 1.0, 1.0, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.chromaticDistortion = v;
            });
            FlxTween.num(0.0, 1.0, 1.0, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.noise = v;
            });
        case 1552:
            dad.x -= 110;
            boyfriend.x += 150;
            
            FlxG.camera.addShader(test);
            changeVhsValues(1, 0.5, 1, 1);

        case 1792:
            FlxTween.num(0.5, 20, 1.5, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.distortionIntensity = v;
            });
            FlxTween.num(1, 20, 1.5, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.velocity = v;
            });
            FlxTween.num(1, 10, 1.5, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.chromaticDistortion = v;
            });
            FlxTween.num(1, 10, 1.5, {ease: FlxEase.circIn}, function(v:Float) {
                vhs.noise = v;
            });
			
        case 1808:
            dad.x += 120;
            dad.y -= 5;
            boyfriend.x -= 150;
            camGame.removeShader(test);
            camGame.removeShader(vhs);
        case 2576:
            insert(100, black);
        case 2580:
            FlxTween.tween(camHUD, {alpha: 0}, 1, {ease: FlxEase.circInOut});
    }
}

function changeVhsValues(?velocity:Float = 1, ?distortion:Float = 1, ?chromaticDistortion:Float = 1.0, ?noise:Float = 1)
{
    vhs.timeScale = velocity;
    vhs.distortionIntensity = distortion;
    vhs.chromaticDistortion = chromaticDistortion;
    vhs.noiseIntensity = noise;
}