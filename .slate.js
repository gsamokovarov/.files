slate.configAll({
  defaultToCurrentScreen: true,
  secondsBetweenRepeat: 0.1,
  checkDefaultsOnLoad: true,
  focusCheckWidthMax: 3000,
  orderScreensLeftToRight: true
});

var pushRight = slate.operation("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/2"
});

var pushBiggerRight = slate.operation("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/1.5"
});

var pushSmallerRight = slate.operation("push", {
  direction: "right",
  style: "bar-resize:screenSizeX - screenSizeX/1.5"
});

var pushLeft = slate.operation("push", {
  direction: "left",
  style: "bar-resize:screenSizeX/2"
});

var pushBiggerLeft = slate.operation("push", {
  direction: "left",
  style: "bar-resize:screenSizeX/1.5"
});

var pushSmallerLeft = slate.operation("push", {
  direction: "left",
  style: "bar-resize:screenSizeX - screenSizeX/1.5"
});

var fullscreen = slate.operation("move", {
  x: "screenOriginX",
  y: "screenOriginY",
  width: "screenSizeX",
  height: "screenSizeY"
});

var centered = slate.operation("move", {
  x: "screenOriginX+150",
  y: "screenOriginY+80",
  width: "screenSizeX-300",
  height: "screenSizeY-180"
});

var reloadSlateConfig = function() {
  slate.source('~/.slate.js');
};

slate.bindAll({
  // Bring up the Grid.
  'space:ctrl,alt,cmd': slate.operation('grid'),
  'i:ctrl,alt,cmd': slate.operation('grid'),

  'i:ctrl,shift,alt': slate.operation('grid'),

  // Nudge a window by then pixels.
  'l:ctrl,shift,alt': pushRight,
  '.:ctrl,shift,alt': pushBiggerRight,
  ',:ctrl,shift,alt': pushSmallerRight,
  'h:ctrl,shift,alt': pushLeft,
  'b:ctrl,shift,alt': pushBiggerLeft,
  'n:ctrl,shift,alt': pushSmallerLeft,
  'k:ctrl,shift,alt': centered,
  'j:ctrl,shift,alt': fullscreen,

  'r:ctrl,alt,cmd': reloadSlateConfig
});
