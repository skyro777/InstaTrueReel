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
# v0.11 tap spy: CONSUMES the touch stream (returns true) and FORWARDS it,
# with coordinates remapped into the portrait band behind the overlay, to the
# reels fragment view — this restores Instagram's native gesture pipeline
# (tap-to-pause, double-tap-to-like, swipe-to-page) while the video surface
# lives in our overlay. On a clean single tap (outside a double-tap) it also
# toggles our chrome (helper A32).
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9

    :try_start_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v0

    if-eqz v0, :action_down
    const/4 v1, 0x1
    if-ne v0, v1, :forward

    # ---- ACTION_UP: clean tap? ----
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v1
    iget v2, p0, LX/TTrueReelTouch;->A01:F
    sub-float/2addr v1, v2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F
    move-result v3
    iget v4, p0, LX/TTrueReelTouch;->A02:F
    sub-float/2addr v3, v4
    mul-float v5, v1, v1
    mul-float v6, v3, v3
    add-float/2addr v5, v6
    const/high16 v6, 0x44610000    # 3600.0f (60px squared)
    cmpg-float v5, v5, v6
    if-gez v5, :forward
    # clean tap - double-tap guard (the second tap of a double-tap-to-like
    # must not toggle the chrome again)
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sget-wide v3, LX/TTrueReelHelper;->fsLastTapAt:J
    sub-long/2addr v1, v3
    const-wide/16 v5, 0x190         # 400ms
    cmp-long v7, v1, v5
    if-gez v7, :toggle
    goto :forward
    :toggle
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, LX/TTrueReelHelper;->fsLastTapAt:J
    invoke-static {}, LX/TTrueReelHelper;->A32()V
    goto :forward

    :action_down
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    iput v0, p0, LX/TTrueReelTouch;->A01:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F
    move-result v0
    iput v0, p0, LX/TTrueReelTouch;->A02:F

    :forward
    # ---- remap + forward to the fragment view ----
    sget v1, LX/TTrueReelHelper;->fsBandTop:I
    if-ltz v1, :fwd_plain
    sget v2, LX/TTrueReelHelper;->fsBandH:I
    if-lez v2, :fwd_plain
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I
    move-result v3
    if-lez v3, :fwd_plain
    # y' = bandTop + (y / screenH) * bandH
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F
    move-result v4
    int-to-float v5, v3
    div-float/2addr v4, v5
    int-to-float v5, v2
    mul-float/2addr v4, v5
    int-to-float v5, v1
    add-float/2addr v4, v5
    # x' = W * (0.04 + (x / W) * 0.82)  (steers clear of the rail strip)
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I
    move-result v5
    if-lez v5, :fwd_y_only
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v6
    int-to-float v7, v5
    div-float/2addr v6, v7
    const v7, 0x3f51eb85    # 0.82f
    mul-float/2addr v6, v7
    const v7, 0x3d23d70a    # 0.04f
    add-float/2addr v6, v7
    int-to-float v7, v5
    mul-float/2addr v6, v7
    invoke-virtual {p2, v6, v4}, Landroid/view/MotionEvent;->setLocation(FF)V
    goto :fwd_do
    :fwd_y_only
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F
    move-result v6
    invoke-virtual {p2, v6, v4}, Landroid/view/MotionEvent;->setLocation(FF)V
    goto :fwd_do
    :fwd_plain
    :fwd_do
    # ---- dispatch into Instagram's real hierarchy ----
    sget-object v7, LX/TTrueReelHelper;->A0F:Landroidx/fragment/app/Fragment;
    if-eqz v7, :done
    invoke-virtual {v7}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
    move-result-object v7
    if-eqz v7, :done
    invoke-virtual {v7}, Landroid/view/View;->getWidth()I
    move-result v8
    if-lez v8, :done
    invoke-virtual {v7, p2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    :done
    const/4 v0, 0x1
    return v0

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0
    const/4 v0, 0x1
    return v0
.end method
