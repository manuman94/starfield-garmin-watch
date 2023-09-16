import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
using Toybox.ActivityMonitor;

const STEPS_BAR_STROKE_WIDTH as Number = 30;
const STEPS_BAR_OFFSET as Number = 3;

var pedestrianDrawable;
var flagDrawable;
var stepsFont;

function stepBarInit() {
    stepsFont = Toybox.WatchUi.loadResource(Rez.Fonts.starfield_10);
    pedestrianDrawable = Application.loadResource(Rez.Drawables.Pedestrian);
    flagDrawable = Application.loadResource(Rez.Drawables.Flag);
}

function drawFullStepsBar(dc as Dc) {
    drawStepsBar(dc);
    drawPedestrian(dc);
    drawFlag(dc);
}

function drawStepsBar(dc as Dc) {
    // Placeholder
    dc.setPenWidth(STEPS_BAR_STROKE_WIDTH);
    dc.setColor(getApp().getProperty("DarkGreen") as Number, getApp().getProperty("DarkGreen") as Number);
    dc.drawArc(screenRadius, screenRadius, screenRadius - getStepsBarMargin(), Graphics.ARC_COUNTER_CLOCKWISE, 180, 0);

    // Actual value
    if ( getStepsGoalEndAngle() > 180 ) {
        dc.setPenWidth(STEPS_BAR_STROKE_WIDTH);
        dc.setColor(getApp().getProperty("LightGreen") as Number, getApp().getProperty("LightGreen") as Number);
        dc.drawArc(screenRadius, screenRadius, screenRadius - getStepsBarMargin(), Graphics.ARC_COUNTER_CLOCKWISE, 180, getStepsGoalEndAngle());
    }
    // Label
    dc.setColor(getApp().getProperty("BackgroundColor") as Number, Graphics.COLOR_TRANSPARENT);
    dc.drawText(
        OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_STROKE_WIDTH + 18,
        screenRadius + 5,
        stepsFont,
        activityInfo.steps,
        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
}

function getStepsBarMargin() {
    return OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_STROKE_WIDTH + (STEPS_BAR_STROKE_WIDTH / 2) + STEPS_BAR_OFFSET;
}

function getStepsGoalRatio() {
    var stepsGoal = activityInfo.steps / activityInfo.stepGoal.toFloat();
    if ( stepsGoal > 1 ) {
        return 1;
    }
    return stepsGoal;
}

function getStepsGoalEndAngle() {
    return (180 + (getStepsGoalRatio() * 180)).toNumber() ;
}

function drawPedestrian(dc as Dc) {
    dc.drawBitmap(
        OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_STROKE_WIDTH + 10,
        screenRadius - 28,
        pedestrianDrawable
    );
}

function drawFlag(dc as Dc) {
    dc.drawBitmap(
        screenWidth - (OUTLINE_CIRCLE_MARGIN + OUTLINE_CIRCLE_STROKE_WIDTH + 32),
        screenRadius - 17,
        flagDrawable
    );
}