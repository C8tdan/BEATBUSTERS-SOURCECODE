var test:CustomShader;

function create()
{
	gf.y = 250;
	introLength = 0;

	test = new CustomShader("ntsc");
	camGame.addShader(test);
	camHUD.addShader(test);
}

function postCreate()
{
    blackScreen = new FlxSprite(0, 0).makeGraphic(3500, 3000, 0xFF000000);
    blackScreen.scrollFactor.set();
    blackScreen.screenCenter();
    add(blackScreen);
}

function onStartSong()
{
	remove(blackScreen);
}