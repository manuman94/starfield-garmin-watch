import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

var timeFont;

const TIME_FONT_SIZE as Number = 6;

function timeInit() {
  timeFont = Toybox.WatchUi.loadResource(Rez.Fonts.starfield_24);
}

function drawTime(dc as Dc, timeViewElement as Text) {
    // Get the current time and format it correctly
    var timeFormat = "$1$:$2$";
    var clockTime = System.getClockTime();
    var hours = clockTime.hour;
    if (!System.getDeviceSettings().is24Hour) {
        if (hours > 12) {
            hours = hours - 12;
        }
    } else {
        if (getApp().getProperty("UseMilitaryFormat")) {
            timeFormat = "$1$$2$";
            hours = hours.format("%02d");
        }
    }
    var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

    // Update time
    timeViewElement.setColor(getApp().getProperty("LightGreen") as Number);
    timeViewElement.setFont(timeFont);
    timeViewElement.setText(timeString);
}