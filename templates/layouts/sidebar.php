<!-- Sidebar -->
<div class="sidebar sidebar-style-2">			
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="avatar-sm float-left mr-2">
                    <img src="assets/img/user-placeholder.png" alt="..." class="avatar-img rounded-circle">
                </div>
                <div class="info">
                    <a href="">
                        <span>
                            <?=auth()->username?>
                            <span class="user-level" style="text-transform:capitalize;"><?=auth()->roles[0]?></span>
                        </span>
                    </a>
                    <div class="clearfix"></div>
                </div>
            </div>
            <ul class="nav nav-success">
                <?= generated_menu(auth()->roles) ?>
            </ul>
        </div>
    </div>
</div>
<!-- End Sidebar -->