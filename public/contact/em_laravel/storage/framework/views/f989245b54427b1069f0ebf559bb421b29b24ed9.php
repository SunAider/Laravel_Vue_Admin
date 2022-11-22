<?php $__env->startSection('title', __("admin_messages.page_title_form_item_edit") ." | ". __("admin_messages.page_title")); ?>
<?php $__env->startSection('description', __("admin_messages.page_description")); ?>
<?php $__env->startSection('content'); ?>
  <style>
    #item_area {
      height: auto;
      min-height: 250px;
      border: 0.5px solid rgba(0, 0, 0, 0.125);
      padding: 0 0 40px 0;
    }

    #block_area .form_block:hover {
      cursor: grab;
    }

    #item_area .form_block:hover {
      cursor: grab;
    }

    .c1 {
      pointer-events: none;
    }

    .active_item {
      color: #155724 !important;
      background-color: #d4edda !important;
      border-color: #c3e6cb !important;
      font-weight: bold;
    }

    .active_item .remove_arrow {
      color: #155724;
    }

    .active_item .remove_arrow:hover {
      cursor: pointer;
      color: crimson;
    }

    .item_edit_icon_area {
      position: absolute;
      top: 7px;
      right: 12px;
    }

    .item_edit_icon_area > * {
      margin-right: 5px;
    }

    #block_area .prop_block {
      display: none;
    }

    #block_area .copy_btn {
      display: none;
    }

    .prop_block {
      /*position: absolute;*/
      /*top: 60px;*/
      /*left: 30px;*/
    }

    .copy_btn {
      padding: 0;
      border: none;
      padding: 0 3px;
    }

    .list-group-item {
      min-height: 50px;
    }


    .fa-edit-anc:hover {
      transition-duration: 0.5s;
      cursor: pointer;
    }

    .fa-edit-anc {
      font-size: 1.2rem;
    }

    .remove_arrow {
      font-size: 1.3rem;
      color: orangered;
    }

    .remove_arrow:hover {
      transition-duration: 0.5s;
      cursor: pointer;
      color: crimson;
    }

    a.fa-plus-anc {
      color: darkcyan;
      font-size: 1.3rem;
    }

    a.fa-plus-anc:hover {
      transition-duration: 0.5s;
      cursor: pointer;
    }

    #block_area .remove_arrow {
      display: none;
    }

    #item_area .remove_arrow {
      display: unset;
    }

    #block_area .fa-plus-anc {
      display: unset;
    }

    #item_area .fa-plus-anc {
      display: none;
    }
    .gray_out::before {
      background: rgb(210, 210, 210) !important;
      border: #adb5bd solid 1px !important;
    }
    .gray_out::after {
      background: #adb5bd !important;
      border: #adb5bd solid 1px !important;
    }
  </style>
  <div class="container-fluid">
    <div class="button_area">
      <span class="font80">URL</span>
      <a href="<?php echo e($url); ?>/<?php echo e($form->url); ?>" class="btn border-0 btn-outline-dark" target="_blank" data-toggle="tooltip" title="<?php echo e(__("admin_messages.form.open_form")); ?>">
        <?php echo e($url); ?>/<?php echo e($form->url); ?>&nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
      </a>
      <a href="<?php echo e(route("admin.form.edit", $form->id)); ?>" class="btn btn-sm btn-outline-primary mr-1" data-toggle="tooltip" title="「<?php echo e($form->name); ?>」<?php echo e(__("admin_messages.form_item.edit_form")); ?>">
        <i class="far fa-edit"></i>
      </a>
      <a href="javascript:void (0);" id="rew_btn" class="btn btn-sm btn-outline-primary" data-toggle="tooltip" data-title="<?php echo e(__("admin_messages.update")); ?>">
        <i class="fas fa-save"></i>
      </a>
    </div>
    <div class="row">
      <div class="col-4 mt-3 mb-1">
        <h3 class="page-header">
          「<?php echo e($form->name); ?>」 <?php echo e(__("admin_messages.form_item.edit_form_item")); ?>

        </h3>
      </div>
    </div>
    <?php echo $__env->make("admin.include.message", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php if($errors->any()): ?>
      <div class="row mb-1">
        <ul class="col-6 list-group m-0">
          <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <li class="list-group-item list-group-item-danger"><?php echo e($error); ?></li>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
      </div>
    <?php endif; ?>

    <div class="row">
      <?php
      /***************************************************************
       *
       * 利用中項目
       *
       ****************************************************************/
      ?>
      <div class="col-8 h-100">
        <div class="row">
          <div class="col-12"><?php echo e(__("admin_messages.form_item.item_in_use")); ?></div>
        </div>
        <?php if(isset($append['admin_form_item_edit_upper_form'])): ?><?php echo $append['admin_form_item_edit_upper_form']; ?><?php endif; ?>
        <form action="<?php echo e(route("admin.form_item.update", $form->id)); ?>" method="post" id="rew_form">
          <?php echo csrf_field(); ?>
          <?php if(isset($append['admin_form_item_edit_form_hidden'])): ?><?php echo $append['admin_form_item_edit_form_hidden']; ?><?php endif; ?>
          <div class="row">
            <div id="item_area" class="list-group item_area col-12">
              <?php if(isset($append['admin_form_item_edit_form_item_top'])): ?><?php echo $append['admin_form_item_edit_form_item_top']; ?><?php endif; ?>
              <?php $__currentLoopData = $form_items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $form_item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="list-group-item list-group-item-action flex-column form_block form_item" id="125" data-viewno="1" style="opacity: 1; background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-weight: normal; border-bottom: 0.5px solid rgba(0, 0, 0, 0.125); border-top: none;">
                  <input type="hidden" name="form_block_id[]" value="<?php echo e($form_item->form_block_id); ?>">
                  <div class="row">
                    <div class="col-5 c1 item_block_title">
                      <div class="mb-0 ml-4 c3">
                        <?php echo e($form_item->title); ?>

                        <?php if(isset($form_item->html_id)): ?>
                          <span class="font-weight-light">id=<?php echo e($form_item->html_id); ?></span>
                        <?php endif; ?>
                      </div>
                      <?php if($form->language != "ja"): ?>
                        <p class="ml-4 p-0 m-0 small">(<?php echo e($form->language); ?>)<?php echo e($form_item->lang_title); ?></p>
                      <?php endif; ?>
                    </div>
                    <div class="prop_block prop col-7">
                      <div class="row">
                        <div class="form-inline prop">
                          <div class="custom-control custom-switch">
                            <input type="checkbox" name="required[<?php echo e($form_item->form_block_id); ?>]" value="1" id="custom_switch_required_flag_save<?php echo e($form_item->form_block_id); ?>" class="custom-control-input required_checkbox prop" <?php if($form_item->required == 1): ?> checked <?php endif; ?>>
                            <label for="custom_switch_required_flag_save<?php echo e($form_item->form_block_id); ?>" class="custom-control-label prop"><?php echo e(__("admin_messages.required")); ?></label>
                          </div>
                        </div>
                        <?php if($form_item->form_type !== "radio" && $form_item->form_type !== "checkbox" && $form_item->form_type !== "select" && $form_item->form_type !== "multiselect"): ?>
                          <div class="form-inline prop">
                            <div class="pl-5 custom-control custom-switch">
                                <input type="checkbox" name="real_time_validation[<?php echo e($form_item->form_block_id); ?>]" value="1" id="custom_switch_real_time_validation_flag_save<?php echo e($form_item->form_block_id); ?>" class="custom-control-input real_time_validation_checkbox prop" <?php if($form_item->real_time_validation == 1): ?> checked <?php endif; ?> <?php if($form->theme_name == "gray" || $form->theme_name == "one_column" || $form->theme_name == "two_column01" || $form->theme_name == "two_column02" ): ?>disabled <?php endif; ?>>
                                <label for="custom_switch_real_time_validation_flag_save<?php echo e($form_item->form_block_id); ?>" class="custom-control-label prop <?php if($form->theme_name == "gray" || $form->theme_name == "one_column" || $form->theme_name == "two_column01" || $form->theme_name == "two_column02" ): ?>gray_out <?php endif; ?>"><?php echo e(__("admin_messages.real_time_validation")); ?></label>
                            </div>
                          </div>
                        <?php endif; ?>
                        <div class="w-100 form-inline prop">
                          <span class="small"><?php echo e(__("admin_messages.form_item.re_enter_html_id")); ?>&nbsp;</span>
                          <input type="text" name="re_enter_html_id[]" class="form-control form-control-sm d-inline prop re_enter_html_id" style="width: 160px;" value="<?php echo e($form_item->re_enter_html_id); ?>">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="item_edit_icon_area">
                    <a class="fa-plus-anc" data-toggle="tooltip" title="<?php echo e(__("admin_messages.form_item.add_to")); ?>">
                      <i class="far fa-plus-square"></i>
                    </a>
                    <i class="far fa-minus-square remove_arrow" data-toggle="tooltip" title="<?php echo e(__("admin_messages.delete")); ?>"></i>
                    <a href="<?php echo e(route("admin.form_block.edit", $form_item->form_block_id)); ?>" data-toggle="tooltip" title="<?php echo e(__("admin_messages.edit")); ?>" class="fa-edit-anc">
                      <i class="far fa-edit"></i>
                    </a>
                  </div>
                </div>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              <?php if(isset($append['admin_form_item_edit_form_item_bottom'])): ?><?php echo $append['admin_form_item_edit_form_item_bottom']; ?><?php endif; ?>
            </div>
          </div>
        </form>
        <?php if(isset($append['admin_form_item_edit_under_form'])): ?><?php echo $append['admin_form_item_edit_under_form']; ?><?php endif; ?>
      </div>

      <?php
      /***************************************************************
       *
       * 項目
       *
       **************************************************************/
      ?>
      <div class="col-4 h-100">
        <div class="col-12"><?php echo e(__("admin_messages.form_item.item")); ?></div>
        <div id="block_area" class="list-group block_area">
          <?php $__currentLoopData = $form_blocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $form_block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="list-group-item list-group-item-action flex-column form_block" id="<?php echo e($form_block->id); ?>" data-viewno="<?php echo e($form_block->view_no); ?>">
              <input type="hidden" name="form_block_id[]" value="<?php echo e($form_block->id); ?>">
              <div class="row">
                <div class="col-9 c1 item_block_title">
                  <div class="mb-1 ml-2 c3"><?php echo e($form_block->title); ?></div>
                  <?php if($form->language != "ja"): ?>
                    <p class="ml-4 p-0 m-0 small">(<?php echo e($form->language); ?>)<?php echo e($form_block->lang_title); ?></p>
                  <?php endif; ?>
                </div>
                <div class="prop_block prop col-7">
                  <div class="row">
                    <div class="form-inline prop">
                      <div class="custom-control custom-switch">
                        <input type="checkbox" name="required[<?php echo e($form_block->id); ?>]" value="1" id="custom_switch_required_flag<?php echo e($form_block->id); ?>" class="custom-control-input required_checkbox prop">
                        <label for="custom_switch_required_flag<?php echo e($form_block->id); ?>" class="custom-control-label prop"><?php echo e(__("admin_messages.required")); ?></label>
                      </div>
                    </div>
                    <?php if($form_block->form_type !== "radio" && $form_block->form_type !== "checkbox" && $form_block->form_type !== "select" && $form_block->form_type !== "multiselect"): ?>
                      <div class="form-inline prop">
                        <div class="pl-5 custom-control custom-switch">
                          <input type="checkbox" name="real_time_validation[<?php echo e($form_block->id); ?>]" value="1" id="custom_switch_real_time_validation_flag<?php echo e($form_block->id); ?>" class="custom-control-input real_time_validation_checkbox prop" <?php if($form->theme_name == "gray" || $form->theme_name == "one_column" || $form->theme_name == "two_column01" || $form->theme_name == "two_column02" ): ?>disabled <?php endif; ?>>
                          <label for="custom_switch_real_time_validation_flag<?php echo e($form_block->id); ?>" class="custom-control-label prop <?php if($form->theme_name == "gray" || $form->theme_name == "one_column" || $form->theme_name == "two_column01" || $form->theme_name == "two_column02" ): ?>gray_out <?php endif; ?>"><?php echo e(__("admin_messages.real_time_validation")); ?></label>
                        </div>
                      </div>
                    <?php endif; ?>
                    <div class="w-100 form-inline prop">
                      <span class="small"><?php echo e(__("admin_messages.form_item.re_enter_html_id")); ?>&nbsp;</span>
                      <input type="text" name="re_enter_html_id[]" class="form-control form-control-sm d-inline prop re_enter_html_id" style="width: 160px;" value="">
                    </div>
                  </div>
                </div>
              </div>
              <div class="item_edit_icon_area">
                <a class="fa-plus-anc" data-toggle="tooltip" title="<?php echo e(__("admin_messages.form_item.add_to")); ?>">
                  <i class="far fa-plus-square"></i>
                </a>
                <i class="far fa-minus-square remove_arrow" data-toggle="tooltip" title="<?php echo e(__("admin_messages.delete")); ?>"></i>
                <a href="<?php echo e(route("admin.form_block.edit", $form_block->id)); ?>" class="fa-edit-anc" data-toggle="tooltip" title="<?php echo e(__("admin_messages.edit")); ?>">
                  <i class="far fa-edit"></i>
                </a>
              </div>
            </div>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
      </div>
    </div>
  </div>

  <script>
    let dragged;
    let is_rewrite         = false;
    let block_area         = document.getElementById ( 'block_area' );
    let item_area          = document.getElementById ( 'item_area' );
    let drag_target_color  = "#c0c0c0";
    let base_border        = "0.5px solid rgba(0, 0, 0, 0.125)";
    let drop_target_border = "1px solid #ffa280";

    $ ( '.tooltip_btn' ).tooltip ();

    $ ( '.tooltip_btn' ).on ( 'click', function() {
      $ ( this ).tooltip ( 'hide' );
      copy ( $ ( this ).data ( 'name' ) );
      return false;
    } );

    $ ( 'input[type=text]' ).focusin ( function() {
      $ ( this ).select ();
    } );

    $(window).on('beforeunload', function(e) {
      if ( is_rewrite === true ) {
        e.returnValue = "<?php echo e(__("admin_messages.form_item.no_saved_alert_msg")); ?>";
      }
    });

    /*****************************
     * init..
     ****************************/
    function init () {
      block_init ();
      item_init ();
      item_area.style.minHeight = block_area.clientHeight + "px";
    }

    function block_init () {
      let form_block = document.querySelectorAll ( '.form_block' );
      form_block.forEach ( function( el ) {
        el.style.opacity         = 1;
        el.style.backgroundColor = '#fff';
        el.style.color           = '#333';
        el.style.fontWeight      = 'normal';
        el.style.borderBottom    = base_border;
        el.style.borderTop       = 'none';
      } );
      block_area.style.border = base_border;
    }

    function item_init () {
      let form_item = document.querySelectorAll ( '.form_item' );
      form_item.forEach ( function( el ) {
        el.style.opacity         = 1;
        el.style.backgroundColor = '#fff';
        el.style.color           = '#333';
        el.style.fontWeight      = 'normal';
        el.style.borderBottom    = base_border;
        el.style.borderTop       = 'none';
      } );
      item_area.style.border = base_border;
    }

    /******************************
     * dragstart
     ******************************/
    $ ( '#item_area' ).sortable ( {
      revert: true,
      cursor: "auto",
      delay: 100,
      distance: 5,
      update: function() {
        is_rewrite = true;
      },
    } );

    $ ( ".form_block" ).draggable ( {
      stop: function( e, ui ) {
        init ();
      },
      // appendTo: "#item_area",
      // connectToSortable: true,
      stack: '.form_item',
      snap: '.form_item',
      snapMode: 'outer',
      helper: 'clone',
      revert: 'invalid',
      revertDuration: '400',
      cancel: '.form_item',
      zIndex: 9999
    } );

    /******************************
     * drop
     *****************************/
    $ ( "#item_area" ).droppable ( {
      activate: function( e, ui ) {
        ui.draggable.css ( 'opacity', '.8' );
      },
      over: function( e, ui ) {
        $ ( this ).css ( 'border', drop_target_border );
      },
      drop: function( e, ui ) {
        is_rewrite = true;
        ui.draggable.addClass ( "form_item" );
        $ ( this ).append ( ui.draggable );
        $ ( this ).find ( ".prop_block" ).show ();
        $ ( this ).find ( ".remove_arrow" ).show ();
        $ ( this ).removeClass ( "ui-draggable" );
        $ ( this ).removeClass ( "ui-draggable-handle" );
        $ ( this ).removeClass ( "form_block" );
        let item_block_title = $( this ).children().children(".row").children(".item_block_title");
        item_block_title.removeClass("col-9 c1");
        item_block_title.addClass("col-5 c1");
        item_block_title.children().removeClass("mb-1 ml-2 c3");
        item_block_title.children().addClass("mb-0 ml-4 c3");
        $ ( '#item_area' ).sortable ( "refresh" );
        init ();
      }
    } );

    /*****************************
     * add button
     ****************************/
    $ ( document ).on ( 'click', '.fa-plus-anc', function() {
      is_rewrite     = true;
      let item_block = $ ( this ).parent ().parent ();
      let item_block_title = $( this ).parent().prev(".row").children(".item_block_title");
      item_block_title.removeClass("col-9 c1");
      item_block_title.addClass("col-5 c1");
      item_block_title.children().removeClass("mb-1 ml-2 c3")
      item_block_title.children().addClass("mb-0 ml-4 c3")
      item_block.addClass ( "form_item" );
      item_block.slideUp ( "fast", function() {
        $ ( "#item_area" ).append ( item_block );
      } );
      item_block.slideDown ( "fast" );
      $ ( "#item_area .required_checkbox .real_time_validation_checkbox" ).each ( function( index, elem ) {
        $ ( this ).attr ( 'name', 'required[' + index + ']' );
      } );
      item_block.find ( ".prop_block" ).show ();
      item_block.find ( ".remove_arrow" ).show ();
      $ ( this ).removeClass ( "ui-draggable" );
      $ ( this ).removeClass ( "ui-draggable-handle" );
      $ ( this ).removeClass ( "form_block" );
      $ ( '#item_area' ).sortable ( "refresh" );
      init ();
    } );

    /*****************************
     * remove_arrow
     ****************************/
    $ ( document ).on ( "click", ".remove_arrow", function( event ) {
      // event.stopPropagation ();
      $ ( this ).hide ();
      is_rewrite     = true;
      let is_move    = false;
      let item_block = $ ( this ).parent ().parent ();
      let item_block_title = $( this ).parent().prev(".row").children(".item_block_title");
      item_block_title.removeClass("col-5 c1");
      item_block_title.addClass("col-9 c1");
      item_block_title.children().removeClass("mb-0 ml-4 c3")
      item_block_title.children().addClass("mb-1 ml-2 c3")
      item_block.hide ();
      item_block.removeClass ( "active_item" );
      item_block.removeClass ( "form_item" );
      item_block.addClass ( "form_block" );
      item_block.find ( ".add_arrow" ).show ();
      item_block.find ( ".prop_block" ).hide ();
      item_block.find ( 'input[type="text"]' ).val ( "" );
      item_block.find ( 'input[type="text"]' ).val ( "" );
      item_block.find ( "input[type='checkbox']" ).prop ( 'checked', false );

      $ ( ".form_block" ).each ( function() {
        let view_no = $ ( this ).data ( "viewno" );
        if ( item_block.data ( "viewno" ) < view_no ) {
          $ ( this ).before ( item_block );
          item_block.slideDown ( "fast" );
          is_move = true;
        }
      } );

      if ( is_move == false ) {
        $ ( "#block_area" ).append ( item_block );
        item_block.slideDown ( "fast" );
      }
      $ ( "#item_area" ).find ( ".prop_block" ).show ();
      $ ( "#item_area" ).find ( ".remove_arrow" ).show ();
      item_block.addClass ( "ui-draggable" );
      item_block.addClass ( "ui-draggable-handle" );
      item_block.addClass ( "form_block" );
      $ ( '#item_area' ).sortable ( "refresh" );
    } );

    /**************************
     * rew_btn
     *************************/
    $ ( '#rew_btn' ).on ( "click", function( event ) {
      is_rewrite = false;
      $ ( '#rew_form' ).submit ();
    } );
  </script>
  <?php if(isset($append['admin_form_item_edit_bottom_section'])): ?><?php echo $append['admin_form_item_edit_bottom_section']; ?><?php endif; ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/xs958314/yugyosen.com/public_html/public/contact/em_laravel/resources/views/admin/form_item/edit.blade.php ENDPATH**/ ?>