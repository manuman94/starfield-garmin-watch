import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.Math;
using Toybox.Time;
using Toybox.Time.Gregorian;

class starfieldView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
        initComputedValues(dc);
        timeInit();
        basicLayoutInit();
        basicLayoutInit();
        stepBarInit();
        timeInfoInit();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        updateComputedValues();

        var timeViewElement = View.findDrawableById("TimeLabel") as Text;
        drawTime(dc, timeViewElement);
        drawBasicLayout(dc);
        drawFullStepsBar(dc);
        drawDayOfTheWeek(dc);
        drawDayOfTheMonth(dc);
        drawBatteryIndicator(dc);
        drawClockHands(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }
}