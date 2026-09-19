.class public LX/TTrueReelTick;
.super Ljava/lang/Object;
.source "TTrueReelTick"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
# v0.10 landscape tick: runs the overlay health/swap/auto-exit logic and
# re-posts itself every 500ms while the helper keeps fsForced set.
.method public run()V
    .locals 4

    :try_start_0
    invoke-static {}, LX/TTrueReelHelper;->A2K()V

    sget-boolean v0, LX/TTrueReelHelper;->fsForced:Z
    if-eqz v0, :stop

    sget-object v0, LX/TTrueReelHelper;->fsHandler:Landroid/os/Handler;
    if-eqz v0, :stop
    sget-object v1, LX/TTrueReelHelper;->fsTick:Ljava/lang/Runnable;
    if-eqz v1, :stop
    const-wide/16 v2, 0x1f4
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :stop
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0
    return-void
.end method
