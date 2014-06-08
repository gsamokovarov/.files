slate.configAll({
  'defaultToCurrentScreen': true,
  'secondsBetweenRepeat': 0.1,
  'checkDefaultsOnLoad': true,
  'focusCheckWidthMax': 3000,
  'orderScreensLeftToRight': true
});

slate.bindAll({
  // Bring up the Grid.
  'space:ctrl,alt,cmd': slate.operation('grid'),

  // Nudge a window by then pixels.
  'l:ctrl,shift,alt': slate.operation('nudge', { x: '+10', y: '+0' }),
  'h:ctrl,shift,alt': slate.operation('nudge', { x: '-10', y: '+0' }),
  'k:ctrl,shift,alt': slate.operation('nudge', { x: '+0', y: '-10' }),
  'j:ctrl,shift,alt': slate.operation('nudge', { x: '+0', y: '+10' }),

  'r:ctrl,alt,cmd': function() { slate.source('~/.slate.js'); },
});
