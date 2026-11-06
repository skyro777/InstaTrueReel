.class public LX/TTrueReelAct;
.super Ljava/lang/Object;
.source "TTrueReelAct"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final A00:I
.field public final A01:LX/1j0;
.field public final A02:LX/11R;
.field public final A03:Landroidx/fragment/app/Fragment;


# direct methods
.method public constructor <init>(ILX/1j0;LX/11R;Landroidx/fragment/app/Fragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, LX/TTrueReelAct;->A00:I
    iput-object p2, p0, LX/TTrueReelAct;->A01:LX/1j0;
    iput-object p3, p0, LX/TTrueReelAct;->A02:LX/11R;
    iput-object p4, p0, LX/TTrueReelAct;->A03:Landroidx/fragment/app/Fragment;

    return-void
.end method


# virtual methods
# v0.11 post-exit action (runs ~400ms after leaving landscape): opens
# Instagram's own comment sheet (9Wz.A1K) or share sheet (9Wz.A1H) directly —
# the same static entry points the real buttons use. On failure, falls back
# to a synthetic tap on the real rail button (portrait is back by then).
.method public run()V
    .locals 10

    :try_start_0
    iget v0, p0, LX/TTrueReelAct;->A00:I
    const/4 v1, 0x4
    if-ne v0, v1, :do_share

    # ---- comment: 9Wz.A1K(item, fragment) ----
    iget-object v0, p0, LX/TTrueReelAct;->A03:Landroidx/fragment/app/Fragment;
    check-cast v0, LX/9Wz;
    iget-object v1, p0, LX/TTrueReelAct;->A01:LX/1j0;
    invoke-static {v1, v0}, LX/9Wz;->A1K(LX/1j0;LX/9Wz;)V
    return-void

    :do_share
    # ---- share: 9Wz.A1H(view, null, item, state, fragment, label, null, false, false) ----
    iget-object v1, p0, LX/TTrueReelAct;->A03:Landroidx/fragment/app/Fragment;
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
    move-result-object v1
    const/4 v2, 0x0
    iget-object v3, p0, LX/TTrueReelAct;->A01:LX/1j0;
    iget-object v4, p0, LX/TTrueReelAct;->A02:LX/11R;
    iget-object v5, p0, LX/TTrueReelAct;->A03:Landroidx/fragment/app/Fragment;
    check-cast v5, LX/9Wz;
    const-string v6, "reels_overlay_share"
    const/4 v7, 0x0
    const/4 v8, 0x0
    const/4 v9, 0x0
    invoke-static/range {v1 .. v9}, LX/9Wz;->A1H(Landroid/view/View;LX/EgN;LX/1j0;LX/11R;LX/9Wz;Ljava/lang/String;Ljava/lang/String;ZZ)V
    return-void

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0
    const-string v1, "InstaTrueReel"
    const-string v2, "v0.11 act: direct call failed - rail fallback"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :try_start_1
    invoke-static {}, LX/TTrueReelHelper;->A2M()V
    iget v0, p0, LX/TTrueReelAct;->A00:I
    const/4 v1, 0x4
    if-ne v0, v1, :fb_share
    sget-object v0, LX/TTrueReelHelper;->fsRailComment:Landroid/view/View;
    invoke-static {v0}, LX/TTrueReelHelper;->A2P(Landroid/view/View;)V
    return-void
    :fb_share
    sget-object v0, LX/TTrueReelHelper;->fsRailShare:Landroid/view/View;
    invoke-static {v0}, LX/TTrueReelHelper;->A2P(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_1
    move-exception v0
    return-void
.end method
