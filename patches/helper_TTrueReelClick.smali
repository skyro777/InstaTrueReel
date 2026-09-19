.class public LX/TTrueReelClick;
.super Ljava/lang/Object;
.source "TTrueReelClick"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final A00:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, LX/TTrueReelClick;->A00:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    :try_start_0
    iget v0, p0, LX/TTrueReelClick;->A00:I
    if-eqz v0, :cond_enter

    const/4 v1, 0x2
    if-eq v0, v1, :cond_exit

    const/4 v1, 0x3
    if-eq v0, v1, :cond_like

    const/4 v1, 0x4
    if-eq v0, v1, :cond_comment

    const/4 v1, 0x5
    if-eq v0, v1, :cond_share

    # mode 1 (legacy exit) and anything else: exit landscape
    invoke-static {}, LX/TTrueReelHelper;->A26()V
    return-void

    :cond_exit
    # mode 2: top-bar back button -> exit landscape
    invoke-static {}, LX/TTrueReelHelper;->A26()V
    return-void

    :cond_like
    # mode 3: like (stays in landscape, heart flashes red)
    invoke-static {}, LX/TTrueReelHelper;->A2Q()V
    return-void

    :cond_comment
    # mode 4: comment (exits landscape, opens the portrait sheet)
    invoke-static {}, LX/TTrueReelHelper;->A2R()V
    return-void

    :cond_share
    # mode 5: share (exits landscape, opens the portrait sheet)
    invoke-static {}, LX/TTrueReelHelper;->A2S()V
    return-void

    :cond_enter
    # mode 0: the "Full screen" pill -> enter landscape
    invoke-static {}, LX/TTrueReelHelper;->A24()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0
    return-void
.end method
