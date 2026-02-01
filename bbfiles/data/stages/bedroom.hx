import openfl.display.BlendMode;

function postCreate()
{
    lightAdd.blend = BlendMode.ADD;
    shadowoverlay.blend = BlendMode.OVERLAY;
    blueAdd.blend = BlendMode.ADD;
}