.class public LX/TTrueReelTouch;
.super Ljava/lang/Object;
.source "TTrueReelTouch"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final A00:I
.field public A01:F
.field public A02:F


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, LX/TTrueReelTouch;->A00:I

    const/4 v0, 0x0
    iput v0, p0, LX/TTrueReelTouch;->A01:F
    iput v0, p0, LX/TTrueReelTouch;->A02:F

    return-void
.end method


# virtual methods
# v0.10 tap-spy: observes every touch on the fullscreen overlay but NEVER
# consumes (always returns false), so taps/swipes continue down to
# Instagram's real gesture pipeline. On a clean single tap (< 60px movement)
# it toggles our optimistic pause indicator (helper A2N) — the real pausing
# is done by Instagram's own tap handler underneath.
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    :try_start_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v0

    if-eqz v0, :action_down
    const/4 v1, 0x1
    if-ne v0, v1, :not_up

    # ---- ACTION_UP: clean tap? ----
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    iget v1, p0, LX/TTrueReelTouch;->A01:F
    sub-float/2addr v0, v1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F
    move-result v1
    iget v2, p0, LX/TTrueReelTouch;->A02:F
    sub-float/2addr v1, v2
    mul-float v2, v0, v0
    mul-float v3, v1, v1
    add-float/2addr v2, v3
    const/high16 v3, 0x44610000    # 3600.0f (60px squared)
    cmpg-float v2, v2, v3
    if-gez v2, :not_up
    invoke-static {}, LX/TTrueReelHelper;->A2N()V
    goto :not_up

    :action_down
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    iput v0, p0, LX/TTrueReelTouch;->A01:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F
    move-result v0
    iput v0, p0, LX/TTrueReelTouch;->A02:F

    :not_up
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0
    return v0

    :catch_0
    move-exception v0
    const/4 v0, 0x0
    return v0
.end method
