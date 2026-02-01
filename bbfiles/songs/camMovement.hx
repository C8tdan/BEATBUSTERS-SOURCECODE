// Code by Zenith.

var offset:Float = 25;
var isScroll:Bool = true;
var isForcedCam:Bool = false;

function camScroll(x:Float, y:Float, angle:Float) {
  camGame.targetOffset.set(x, y);
  camGame.angle = lerp(camGame.angle, angle, camGame.followLerp * offset / 30);
}

function update() {
  var char:Character = strumLines.members[curCameraTarget].characters[0];

  if (isScroll) {
    switch char.getAnimName() {
      case "idle", "singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss":
        camScroll(0, 0, 0);
      case "singLEFT", "singLEFT-alt":
        camScroll(-offset, 0, 0.5);
      case "singDOWN", "singDOWN-alt":
        camScroll(0, offset, 0);
      case "singUP", "singUP-alt":
        camScroll(0, -offset, 0);
      case "singRIGHT", "singRIGHT-alt":
        camScroll(offset, 0, -0.5);
    }
  }
}

function onCameraMove(event:CamMoveEvent)
  event.cancelled = isForcedCam;