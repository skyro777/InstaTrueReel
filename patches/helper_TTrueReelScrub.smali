.class public LX/TTrueReelScrub;
.super Ljava/lang/Object;
.source "TTrueReelScrub"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
# v0.11 scrubber listener: forwards drags to the helper (A38 begin / A39
# preview / A3A end). The seek itself fires on release (TikTok/media3
# behavior); while dragging, the per-tick position updates are suspended.
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    :try_start_0
    if-eqz p3, :ret
    invoke-static {p2}, LX/TTrueReelHelper;->A39(I)V
    :ret
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0
    return-void
.end method


.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    :try_start_0
    invoke-static {}, LX/TTrueReelHelper;->A38()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0
    return-void
.end method


.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    :try_start_0
    invoke-static {}, LX/TTrueReelHelper;->A3A()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0
    return-void
.end method
