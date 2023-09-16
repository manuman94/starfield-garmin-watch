import Toybox.Graphics;
using Toybox.ActivityMonitor;

var screenWidth;
var screenRadius;

var activityInfo;

function initComputedValues(dc as Dc) {
    screenWidth = dc.getWidth();
    screenRadius = screenWidth / 2;
}

function updateComputedValues() {
    activityInfo = ActivityMonitor.getInfo();
}