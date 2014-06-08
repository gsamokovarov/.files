slate.configAll({
  'defaultToCurrentScreen': true,
  'secondsBetweenRepeat': 0.1,
  'checkDefaultsOnLoad': true,
  'focusCheckWidthMax': 3000,
  'orderScreensLeftToRight': true
});

slate.bindAll({
  'space:alt,ctrl,cmd': slate.operation('grid')
});
