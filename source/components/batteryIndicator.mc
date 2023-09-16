import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
using Toybox.Math;

const BATTERY_INDICATOR_WIDTH as Number = 25;
const BATTERY_INDICATOR_HEIGHT as Number = 12;

function drawBatteryIndicator(dc as Dc) {
    var vOffset = 40;
    var roundingRadius = 3;
    dc.setPenWidth(1);
    // Outline indicator
    dc.setColor(getApp().getProperty("DarkGreen") as Number, getApp().getProperty("DarkGreen") as Number);
    dc.fillRoundedRectangle(screenRadius - BATTERY_INDICATOR_WIDTH / 2, screenRadius + vOffset, BATTERY_INDICATOR_WIDTH, BATTERY_INDICATOR_HEIGHT, roundingRadius);
    // Actual value
    dc.setColor(getApp().getProperty("LightGreen") as Number, getApp().getProperty("LightGreen") as Number);
    dc.fillRoundedRectangle(screenRadius - BATTERY_INDICATOR_WIDTH / 2, screenRadius + vOffset, Math.ceil(BATTERY_INDICATOR_WIDTH * getBatteryRatio()), BATTERY_INDICATOR_HEIGHT, roundingRadius);
}

function getBatteryRatio() {
    return System.getSystemStats().battery / 100.0;
}