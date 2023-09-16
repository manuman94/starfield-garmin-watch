import Toybox.Graphics;
import Toybox.Lang;
using Toybox.Time;
using Toybox.Time.Gregorian;

function drawClockHands(dc as Dc) {
    drawClockSecondHand(dc);
    drawClockMinuteHand(dc);
    drawClockHourHand(dc);
}

function drawClockSecondHand(dc as Dc) {
    var secondsRatio = getSecondsRatio();
    var secondHandAngle = (secondsRatio * 360).toNumber();
    dc.setColor(getApp().getProperty("LightRed") as Number, getApp().getProperty("LightRed") as Number);
    dc.setPenWidth(OUTLINE_CIRCLE_MARGIN);
    dc.drawArc(screenRadius, screenRadius, screenRadius - OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_MARGIN / 2, Graphics.ARC_COUNTER_CLOCKWISE, (-secondHandAngle - 1) + 90, (-secondHandAngle + 1) + 90);
    var highlighPenWidth = OUTLINE_CIRCLE_MARGIN - 15;
    dc.setColor(getApp().getProperty("DarkRed") as Number, getApp().getProperty("DarkRed") as Number);
    dc.setPenWidth(highlighPenWidth);
    dc.drawArc(screenRadius, screenRadius, screenRadius - highlighPenWidth + highlighPenWidth / 2 + 2, Graphics.ARC_COUNTER_CLOCKWISE, (-secondHandAngle - 1) + 90, (-secondHandAngle + 1) + 90);
}

function getSecondsRatio() {
    var today = Gregorian.info(Time.now(), Time.FORMAT_LONG);
    return today.sec / 60.0;
}

function drawClockMinuteHand(dc as Dc) {
    var minutesRatio = getMinutesRatio();
    var minuteHandAngle = (minutesRatio * 360).toNumber();
    dc.setColor(getApp().getProperty("LightBlue") as Number, getApp().getProperty("LightBlue") as Number);
    dc.setPenWidth(OUTLINE_CIRCLE_MARGIN);
    dc.drawArc(screenRadius, screenRadius, screenRadius - OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_MARGIN / 2, Graphics.ARC_COUNTER_CLOCKWISE, (-minuteHandAngle - 2) + 90, (-minuteHandAngle + 2) + 90);
    var highlighPenWidth = OUTLINE_CIRCLE_MARGIN - 15;
    dc.setColor(getApp().getProperty("DarkBlue") as Number, getApp().getProperty("DarkBlue") as Number);
    dc.setPenWidth(highlighPenWidth);
    dc.drawArc(screenRadius, screenRadius, screenRadius - highlighPenWidth + highlighPenWidth / 2 + 2, Graphics.ARC_COUNTER_CLOCKWISE, (-minuteHandAngle - 2) + 90, (-minuteHandAngle + 2) + 90);
}

function getMinutesRatio() {
    var today = Gregorian.info(Time.now(), Time.FORMAT_LONG);
    return today.min / 60.0;
}

function drawClockHourHand(dc as Dc) {
    var hoursRatio = getHoursRatio();
    var hoursHandAngle = (hoursRatio * 360).toNumber();
    dc.setColor(getApp().getProperty("LightGreen") as Number, getApp().getProperty("LightGreen") as Number);
    dc.setPenWidth(OUTLINE_CIRCLE_MARGIN);
    dc.drawArc(screenRadius, screenRadius, screenRadius - OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_MARGIN / 2, Graphics.ARC_COUNTER_CLOCKWISE, (-hoursHandAngle - 3) + 90, (-hoursHandAngle + 3) + 90);
    var highlighPenWidth = OUTLINE_CIRCLE_MARGIN - 15;
    dc.setColor(getApp().getProperty("DarkGreen") as Number, getApp().getProperty("DarkGreen") as Number);
    dc.setPenWidth(highlighPenWidth);
    dc.drawArc(screenRadius, screenRadius, screenRadius - highlighPenWidth + highlighPenWidth / 2 + 2, Graphics.ARC_COUNTER_CLOCKWISE, (-hoursHandAngle - 3) + 90, (-hoursHandAngle + 3) + 90);
}

function getHoursRatio() {
    var today = Gregorian.info(Time.now(), Time.FORMAT_LONG);
    return today.hour / 12.0;
}
