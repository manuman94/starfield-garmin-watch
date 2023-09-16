import Toybox.Graphics;
import Toybox.Lang;
using Toybox.Time;
using Toybox.Time.Gregorian;

const DAYS_OF_THE_WEEK = [
    "DOMINGO",
    "LUNES",
    "MARTES",
    "MIERCOLES",
    "JUEVES",
    "VIERNES",
    "SABADO",
];

var timeInfoFont;

function timeInfoInit() {
    timeInfoFont = Toybox.WatchUi.loadResource(Rez.Fonts.starfield_12);
}

function drawDayOfTheWeek(dc as Dc) {
    var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
    dc.setColor(getApp().getProperty("LightGreen") as Number, Graphics.COLOR_TRANSPARENT);
    dc.drawText(
        screenRadius,
        screenRadius - 29,
        timeInfoFont,
        DAYS_OF_THE_WEEK[today.day_of_week - 1],
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
}

function drawDayOfTheMonth(dc as Dc) {
    var today = Gregorian.info(Time.now(), Time.FORMAT_LONG);
    dc.setColor(getApp().getProperty("LightGreen") as Number, Graphics.COLOR_TRANSPARENT);
    dc.drawText(
        screenRadius,
        screenRadius + 23,
        timeInfoFont,
        Lang.format("$1$ $2$", [ today.day, today.month ]),
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
}