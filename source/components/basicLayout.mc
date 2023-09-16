import Toybox.Graphics;
import Toybox.Lang;

var timeMarkersFont;

function basicLayoutInit() {
  timeMarkersFont = Toybox.WatchUi.loadResource(Rez.Fonts.starfield_12);
}

function drawBasicLayout(dc as Dc) {
  drawOutlineCircle(dc);
  drawTimeMarkers(dc);
  drawCircleTicks(dc);
}

const OUTLINE_CIRCLE_MARGIN as Number = 20;
const OUTLINE_CIRCLE_STROKE_WIDTH as Number = 1;

function drawOutlineCircle(dc as Dc) {
    dc.setPenWidth(OUTLINE_CIRCLE_STROKE_WIDTH);
    dc.setColor(getApp().getProperty("LightGreen") as Number, getApp().getProperty("LightGreen") as Number);
    dc.drawArc(screenRadius, screenRadius, screenRadius - OUTLINE_CIRCLE_MARGIN, Graphics.ARC_COUNTER_CLOCKWISE, 0, 360);
}

const TIME_MARKERS_FONT_SIZE as Number = 6;

function drawTimeMarkers(dc as Dc) {
    var hOffset = 9;
    var vOffset = 9;
    var fontSize = 12;
    dc.setColor(getApp().getProperty("DarkGreen"), Graphics.COLOR_TRANSPARENT);
    dc.drawText(
        screenRadius,
        vOffset,
        timeMarkersFont,
        "12",
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
    dc.drawText(
        screenRadius,
        screenWidth - fontSize,
        timeMarkersFont,
        "6",
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
    dc.drawText(
        hOffset,
        screenRadius,
        timeMarkersFont,
        "9",
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
    dc.drawText(
        screenWidth - hOffset,
        screenRadius,
        timeMarkersFont,
        "3",
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
}

const CIRCLE_TICKS_STROKE_WIDTH as Number = 6;

function drawCircleTicks(dc as Dc) {
    for (var angle = 0; angle < 360; angle += 30) {
        dc.setPenWidth(CIRCLE_TICKS_STROKE_WIDTH);
        dc.setColor(getApp().getProperty("LightGreen") as Number, getApp().getProperty("LightGreen") as Number);
        dc.drawArc(screenRadius, screenRadius, 67, Graphics.ARC_COUNTER_CLOCKWISE, angle - 1, angle + 1);
    }
}