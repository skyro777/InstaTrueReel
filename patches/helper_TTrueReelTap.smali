.class public LX/TTrueReelTap;
.super Ljava/lang/Object;
.source "TTrueReelTap"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final A00:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LX/TTrueReelTap;->A00:Landroid/view/View;

    return-void
.end method


# virtual methods
# v0.10 delayed tap: fires a synthetic tap on the captured view (used by the
# comment/share buttons after leaving landscape, so the portrait sheet opens).
.method public run()V
    .locals 1

    :try_start_0
    iget-object v0, p0, LX/TTrueReelTap;->A00:Landroid/view/View;
    invoke-static {v0}, LX/TTrueReelHelper;->A2P(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0
    return-void
.end method
