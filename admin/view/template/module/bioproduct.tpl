<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a onclick="buttonApply();" data-toggle="tooltip" title="Apply Changes" class="btn btn-default"><i class="fa fa-plus-circle"></i></a>
                <button type="submit" form="form-buyshop" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1>Buyshop theme configuration options</h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                <a class="products_button" href="<?php echo $bproduct; ?>">Buyshop Additional Products Options</a>
                <a class="products_button" href="<?php echo $bcategory; ?>">Buyshop Additional Categories Options</a>
            </div>
            <div class="panel-body">
                <form name="settingsform" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-buyshop" class="form-horizontal">
                    <ul class="nav nav-tabs main_tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab">Layout</a></li>
                        <li><a href="#tab-colors" data-toggle="tab">Colors,backgrounds,fonts</a></li>
                        <li><a href="#tab-products" data-toggle="tab">Products sliders, products listings</a></li>
                        <li><a href="#tab-flexslider" data-toggle="tab">Flexslider settings</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-------------------------------------tab General---------------------------------->
                        <div class="tab-pane active" id="tab-general">
                            <ul class="nav nav-tabs col-sm-3 main_tabs_vertical">
                                <li class="active"><a href="#tab-general-layout1" class="selected" data-toggle="tab">General</a></li>
                                <li><a href="#tab-general-layout2" data-toggle="tab">Navigation</a></li>
                                <li><a href="#tab-general-layout3" data-toggle="tab">Social accounts</a></li>
                                <li><a href="#tab-general-layout4" data-toggle="tab">Additional settings</a></li>
                            </ul>

                            <div class="tab-content col-sm-8">
                                <!--general-->
                                <div class="tab-pane active" id="tab-general-layout1">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-layout_skin">
                                            <span data-toggle="tooltip" title="Choose own layout">Main Layout for all site</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_general[layout_skin]" id="input-layout_skin" class="form-control">
                                                <option <?php if ($bioproduct_general['layout_skin'] == 'skin_creative') : ?> selected="selected" <?php endif; ?> value="skin_creative">CREATIVE</option>
                                                <option <?php if ($bioproduct_general['layout_skin'] == 'skin_lifestore') : ?> selected="selected" <?php endif; ?> value="skin_lifestore">LIFESTORE</option>
                                                <option <?php if ($bioproduct_general['layout_skin'] == 'skin_medstore') : ?> selected="selected" <?php endif; ?> value="skin_medstore">MEDSTORE</option>
                                                <option <?php if ($bioproduct_general['layout_skin'] == 'skin_cosmetic') : ?> selected="selected" <?php endif; ?> value="skin_cosmetic">COSMETIC</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Enable/disable Header tool line">Header tool line</span>
                                        </label>
                                        <div class="col-sm-8" id="bioproduct_general_headertopline_container">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["headertopline"]) { ?>
                                                <input type="radio" name="bioproduct_general[headertopline]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[headertopline]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["headertopline"]) { ?>
                                                <input type="radio" name="bioproduct_general[headertopline]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[headertopline]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Enable/disable Header Spy Panel">Header Spy Panel</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["headerspy"]) { ?>
                                                <input type="radio" name="bioproduct_general[headerspy]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[headerspy]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["headerspy"]) { ?>
                                                <input type="radio" name="bioproduct_general[headerspy]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[headerspy]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Enable/disable Right quick panel">Right quick panel</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["quickpanel"]) { ?>
                                                <input type="radio" name="bioproduct_general[quickpanel]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[quickpanel]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["quickpanel"]) { ?>
                                                <input type="radio" name="bioproduct_general[quickpanel]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[quickpanel]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Enable/disable Footer popup">Footer popup</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["footerpopup"]) { ?>
                                                <input type="radio" name="bioproduct_general[footerpopup]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[footerpopup]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["footerpopup"]) { ?>
                                                <input type="radio" name="bioproduct_general[footerpopup]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[footerpopup]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-footerpopup_mode">
                                            <span data-toggle="tooltip" title="Choose between slide and normal footer popup display mode">Footer popup display mode:</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_general[footerpopup_mode]" id="input-footerpopup_mode" class="form-control">
                                                <option <?php if ($bioproduct_general['footerpopup_mode'] == 'slide') : ?> selected="selected" <?php endif; ?> value="slide">Slide block</option>
                                                <option <?php if ($bioproduct_general['footerpopup_mode'] == 'normal') : ?> selected="selected" <?php endif; ?> value="normal">Normal display</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-name-welcome_not_registered<?php echo $language['language_id']; ?>">
                                            Welcome text in header (if not logged)
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-welcome_not_registered">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-welcome_not_registered<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-welcome_not_registered<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][welcome_not_registered]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['welcome_not_registered'] : ''; ?>" placeholder="Custom menu item - title:" id="input-name-welcome_not_registered<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-name-welcome_registered<?php echo $language['language_id']; ?>">
                                            Welcome text in header (if registered)
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-welcome_registered">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-welcome_registered<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-welcome_registered<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][welcome_registered]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['welcome_registered'] : ''; ?>" placeholder="Custom menu item - title:" id="input-name-welcome_registered<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-meta-title">
                                            <span data-toggle="tooltip" title="Here you can enter simple text or html content for footer copyright.">
                                                Footer copyright content:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" name="bioproduct_general[footercopyright]" value="<?php echo $bioproduct_general['footercopyright']; ?>" placeholder="Footer copyright content:" id="input-meta-title" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-meta-keyword">
                                            <span data-toggle="tooltip" title="Edit content here or change / add your own images for payment icons">
                                                Footer payment icons images:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <textarea name="bioproduct_general[footerpayment]" rows="5" placeholder="Footer payment icons images:" id="input-meta-keyword" class="form-control">
                                                <?php echo $bioproduct_general['footerpayment']; ?>
                                            </textarea>

                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["footerpayment_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[footerpayment_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[footerpayment_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["footerpayment_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[footerpayment_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[footerpayment_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Enable/disable Sidebar on Home Page and in listings">Sidebar</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["sidebar"]) { ?>
                                                <input type="radio" name="bioproduct_general[sidebar]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[sidebar]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["sidebar"]) { ?>
                                                <input type="radio" name="bioproduct_general[sidebar]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[sidebar]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-rightimg">Logo (Right quick panel):</label>
                                        <div class="col-sm-8"><a href="" id="thumb-rightimg" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $rightimg; ?>" alt="" title="" data-placeholder="Logo (Right quick panel):" /></a>
                                            <input type="hidden" name="bioproduct_rightimg" value="<?php echo $bioproduct_rightimg; ?>" id="input-rightimg" />
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-bgall">Background image (all pages):</label>
                                        <div class="col-sm-8"><a href="" id="thumb-bgall" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $bgall; ?>" alt="" title="" data-placeholder="Background image (all pages):" /></a>
                                            <input type="hidden" name="bioproduct_bgall" value="<?php echo $bioproduct_bgall; ?>" id="input-bgall" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-bgimage_mode">
                                            <span data-toggle="tooltip" title="Set background image display mode">
                                                Background Image display mode:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_general[bgimage_mode]" id="input-bgimage_mode" class="form-control">
                                                <option <?php if ($bioproduct_general['bgimage_mode'] == 'no-repeat') : ?> selected="selected" <?php endif; ?> value="no-repeat">No-repeat</option>
                                                <option <?php if ($bioproduct_general['bgimage_mode'] == 'repeat') : ?> selected="selected" <?php endif; ?> value="repeat">Repeat</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!--general-->

                                <!--navigation-->
                                <div id="tab-general-layout2" class="tab-pane">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-description-customblock<?php echo $language['language_id']; ?>">
                                            Custom block content:
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-customblock">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-customblock<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-customblock<?php echo $language['language_id']; ?>">
                                                    <textarea name="bioproduct_general[<?php echo $language['language_id']; ?>][customblock_html]" placeholder="Custom block content:" id="input-description-customblock<?php echo $language['language_id']; ?>">
                                                        <?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['customblock_html'] : ''; ?>
                                                    </textarea>
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Here you can enable / disable custom block in top menu.">Custom block</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["customblock_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[customblock_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[customblock_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["customblock_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[customblock_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[customblock_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-name-customitem_item_title1<?php echo $language['language_id']; ?>">
                                            <span data-toggle="tooltip" title="Set menu item title.">
                                                Custom menu item - title:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-customitem_item_title1">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-customitem_item_title1<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-customitem_item_title1<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][customitem_item_title1]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['customitem_item_title1'] : ''; ?>" placeholder="Custom menu item - title:" id="input-name-customitem_item_title1<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-customitem_item_url1">
                                            <span data-toggle="tooltip" title="Set menu item url.">
                                                Custom menu item - url:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" name="bioproduct_general[customitem_item_url1]" value="<?php echo $bioproduct_general['customitem_item_url1']; ?>" placeholder="Footer copyright content:" id="input-customitem_item_url1" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Here you can enable / disable second custom link in top menu.">Second custom link in top menu:</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["customitem_item_status2"]) { ?>
                                                <input type="radio" name="bioproduct_general[customitem_item_status2]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[customitem_item_status2]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["customitem_item_status2"]) { ?>
                                                <input type="radio" name="bioproduct_general[customitem_item_status2]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[customitem_item_status2]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-name-customitem_item_title2<?php echo $language['language_id']; ?>">
                                            <span data-toggle="tooltip" title="Set menu item title.">
                                                Second custom link in top menu - title:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-customitem_item_title2">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-customitem_item_title2<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-customitem_item_title2<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][customitem_item_title2]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['customitem_item_title2'] : ''; ?>" placeholder="Second custom link in top menu - title:" id="input-name-customitem_item_title2<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-customitem_item_url2">
                                            <span data-toggle="tooltip" title="Set url for second custom link in top menu (use full url format starting with // for outer links).">
                                                Second custom link in top menu - url:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" name="bioproduct_general[customitem_item_url2]" value="<?php echo $bioproduct_general['customitem_item_url2']; ?>" placeholder="Footer copyright content:" id="input-customitem_item_url2" class="form-control" />
                                        </div>
                                    </div>

                                    <!--blog-->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Link Blog in top menu - status:</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["blog_link_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[blog_link_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[blog_link_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["blog_link_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[blog_link_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[blog_link_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-blog_link_title<?php echo $language['language_id']; ?>">
                                            <span data-toggle="tooltip" title="Set menu item title.">
                                                Set Link Blog title.
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-blog_link_title">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-blog_link_title<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-blog_link_title<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][blog_link_title]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['blog_link_title'] : ''; ?>" placeholder="Second custom link in top menu - title:" id="input-blog_link_title<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-blog_link_url">Link Blog in top menu - url:</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="bioproduct_general[blog_link_url]" value="<?php echo $bioproduct_general['blog_link_url']; ?>" placeholder="Link Blog in top menu - url:" id="input-blog_link_url" class="form-control" />
                                        </div>
                                    </div>
                                    <!--blog-->

                                    <!--link pages-->
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-contacts_link_title<?php echo $language['language_id']; ?>">
                                            Link Pages in top menu - title:
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-contacts_link_title">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-contacts_link_title<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-contacts_link_title<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][contacts_link_title]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['contacts_link_title'] : ''; ?>" placeholder="Custom menu item - title:" id="input-contacts_link_title<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-pages_link_url">
                                            <span data-toggle="tooltip" title="Set url for link pages item, for example, 'index.php?route=information/contact'  (use full url format starting with // for outer links).">
                                                Link Pages in top menu - url:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" name="bioproduct_general[pages_link_url]" value="<?php echo $bioproduct_general['pages_link_url']; ?>" placeholder="Link Pages in top menu - url:" id="input-pages_link_url" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Here you can enable / disable this link in top menu.">Link Pages in top menu :</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["pages_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[pages_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[pages_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["pages_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[pages_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[pages_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Here you can enable / disable this link in top menu.">Link Contact in top menu display:</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["contact_map_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[contact_map_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[contact_map_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["contact_map_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[contact_map_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[contact_map_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-contact_map_title<?php echo $language['language_id']; ?>">
                                            Link Contact in top menu - title:
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-contact_map_title">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-contact_map_title<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-contact_map_title<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_general[<?php echo $language['language_id']; ?>][contact_map_title]" value="<?php echo isset($bioproduct_general[$language['language_id']]) ? $bioproduct_general[$language['language_id']]['contact_map_title'] : ''; ?>" placeholder="Custom menu item - title:" id="input-contact_map_title<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>

                                    <!--pages-->
                                    <fieldset>
                                        <legend>Links in item "PAGES" in Top Menu</legend>
                                        <?php if (isset($information_pages)) : ?>
                                            <?php foreach ($information_pages as $information_page) : ?>

                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label" for="input-additional_page_status<?php echo $information_page['information_id']; ?>">Link: <?php echo $information_page['title']; ?></label>
                                                    <div class="col-sm-8">
                                                        <input type="hidden" name="bioproduct_general[additional_page_id][<?php echo $information_page['information_id']; ?>]" value="<?php echo $information_page['information_id']; ?>">

                                                        <select name="bioproduct_general[additional_page_status][<?php echo $information_page['information_id']; ?>]" id="input-additional_page_status<?php echo $information_page['information_id']; ?>" class="form-control">
                                                            <option <?php if ($bioproduct_general['additional_page_status'][$information_page['information_id']] == '1') : ?> selected="selected" <?php endif; ?> value="1">Enable</option>
                                                            <option <?php if ($bioproduct_general['additional_page_status'][$information_page['information_id']] == '0') : ?> selected="selected" <?php endif; ?> value="0">Disable</option>
                                                        </select>
                                                    </div>
                                                </div>


                                            <?php endforeach; ?>
                                        <?php endif; ?>



                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-additional_page_checkout_status">Link: Checkout</label>
                                            <div class="col-sm-8">
                                                <select name="bioproduct_general[additional_page_checkout_status]" id="input-additional_page_checkout_status" class="form-control">
                                                    <option <?php if ($bioproduct_general['additional_page_checkout_status'] == '1') : ?> selected="selected" <?php endif; ?> value="1">Enable</option>
                                                    <option <?php if ($bioproduct_general['additional_page_checkout_status'] == '0') : ?> selected="selected" <?php endif; ?> value="0">Disable</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-additional_page_account_status">Link: Account</label>
                                            <div class="col-sm-8">
                                                <select name="bioproduct_general[additional_page_account_status]" id="input-additional_page_account_status" class="form-control">
                                                    <option <?php if ($bioproduct_general['additional_page_account_status'] == '1') : ?> selected="selected" <?php endif; ?> value="1">Enable</option>
                                                    <option <?php if ($bioproduct_general['additional_page_account_status'] == '0') : ?> selected="selected" <?php endif; ?> value="0">Disable</option>
                                                </select>
                                            </div>
                                        </div>

                                    </fieldset>

                                    <!--pages-->

                                </div>
                                <!--navigation-->

                                <!--social accounts-->
                                <div id="tab-general-layout3" class="tab-pane">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-socials">
                                            <span data-toggle="tooltip" title="Edit content here or add your own">
                                                Social buttons in the footer:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <textarea name="bioproduct_general[socials]" rows="5" placeholder="Social buttons in the footer:" id="input-socials" class="form-control">
                                                <?php echo $bioproduct_general['socials']; ?>
                                            </textarea>

                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["socials_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[socials_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[socials_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["socials_status"]) { ?>
                                                <input type="radio" name="bioproduct_general[socials_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[socials_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>

                                        </div>
                                    </div>

                                </div>
                                <!--social accounts-->

                                <!--additional settings-->
                                <div id="tab-general-layout4" class="tab-pane">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Enable/disable custom.css file. <br>(It has to be located in catalog/view/theme/bioproduct/stylesheet/custom.css)">Using custom.css file</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_general["css_file"]) { ?>
                                                <input type="radio" name="bioproduct_general[css_file]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[css_file]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_general["css_file"]) { ?>
                                                <input type="radio" name="bioproduct_general[css_file]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_general[css_file]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-google_map">
                                            <span data-toggle="tooltip" title="Here you can generate your own code for the map. Please, firstly read details in documentation.
                                            <br>Keep in mind, if you leave this field empty Google Map will not be displayed.">
                                                Google Map code in Contact Page:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <textarea name="bioproduct_additional[google_map]" rows="5" placeholder="Footer payment icons images:" id="input-google_map" class="form-control">
                                                <?php echo $bioproduct_additional['google_map']; ?>
                                            </textarea>
                                        </div>
                                    </div>
                                    <fieldset>
                                        <legend>Contact Popup Block</legend>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-contactimg">Logo (Contact Popup):</label>
                                            <div class="col-sm-8"><a href="" id="thumb-contactimg" data-toggle="image" class="img-thumbnail">
                                                <img src="<?php echo $contactimg; ?>" alt="" title="" data-placeholder="Logo (Contact Popup):" /></a>
                                                <input type="hidden" name="bioproduct_contactimg" value="<?php echo $bioproduct_contactimg; ?>" id="input-contactimg" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-google_map_top">
                                                <span data-toggle="tooltip" title="Here you can generate your own code for the map. Please, firstly read details in documentation.<br>Keep in mind, if you leave this field empty Google Map will not be displayed.">
                                                    Google Map code in Top Contact Popup:
                                                </span>
                                            </label>
                                            <div class="col-sm-8">
                                                <textarea name="bioproduct_additional[google_map_top]" rows="5" placeholder="Footer payment icons images:" id="input-google_map_top" class="form-control">
                                                    <?php echo $bioproduct_additional['google_map_top']; ?>
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-description-contactpopup<?php echo $language['language_id']; ?>">
                                                Content for Contact Popup:
                                            </label>
                                            <div class="col-sm-8">
                                                <ul class="nav nav-tabs" id="language">
                                                    <?php foreach ($languages as $language) : ?>
                                                    <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                    <?php endforeach; ?>
                                                </ul>
                                                <div class="tab-content">
                                                    <?php foreach ($languages as $language) : ?>
                                                    <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language<?php echo $language['language_id']; ?>">
                                                        <textarea name="bioproduct_additional[<?php echo $language['language_id']; ?>][contactpopup_html]" placeholder="Content for Contact Popup:" id="input-description-contactpopup<?php echo $language['language_id']; ?>">
                                                            <?php echo isset($bioproduct_additional[$language['language_id']]) ? $bioproduct_additional[$language['language_id']]['contactpopup_html'] : ''; ?>
                                                        </textarea>
                                                    </div>
                                                    <?php endforeach; ?>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>


                                    <fieldset>
                                        <legend>Width of sliders</legend>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-flexslider_width">
                                                <span data-toggle="tooltip" title="Choose width of FlexSlider (full, boxed).">
                                                     FlexSlider:
                                                </span>
                                            </label>
                                            <div class="col-sm-8">
                                                <select name="bioproduct_additional[flexslider_width]" id="input-flexslider_width" class="form-control">
                                                    <option <?php if ($bioproduct_additional['flexslider_width'] == 'full_width') : ?> selected="selected" <?php endif; ?> value="full_width">Full width of slider</option>
                                                    <option <?php if ($bioproduct_additional['flexslider_width'] == 'boxed') : ?> selected="selected" <?php endif; ?> value="boxed">Boxed slider</option>
                                                </select>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-revolution_width">
                                                <span data-toggle="tooltip" title="Choose width of Revolution/Layer Slider (full, boxed).">
                                                     Revolution/Layer Slider:
                                                </span>
                                            </label>
                                            <div class="col-sm-8">
                                                <select name="bioproduct_additional[revolution_width]" id="input-revolution_width" class="form-control">
                                                    <option <?php if ($bioproduct_additional['revolution_width'] == 'full_width') : ?> selected="selected" <?php endif; ?> value="full_width">Full width of slider</option>
                                                    <option <?php if ($bioproduct_additional['revolution_width'] == 'boxed') : ?> selected="selected" <?php endif; ?> value="boxed">Boxed slider</option>
                                                </select>
                                            </div>
                                        </div>


                                    </fieldset>


                                </div>
                                <!--additional settings-->
                            </div>
                        </div>
                        <!-------------------------------------end tab General---------------------------------->

                        <!-------------------------------------tab Colors,backgrounds,fonts-->
                        <div class="tab-pane" id="tab-colors">

                        <ul class="nav nav-tabs col-sm-3 main_tabs_vertical">
                            <li class="active"><a href="#tab-colors-layout1" class="selected" data-toggle="tab">General</a></li>
                            <li><a href="#tab-colors-layout2" data-toggle="tab">Captions</a></li>
                            <li><a href="#tab-colors-layout3" data-toggle="tab">Header ToolLine</a></li>
                            <li><a href="#tab-colors-layout4" data-toggle="tab">Drop down boxes (TopLine)</a></li>
                            <li><a href="#tab-colors-layout5" data-toggle="tab">Header / Navigation</a></li>
                            <li><a href="#tab-colors-layout6" data-toggle="tab">Content</a></li>
                            <li><a href="#tab-colors-layout7" data-toggle="tab">Footer Welcome slider</a></li>
                            <li><a href="#tab-colors-layout8" data-toggle="tab">Footer</a></li>
                            <li><a href="#tab-colors-layout9" data-toggle="tab">Footer popup</a></li>
                            <li><a href="#tab-colors-layout10" data-toggle="tab">Price</a></li>
                        </ul>
                        <div class="tab-content col-sm-8">
                            <!--subtabs: General -->
                            <div class="tab-pane active" id="tab-colors-layout1">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_themecolor">
                                    <span data-toggle="tooltip" title="This color will be used for buttons and icons.">
                                        Theme color:
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_theme_general_themecolor" style="background-color:<?php echo $bioproduct_theme['general_themecolor']; ?>;color:white" type="text" name="bioproduct_theme[general_themecolor]" value="<?php echo $bioproduct_theme['general_themecolor']; ?>" placeholder="Theme color:" id="general_themecolor" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_themehover">
                                    <span data-toggle="tooltip" title="Set color for mouse over for buttons and icons.">
                                        Theme Hover Color:
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_general_themehover" style="background-color:<?php echo $bioproduct_colors['general_themehover']; ?>;color:white" type="text" name="bioproduct_colors[general_themehover]" value="<?php echo $bioproduct_colors['general_themehover']; ?>" placeholder="Theme Hover Color:" id="general_themehover" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_input">
                                    <span data-toggle="tooltip" title="Set color for input border.">
                                        Input hover color (focus border):
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_general_input" style="background-color:<?php echo $bioproduct_colors['general_input']; ?>;color:white" type="text" name="bioproduct_colors[general_input]" value="<?php echo $bioproduct_colors['general_input']; ?>" placeholder="Input hover color (focus border):" id="general_input" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_text">
                                    <span data-toggle="tooltip" title="Set default text color for all blocks.">
                                        Text Color:
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_general_text" style="background-color:<?php echo $bioproduct_colors['general_text']; ?>;color:white" type="text" name="bioproduct_colors[general_text]" value="<?php echo $bioproduct_colors['general_text']; ?>" placeholder="Text Color:" id="general_text" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_link">
                                    <span data-toggle="tooltip" title="Set default link color for all blocks.">
                                        Link Color:
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_general_link" style="background-color:<?php echo $bioproduct_colors['general_link']; ?>;color:white" type="text" name="bioproduct_colors[general_link]" value="<?php echo $bioproduct_colors['general_link']; ?>" placeholder="Link Color:" id="general_link" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_linkhover">
                                    <span data-toggle="tooltip" title="Set default link hover color for all blocks.">
                                        Link Hover Color:
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_general_linkhover" style="background-color:<?php echo $bioproduct_colors['general_linkhover']; ?>;color:white" type="text" name="bioproduct_colors[general_linkhover]" value="<?php echo $bioproduct_colors['general_linkhover']; ?>" placeholder="Theme color:" id="general_linkhover" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="general_bgcolor">
                                    <span data-toggle="tooltip" title="Set background color for all content.">
                                        Background Color:
                                    </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_general_bgcolor" style="background-color:<?php echo $bioproduct_colors['general_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[general_bgcolor]" value="<?php echo $bioproduct_colors['general_bgcolor']; ?>" placeholder="Theme color:" id="general_bgcolor" />
                                    </div>
                                </div>

                            </div>
                            <!--subtabs: General -->

                            <!--subtabs: Captions  -->
                            <div id="tab-colors-layout2" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">
                                    Font:<div class="help">Select font which will be used for headings, buttons, block titles etc. Theme use Google font's library. Find out more here - <a target="_blank" href="//www.google.com/fonts/">Google web fonts free library</a></div>
                                    </label>
                                    <div class="col-sm-6">
                                        <select class="form-control width_auto" id="bioproduct_colors_captions_font" name="bioproduct_colors[captions_font]" data-active="<?php echo $bioproduct_colors['captions_font']; ?>">
                                            <option value="-">Select</option>
                                            <option value="Oswald">Oswald</option>
                                            <option value="Aclonica">Aclonica</option>
                                            <option value="Allan">Allan</option>
                                            <option value="Allerta">Allerta</option>
                                            <option value="Amaranth">Amaranth</option>
                                            <option value="Anton">Anton</option>
                                            <option value="Arimo">Arimo</option>
                                            <option value="Artifika">Artifika</option>
                                            <option value="Arvo">Arvo</option>
                                            <option value="Asset">Asset</option>
                                            <option value="Astloch">Astloch</option>
                                            <option value="Bangers">Bangers</option>
                                            <option value="Bentham">Bentham</option>
                                            <option value="Bevan">Bevan</option>
                                            <option value="Cabin">Cabin</option>
                                            <option value="Calligraffitti">Calligraffitti</option>
                                            <option value="Candal">Candal</option>
                                            <option value="Cantarell">Cantarell</option>
                                            <option value="Cardo">Cardo</option>
                                            <option value="Coda">Coda</option>
                                            <option value="Crushed">Crushed</option>
                                            <option value="Cuprum">Cuprum</option>
                                            <option value="Damion">Damion</option>
                                            <option value="Forum">Forum</option>
                                            <option value="Geo">Geo</option>
                                            <option value="Gruppo">Gruppo</option>
                                            <option value="Inconsolata">Inconsolata</option>
                                            <option value="Judson">Judson</option>
                                            <option value="Jura">Jura</option>
                                            <option value="Kameron">Kameron</option>
                                            <option value="Kenia">Kenia</option>
                                            <option value="Kranky">Kranky</option>
                                            <option value="Kreon">Kreon</option>
                                            <option value="Kristi">Kristi</option>
                                            <option value="Lekton">Lekton</option>
                                            <option value="Limelight">Limelight</option>
                                            <option value="Lobster">Lobster</option>
                                            <option value="Lora">Lora</option>
                                            <option value="Mako">Mako</option>
                                            <option value="MedievalSharp">MedievalSharp</option>
                                            <option value="Megrim">Megrim</option>
                                            <option value="Merriweather">Merriweather</option>
                                            <option value="Metrophobic">Metrophobic</option>
                                            <option value="Michroma">Michroma</option>
                                            <option value="Monofett">Monofett</option>
                                            <option value="Neucha">Neucha</option>
                                            <option value="Neuton">Neuton</option>
                                            <option value="Orbitron">Orbitron</option>
                                            <option value="Pacifico">Pacifico</option>
                                            <option value="Philosopher">Philosopher</option>
                                            <option value="Play">Play</option>
                                            <option value="Puritan">Puritan</option>
                                            <option value="Quattrocento">Quattrocento</option>
                                            <option value="Radley">Radley</option>
                                            <option value="Rokkitt">Rokkitt</option>
                                            <option value="Schoolbell">Schoolbell</option>
                                            <option value="Slackey">Slackey</option>
                                            <option value="Smythe">Smythe</option>
                                            <option value="Sunshiney">Sunshiney</option>
                                            <option value="Syncopate">Syncopate</option>
                                            <option value="Tangerine">Tangerine</option>
                                            <option value="Ubuntu">Ubuntu</option>
                                            <option value="Ultra">Ultra</option>
                                            <option value="Varela">Varela</option>
                                            <option value="Vibur">Vibur</option>
                                            <option value="Wallpoet">Wallpoet</option>
                                            <option value="Zeyada">Zeyada</option>
                                        </select>
                                        <span id="bioproduct_colors_captions_font_preview" style="font-size:30px;line-height: 30px; display:block;padding:8px 0 0 0">Lorem Ipsum Dolor</span>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-6 control-label" for="captions_text">
                                    <span data-toggle="tooltip" title="Set text color for all captions.">
                                        Text Color:
                                    </span>
                                    </label>
                                    <div class="col-sm-6">
                                        <input class="form-control width_auto" id="bioproduct_colors_captions_text" style="background-color:<?php echo $bioproduct_colors['captions_text']; ?>;color:white" type="text" name="bioproduct_colors[captions_text]" value="<?php echo $bioproduct_colors['captions_text']; ?>" placeholder="Set text color for all captions." id="captions_text" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: Captions  -->

                            <!--subtabs: tool line  -->
                            <div id="tab-colors-layout3" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="topline_text">
                                        <span data-toggle="tooltip" title="Set text color for header tool line.">
                                            Text Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_topline_text" style="background-color:<?php echo $bioproduct_colors['topline_text']; ?>;color:white" type="text" name="bioproduct_colors[topline_text]" value="<?php echo $bioproduct_colors['topline_text']; ?>" placeholder="Text Color:" id="topline_text" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="topline_link">
                                        <span data-toggle="tooltip" title="Set link color for header tool line.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_topline_link" style="background-color:<?php echo $bioproduct_colors['topline_link']; ?>;color:white" type="text" name="bioproduct_colors[topline_link]" value="<?php echo $bioproduct_colors['topline_link']; ?>" placeholder="Link Color:" id="topline_link" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="topline_linkhover">
                                        <span data-toggle="tooltip" title="Set link hover color for header tool line.">
                                            Link Hover Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_topline_linkhover" style="background-color:<?php echo $bioproduct_colors['topline_linkhover']; ?>;color:white" type="text" name="bioproduct_colors[topline_linkhover]" value="<?php echo $bioproduct_colors['topline_linkhover']; ?>" placeholder="Link Hover Color:" id="topline_linkhover" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="topline_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for header tool line.">
                                            Background Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_topline_bgcolor" style="background-color:<?php echo $bioproduct_colors['topline_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[topline_bgcolor]" value="<?php echo $bioproduct_colors['topline_bgcolor']; ?>" placeholder="Background Color:" id="topline_bgcolor" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <span data-toggle="tooltip" title="Set bottom shadow for header tool line">Shadow:</span>
                                    </label>
                                    <div class="col-sm-9">
                                        <label class="radio-inline">
                                            <?php if ($bioproduct_colors["topline_shadow"]) { ?>
                                            <input type="radio" name="bioproduct_colors[topline_shadow]" value="1" checked="checked" />
                                            <?php echo $text_yes; ?>
                                            <?php } else { ?>
                                            <input type="radio" name="bioproduct_colors[topline_shadow]" value="1" />
                                            <?php echo $text_yes; ?>
                                            <?php } ?>
                                        </label>
                                        <label class="radio-inline">
                                            <?php if (!$bioproduct_colors["topline_shadow"]) { ?>
                                            <input type="radio" name="bioproduct_colors[topline_shadow]" value="0" checked="checked" />
                                            <?php echo $text_no; ?>
                                            <?php } else { ?>
                                            <input type="radio" name="bioproduct_colors[topline_shadow]" value="0" />
                                            <?php echo $text_no; ?>
                                            <?php } ?>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="topline_phonecolor">
                                        <span data-toggle="tooltip" title="Set text color for phone number in tool line.">
                                            Phone Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_topline_phonecolor" style="background-color:<?php echo $bioproduct_colors['topline_phonecolor']; ?>;color:white" type="text" name="bioproduct_colors[topline_phonecolor]" value="<?php echo $bioproduct_colors['topline_phonecolor']; ?>" placeholder="Phone number color:" id="topline_phonecolor" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: tool line  -->

                            <!--subtabs: Drop down boxes (TopLine)   -->
                            <div id="tab-colors-layout4" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="dd_ink">
                                        <span data-toggle="tooltip" title="Set link color for drop down box in header tool line.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_dd_ink" style="background-color:<?php echo $bioproduct_colors['dd_ink']; ?>;color:white" type="text" name="bioproduct_colors[dd_ink]" value="<?php echo $bioproduct_colors['dd_ink']; ?>" placeholder="Link Color:" id="dd_ink" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="dd_linkhover">
                                        <span data-toggle="tooltip" title="Set link hover color for drop down box in header tool line.">
                                            Link Hover Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_dd_linkhover" style="background-color:<?php echo $bioproduct_colors['dd_linkhover']; ?>;color:white" type="text" name="bioproduct_colors[dd_linkhover]" value="<?php echo $bioproduct_colors['dd_linkhover']; ?>" placeholder="Link Hover Color:" id="dd_linkhover" />
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="dd_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for drop down box in header tool line.">
                                            Background Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_dd_bgcolor" style="background-color:<?php echo $bioproduct_colors['dd_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[dd_bgcolor]" value="<?php echo $bioproduct_colors['dd_bgcolor']; ?>" placeholder="Background Color:" id="dd_bgcolor" />
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="dd_border">
                                        <span data-toggle="tooltip" title="Set border color for drop down box in header tool line.">
                                            Border Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_dd_border" style="background-color:<?php echo $bioproduct_colors['dd_border']; ?>;color:white" type="text" name="bioproduct_colors[dd_border]" value="<?php echo $bioproduct_colors['dd_border']; ?>" placeholder="Border Color:" id="dd_border" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: Drop down boxes (TopLine)   -->

                            <!--subtabs: Header Navigation   -->
                            <div id="tab-colors-layout5" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="headernav_text">
                                        <span data-toggle="tooltip" title="Set color for texts in header blocks.">
                                            Navigation text color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_headernav_text" style="background-color:<?php echo $bioproduct_colors['headernav_text']; ?>;color:white" type="text" name="bioproduct_colors[headernav_text]" value="<?php echo $bioproduct_colors['headernav_text']; ?>" placeholder="Header text color:" id="headernav_text" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="headernav_link">
                                        <span data-toggle="tooltip" title="Set link color for drop down box (navigation menu, cart) in header.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_headernav_link" style="background-color:<?php echo $bioproduct_colors['headernav_link']; ?>;color:white" type="text" name="bioproduct_colors[headernav_link]" value="<?php echo $bioproduct_colors['headernav_link']; ?>" placeholder="Link Color:" id="headernav_link" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="headernav_linkhover">
                                        <span data-toggle="tooltip" title="Set link hover color for drop down box (navigation menu, cart) in header.">
                                            Link hover Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_headernav_linkhover" style="background-color:<?php echo $bioproduct_colors['headernav_linkhover']; ?>;color:white" type="text" name="bioproduct_colors[headernav_linkhover]" value="<?php echo $bioproduct_colors['headernav_linkhover']; ?>" placeholder="Link hover Color:" id="headernav_linkhover" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="header_bgcolor">
                                        <span data-toggle="tooltip" title="Set header background color for all header.">
                                           Header background color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_header_bgcolor" style="background-color:<?php echo $bioproduct_colors['header_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[header_bgcolor]" value="<?php echo $bioproduct_colors['header_bgcolor']; ?>" placeholder="Background color:" id="header_bgcolor" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="headernav_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for drop down box (navigation menu, cart) in header.">
                                            Blocks background color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_headernav_bgcolor" style="background-color:<?php echo $bioproduct_colors['headernav_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[headernav_bgcolor]" value="<?php echo $bioproduct_colors['headernav_bgcolor']; ?>" placeholder="Link Color:" id="headernav_bgcolor" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-headerpattern">
                                         <span data-toggle="tooltip" title="Set background pattern for header.">
                                            Background Pattern Image:
                                         </span>
                                    </label>
                                    <div class="col-sm-8"><a href="" id="thumb-headerpattern" data-toggle="image" class="img-thumbnail">
                                        <img src="<?php echo $headerpattern; ?>" alt="" title="" data-placeholder="Background Pattern Image:" /></a>
                                        <input type="hidden" name="bioproduct_headerpattern" value="<?php echo $bioproduct_headerpattern; ?>" id="input-headerpattern" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-decoration">
                                         <span data-toggle="tooltip" title="Set search decoration image for header.">
                                            Search decoration in header:
                                         </span>
                                    </label>
                                    <div class="col-sm-8"><a href="" id="thumb-decoration" data-toggle="image" class="img-thumbnail">
                                        <img src="<?php echo $decoration; ?>" alt="" title="" data-placeholder="Search decoration in header:" /></a>
                                        <input type="hidden" name="bioproduct_decoration" value="<?php echo $bioproduct_decoration; ?>" id="input-decoration" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="headernav_search_decoration_position">
                                        <span data-toggle="tooltip" title="Set one positive numerical value to align position of search decoration image (for example, 10).">
                                            Search decoration position:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" name="bioproduct_colors[headernav_search_decoration_position]" value="<?php echo $bioproduct_colors['headernav_search_decoration_position']; ?>" placeholder="Position:" id="headernav_search_decoration_position" class="form-control width_auto" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: Header Navigation   -->

                            <!--subtabs: Content -->
                            <div id="tab-colors-layout6" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="content_text">
                                        <span data-toggle="tooltip" title="Set text color for content blocks.">
                                            Text Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input class="form-control width_auto" id="bioproduct_colors_content_text" style="background-color:<?php echo $bioproduct_colors['content_text']; ?>;color:white" type="text" name="bioproduct_colors[content_text]" value="<?php echo $bioproduct_colors['content_text']; ?>" placeholder="Text Color:" id="content_text" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="content_link">
                                        <span data-toggle="tooltip" title="Set link color for content blocks.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input class="form-control width_auto" id="bioproduct_colors_content_link" style="background-color:<?php echo $bioproduct_colors['content_link']; ?>;color:white" type="text" name="bioproduct_colors[content_link]" value="<?php echo $bioproduct_colors['content_link']; ?>" placeholder="Link Color:" id="content_link" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="content_linkhover">
                                        <span data-toggle="tooltip" title="Set link hover color for content blocks.">
                                            Link Hover Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input class="form-control width_auto" id="bioproduct_colors_content_linkhover" style="background-color:<?php echo $bioproduct_colors['content_linkhover']; ?>;color:white" type="text" name="bioproduct_colors[content_linkhover]" value="<?php echo $bioproduct_colors['content_linkhover']; ?>" placeholder="Link hover Color:" id="content_linkhover" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="content_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for content blocks.">
                                            Background Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input class="form-control width_auto" id="bioproduct_colors_content_bgcolor" style="background-color:<?php echo $bioproduct_colors['content_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[content_bgcolor]" value="<?php echo $bioproduct_colors['content_bgcolor']; ?>" placeholder="Background Color:" id="content_bgcolor" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="input-contentbg">
                                         <span data-toggle="tooltip" title="Set background image for content.">
                                            Background Image:
                                         </span>
                                    </label>
                                    <div class="col-sm-7"><a href="" id="thumb-contentbg" data-toggle="image" class="img-thumbnail">
                                        <img src="<?php echo $contentbg; ?>" alt="" title="" data-placeholder="Background Image:" /></a>
                                        <input type="hidden" name="bioproduct_contentbg" value="<?php echo $bioproduct_contentbg; ?>" id="input-contentbg" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="content_bg_mode">
                                        <span data-toggle="tooltip" title="Set background image display mode">
                                             Background Image display mode:
                                        </span>
                                    </label>
                                    <div class="col-sm-7">
                                        <select name="bioproduct_colors[content_bg_mode]" id="content_bg_mode" class="form-control">
                                            <option <?php if ($bioproduct_colors['content_bg_mode'] == 'no-repeat') : ?> selected="selected" <?php endif; ?> value="no-repeat">no-repeat</option>
                                            <option <?php if ($bioproduct_colors['content_bg_mode'] == 'repeat') : ?> selected="selected" <?php endif; ?> value="repeat">Repeat</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="product_border">
                                        <span data-toggle="tooltip" title="Set product shadow and hover block background color.">
                                            Product block shadow and hover block color:
                                        </span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input class="form-control width_auto" id="bioproduct_colors_product_border" style="background-color:<?php echo $bioproduct_colors['product_border']; ?>;color:white" type="text" name="bioproduct_colors[product_border]" value="<?php echo $bioproduct_colors['product_border']; ?>" placeholder="Shadow, hover color:" id="product_border" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">
                                        <span data-toggle="tooltip" title="Enable/disable product border shadow">Product border shadow:</span>
                                    </label>
                                    <div class="col-sm-7">
                                        <label class="radio-inline">
                                            <?php if ($bioproduct_colors["product_shadow"]) { ?>
                                            <input type="radio" name="bioproduct_colors[product_shadow]" value="1" checked="checked" />
                                            <?php echo $text_yes; ?>
                                            <?php } else { ?>
                                            <input type="radio" name="bioproduct_colors[product_shadow]" value="1" />
                                            <?php echo $text_yes; ?>
                                            <?php } ?>
                                        </label>
                                        <label class="radio-inline">
                                            <?php if (!$bioproduct_colors["product_shadow"]) { ?>
                                            <input type="radio" name="bioproduct_colors[product_shadow]" value="0" checked="checked" />
                                            <?php echo $text_no; ?>
                                            <?php } else { ?>
                                            <input type="radio" name="bioproduct_colors[product_shadow]" value="0" />
                                            <?php echo $text_no; ?>
                                            <?php } ?>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: Content -->

                            <!--subtabs: Footer welcome -->
                            <div id="tab-colors-layout7" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="footerinfo_text">
                                        <span data-toggle="tooltip" title="Set text color for footer info block.">
                                            Text Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerinfo_text" style="background-color:<?php echo $bioproduct_colors['footerinfo_text']; ?>;color:white" type="text" name="bioproduct_colors[footerinfo_text]" value="<?php echo $bioproduct_colors['footerinfo_text']; ?>" placeholder="Text Color:" id="footerinfo_text" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="footerinfo_link">
                                        <span data-toggle="tooltip" title="Set link color for footer info block.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerinfo_link" style="background-color:<?php echo $bioproduct_colors['footerinfo_link']; ?>;color:white" type="text" name="bioproduct_colors[footerinfo_link]" value="<?php echo $bioproduct_colors['footerinfo_link']; ?>" placeholder="Link Color:" id="footerinfo_link" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="footerinfo_captions">
                                        <span data-toggle="tooltip" title="Set captions color for footer info block.">
                                            Captions  Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerinfo_captions" style="background-color:<?php echo $bioproduct_colors['footerinfo_captions']; ?>;color:white" type="text" name="bioproduct_colors[footerinfo_captions]" value="<?php echo $bioproduct_colors['footerinfo_captions']; ?>" placeholder="Captions  Color:" id="footerinfo_captions" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="footerinfo_bold">
                                        <span data-toggle="tooltip" title="Set subscription text color for footer info block.">
                                           Subscription Text Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerinfo_bold" style="background-color:<?php echo $bioproduct_colors['footerinfo_bold']; ?>;color:white" type="text" name="bioproduct_colors[footerinfo_bold]" value="<?php echo $bioproduct_colors['footerinfo_bold']; ?>" placeholder="Subscription Text Color:" id="footerinfo_bold" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="footerinfo_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for footer info block.">
                                            Background Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerinfo_bgcolor" style="background-color:<?php echo $bioproduct_colors['footerinfo_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[footerinfo_bgcolor]" value="<?php echo $bioproduct_colors['footerinfo_bgcolor']; ?>" placeholder="Background Color:" id="footerinfo_bgcolor" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: Footer welcome -->

                            <!--subtabs: Footer -->
                            <div id="tab-colors-layout8" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footer_text">
                                        <span data-toggle="tooltip" title="Set text color for footer block.">
                                            Text Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footer_text" style="background-color:<?php echo $bioproduct_colors['footer_text']; ?>;color:white" type="text" name="bioproduct_colors[footer_text]" value="<?php echo $bioproduct_colors['footer_text']; ?>" placeholder="Text Color:" id="footer_text" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footer_link">
                                        <span data-toggle="tooltip" title="Set link color for footer block.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footer_link" style="background-color:<?php echo $bioproduct_colors['footer_link']; ?>;color:white" type="text" name="bioproduct_colors[footer_link]" value="<?php echo $bioproduct_colors['footer_link']; ?>" placeholder="Link Color:" id="footer_link" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footer_link_hover">
                                        <span data-toggle="tooltip" title="Set link hover color for footer block.">
                                            Link Hover Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footer_link_hover" style="background-color:<?php echo $bioproduct_colors['footer_link_hover']; ?>;color:white" type="text" name="bioproduct_colors[footer_link_hover]" value="<?php echo $bioproduct_colors['footer_link_hover']; ?>" placeholder="Link Hover Color:" id="footer_link_hover" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footer_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for footer block.">
                                            Background Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footer_bgcolor" style="background-color:<?php echo $bioproduct_colors['footer_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[footer_bgcolor]" value="<?php echo $bioproduct_colors['footer_bgcolor']; ?>" placeholder="Background Color:" id="footer_bgcolor" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="delimeter">
                                         <span data-toggle="tooltip" title="Upload delimiter content image.">
                                            Delimiter Footer Image:
                                         </span>
                                    </label>
                                    <div class="col-sm-8"><a href="" id="thumb-delimeter" data-toggle="image" class="img-thumbnail">
                                        <img src="<?php echo $delimeter; ?>" alt="" title="" data-placeholder="Delimiter Footer Image:" /></a>
                                        <input type="hidden" name="bioproduct_delimeter" value="<?php echo $bioproduct_delimeter; ?>" id="delimeter" />
                                    </div>
                                </div>




                            </div>
                            <!--subtabs: Footer -->

                            <!--subtabs: Footer popup-->
                            <div id="tab-colors-layout9" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footerpopup_captions">
                                        <span data-toggle="tooltip" title="Set captions text color for footer popup block.">
                                            Captions text color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerpopup_captions" style="background-color:<?php echo $bioproduct_colors['footerpopup_captions']; ?>;color:white" type="text" name="bioproduct_colors[footerpopup_captions]" value="<?php echo $bioproduct_colors['footerpopup_captions']; ?>" placeholder="Captions text color:" id="footerpopup_captions" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footerpopup_link">
                                        <span data-toggle="tooltip" title="Set link color for footer popup block.">
                                            Link Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerpopup_link" style="background-color:<?php echo $bioproduct_colors['footerpopup_link']; ?>;color:white" type="text" name="bioproduct_colors[footerpopup_link]" value="<?php echo $bioproduct_colors['footerpopup_link']; ?>" placeholder="Link Color:" id="footerpopup_link" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footerpopup_linkhover">
                                        <span data-toggle="tooltip" title="Set link hover color for footer popup block.">
                                            Link Hover Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerpopup_linkhover" style="background-color:<?php echo $bioproduct_colors['footerpopup_linkhover']; ?>;color:white" type="text" name="bioproduct_colors[footerpopup_linkhover]" value="<?php echo $bioproduct_colors['footerpopup_linkhover']; ?>" placeholder="Link Hover Color:" id="footerpopup_linkhover" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footerpopup_bgcolor">
                                        <span data-toggle="tooltip" title="Set background color for footer popup block.">
                                            Background Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control width_auto" id="bioproduct_colors_footerpopup_bgcolor" style="background-color:<?php echo $bioproduct_colors['footerpopup_bgcolor']; ?>;color:white" type="text" name="bioproduct_colors[footerpopup_bgcolor]" value="<?php echo $bioproduct_colors['footerpopup_bgcolor']; ?>" placeholder="Background Color:" id="footerpopup_bgcolor" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="footerpopup_bgtrans">
                                        <span data-toggle="tooltip" title="Set background transparency for footer popup block (0..1).">
                                            Background Transparency:
                                        </span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" name="bioproduct_colors[footerpopup_bgtrans]" value="<?php echo $bioproduct_colors['footerpopup_bgtrans']; ?>" placeholder="Transparency:" id="footerpopup_bgtrans" class="form-control width_auto" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: Footer popup-->

                            <!--subtabs: price-->
                            <div id="tab-colors-layout10" class="tab-pane">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">
                                        Price Font:<div class="help">Select font which will be used for prices. Theme use Google font's library. Find out more here - <a target="_blank" href="//www.google.com/fonts/">Google web fonts free library</a></div>
                                    </label>
                                    <div class="col-sm-6">
                                        <select class="form-control width_auto" id="bioproduct_colors_price_font" name="bioproduct_colors[price_font]" data-active="<?php echo $bioproduct_colors['price_font']; ?>">
                                            <option value="-">Select</option>
                                            <option value="Oswald">Oswald</option>
                                            <option value="Aclonica">Aclonica</option>
                                            <option value="Allan">Allan</option>
                                            <option value="Allerta">Allerta</option>
                                            <option value="Amaranth">Amaranth</option>
                                            <option value="Anton">Anton</option>
                                            <option value="Arimo">Arimo</option>
                                            <option value="Artifika">Artifika</option>
                                            <option value="Arvo">Arvo</option>
                                            <option value="Asset">Asset</option>
                                            <option value="Astloch">Astloch</option>
                                            <option value="Bangers">Bangers</option>
                                            <option value="Bentham">Bentham</option>
                                            <option value="Bevan">Bevan</option>
                                            <option value="Cabin">Cabin</option>
                                            <option value="Calligraffitti">Calligraffitti</option>
                                            <option value="Candal">Candal</option>
                                            <option value="Cantarell">Cantarell</option>
                                            <option value="Cardo">Cardo</option>
                                            <option value="Coda">Coda</option>
                                            <option value="Crushed">Crushed</option>
                                            <option value="Cuprum">Cuprum</option>
                                            <option value="Damion">Damion</option>
                                            <option value="Forum">Forum</option>
                                            <option value="Geo">Geo</option>
                                            <option value="Gruppo">Gruppo</option>
                                            <option value="Inconsolata">Inconsolata</option>
                                            <option value="Judson">Judson</option>
                                            <option value="Jura">Jura</option>
                                            <option value="Kameron">Kameron</option>
                                            <option value="Kenia">Kenia</option>
                                            <option value="Kranky">Kranky</option>
                                            <option value="Kreon">Kreon</option>
                                            <option value="Kristi">Kristi</option>
                                            <option value="Lekton">Lekton</option>
                                            <option value="Limelight">Limelight</option>
                                            <option value="Lobster">Lobster</option>
                                            <option value="Lora">Lora</option>
                                            <option value="Mako">Mako</option>
                                            <option value="MedievalSharp">MedievalSharp</option>
                                            <option value="Megrim">Megrim</option>
                                            <option value="Merriweather">Merriweather</option>
                                            <option value="Metrophobic">Metrophobic</option>
                                            <option value="Michroma">Michroma</option>
                                            <option value="Monofett">Monofett</option>
                                            <option value="Neucha">Neucha</option>
                                            <option value="Neuton">Neuton</option>
                                            <option value="Orbitron">Orbitron</option>
                                            <option value="Pacifico">Pacifico</option>
                                            <option value="Philosopher">Philosopher</option>
                                            <option value="Play">Play</option>
                                            <option value="Puritan">Puritan</option>
                                            <option value="Quattrocento">Quattrocento</option>
                                            <option value="Radley">Radley</option>
                                            <option value="Rokkitt">Rokkitt</option>
                                            <option value="Schoolbell">Schoolbell</option>
                                            <option value="Slackey">Slackey</option>
                                            <option value="Smythe">Smythe</option>
                                            <option value="Sunshiney">Sunshiney</option>
                                            <option value="Syncopate">Syncopate</option>
                                            <option value="Tangerine">Tangerine</option>
                                            <option value="Ubuntu">Ubuntu</option>
                                            <option value="Ultra">Ultra</option>
                                            <option value="Varela">Varela</option>
                                            <option value="Vibur">Vibur</option>
                                            <option value="Wallpoet">Wallpoet</option>
                                            <option value="Zeyada">Zeyada</option>
                                        </select>
                                        <span id="bioproduct_colors_price_font_preview" style="font-size:30px;line-height: 30px; display:block;padding:8px 0 0 0">Lorem Ipsum Dolor</span>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-6 control-label" for="price_regular">
                                        <span data-toggle="tooltip" title="Set color for a regular price display.">
                                            Regular price Color:
                                        </span>
                                    </label>
                                    <div class="col-sm-6">
                                        <input class="form-control width_auto" id="bioproduct_colors_price_regular" style="background-color:<?php echo $bioproduct_colors['price_regular']; ?>;color:white" type="text" name="bioproduct_colors[price_regular]" value="<?php echo $bioproduct_colors['price_regular']; ?>" placeholder="Regular price Color:" id="price_regular" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-6 control-label" for="price_new">
                                        <span data-toggle="tooltip" title="Set color for a new price display.">
                                            New special price color:
                                        </span>
                                    </label>
                                    <div class="col-sm-6">
                                        <input class="form-control width_auto" id="bioproduct_colors_price_new" style="background-color:<?php echo $bioproduct_colors['price_new']; ?>;color:white" type="text" name="bioproduct_colors[price_new]" value="<?php echo $bioproduct_colors['price_new']; ?>" placeholder="New special price color:" id="price_new" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-6 control-label" for="price_old">
                                        <span data-toggle="tooltip" title="Set color for an old price display.">
                                            Old price color:
                                        </span>
                                    </label>
                                    <div class="col-sm-6">
                                        <input class="form-control width_auto" id="bioproduct_colors_price_old" style="background-color:<?php echo $bioproduct_colors['price_old']; ?>;color:white" type="text" name="bioproduct_colors[price_old]" value="<?php echo $bioproduct_colors['price_old']; ?>" placeholder="Old price color:" id="price_old" />
                                    </div>
                                </div>
                            </div>
                            <!--subtabs: price-->


                        </div>


                        </div>
                        <!-------------------------------------end tab Colors,backgrounds,fonts-->

                        <!-------------------------------------tab Products sliders, products listings-->
                        <div class="tab-pane" id="tab-products">

                            <ul class="nav nav-tabs col-sm-3 main_tabs_vertical">
                                <li class="active"><a href="#tab-products-layout1" class="selected" data-toggle="tab">Products, listings</a></li>
                                <li><a href="#tab-products-layout2" data-toggle="tab">Product labels</a></li>
                            </ul>
                            <div class="tab-content col-sm-8">
                                <!--subtabs: General -->
                                <div class="tab-pane active" id="tab-products-layout1">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-slider_mode">
                                            <span data-toggle="tooltip" title="Choose view of sliders on main page: isotope or simple.">
                                                 Mode of sliders on main page:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[slider_mode]" id="input-slider_mode" class="form-control">
                                                <option <?php if ($bioproduct_products['slider_mode'] == 'tabs') : ?> selected="selected" <?php endif; ?> value="tabs">Tabbed sliders</option>
                                                <option <?php if ($bioproduct_products['slider_mode'] == 'simple') : ?> selected="selected" <?php endif; ?> value="simple">Simple slides</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-product_listing">
                                            <span data-toggle="tooltip" title="Choose products listing mode for 'Grid' view.">
                                                 Product listing mode:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[product_listing]" id="input-product_listing" class="form-control">
                                                <option <?php if ($bioproduct_products['product_listing'] == 'usual') : ?> selected="selected" <?php endif; ?> value="usual">Usual (description, price)</option>
                                                <option <?php if ($bioproduct_products['product_listing'] == 'simple') : ?> selected="selected" <?php endif; ?> value="simple">Simple (image only)</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-rollover_effect">
                                            <span data-toggle="tooltip" title="Rollover effect for images in listings, sliders.">
                                                 Rollover effect:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[rollover_effect]" id="input-rollover_effect" class="form-control">
                                                <option <?php if ($bioproduct_products['rollover_effect'] == 'advanced') : ?> selected="selected" <?php endif; ?> value="advanced">Advanced (with small images)</option>
                                                <option <?php if ($bioproduct_products['rollover_effect'] == 'simple') : ?> selected="selected" <?php endif; ?> value="simple">Simple rollover</option>
                                                <option <?php if ($bioproduct_products['rollover_effect'] == 'none') : ?> selected="selected" <?php endif; ?> value="none">No rollover</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-product_catalog_mode">
                                            <span data-toggle="tooltip" title="Create your listings into simple catalog.">
                                                 Catalog mode:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[product_catalog_mode]" id="input-product_catalog_mode" class="form-control">
                                                <option <?php if ($bioproduct_products['product_catalog_mode'] == 'disable') : ?> selected="selected" <?php endif; ?> value="disable">Disable catalog mode</option>
                                                <option <?php if ($bioproduct_products['product_catalog_mode'] == 'enable') : ?> selected="selected" <?php endif; ?> value="enable">Enable catalog mode</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-product_zoom_mode">
                                            <span data-toggle="tooltip" title="Choose zooming image mode on product page.">
                                                 Zooming image mode on product page:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[product_zoom_mode]" id="input-product_zoom_mode" class="form-control">
                                                <option <?php if ($bioproduct_products['product_zoom_mode'] == 'cloudzoom') : ?> selected="selected" <?php endif; ?> value="cloudzoom">Cloudzoom</option>
                                                <option <?php if ($bioproduct_products['product_zoom_mode'] == 'fancybox') : ?> selected="selected" <?php endif; ?> value="fancybox">Lightbox</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-tabblock_title<?php echo $language['language_id']; ?>">
                                            <span data-toggle="tooltip" title="Set custom tabbed product block title.">
                                                Title for tab "Tags":
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <ul class="nav nav-tabs" id="language-tabblock_title">
                                                <?php foreach ($languages as $language) : ?>
                                                <li class="<?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>"><a href="#language-tabblock_title<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) : ?>
                                                <div class="tab-pane <?php echo ($language['language_id'] == 1 ? 'active' : ''); ?>" id="language-tabblock_title<?php echo $language['language_id']; ?>">
                                                    <input type="text" name="bioproduct_products[<?php echo $language['language_id']; ?>][tabblock_title]" value="<?php echo isset($bioproduct_products[$language['language_id']]) ? $bioproduct_products[$language['language_id']]['tabblock_title'] : ''; ?>" placeholder="Custom tabbed block - title:" id="input-tabblock_title<?php echo $language['language_id']; ?>" class="form-control" />
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-category_description">
                                            <span data-toggle="tooltip" title="Choose display or not category description on category page.">
                                                 Category description on category page:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[category_description]" id="input-category_description" class="form-control">
                                                <option <?php if ($bioproduct_products['category_description'] == '1') : ?> selected="selected" <?php endif; ?> value="1">Enable</option>
                                                <option <?php if ($bioproduct_products['category_description'] == '0') : ?> selected="selected" <?php endif; ?> value="0">Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!--subtabs: labels -->
                                <div id="tab-products-layout2" class="tab-pane">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Show "Sale" label:</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_products["sale_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[sale_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[sale_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_products["sale_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[sale_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[sale_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-sale_position">"Sale" label position:</label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[sale_position]" id="input-sale_position" class="form-control width_auto">
                                                <option <?php if ($bioproduct_products['sale_position'] == 'top_left') : ?> selected="selected" <?php endif; ?> value="top_left">Top Left</option>
                                                <option <?php if ($bioproduct_products['sale_position'] == 'top_right') : ?> selected="selected" <?php endif; ?> value="top_right">Top Right</option>
                                                <option <?php if ($bioproduct_products['sale_position'] == 'bottom_left') : ?> selected="selected" <?php endif; ?> value="bottom_left">Bottom Left</option>
                                                <option <?php if ($bioproduct_products['sale_position'] == 'bottom_right') : ?> selected="selected" <?php endif; ?> value="bottom_right">Bottom Right</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-sale_label_bg">
                                            <span data-toggle="tooltip" title="Set background color of 'Sale' label.">
                                                Color of "Sale" label:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input class="form-control width_auto" id="bioproduct_products_sale_label_bg" style="background-color:<?php echo $bioproduct_products['sale_label_bg']; ?>;color:white" type="text" name="bioproduct_products[sale_label_bg]" value="<?php echo $bioproduct_products['sale_label_bg']; ?>" placeholder="Color of 'Sale' label:" id="input-sale_label_bg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Show "New" label:</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_products["new_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[new_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[new_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_products["new_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[new_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[new_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-new_position">"New" label position:</label>
                                        <div class="col-sm-8">
                                            <select name="bioproduct_products[new_position]" id="input-new_position" class="form-control width_auto">
                                                <option <?php if ($bioproduct_products['new_position'] == 'top_left') : ?> selected="selected" <?php endif; ?> value="top_left">Top Left</option>
                                                <option <?php if ($bioproduct_products['new_position'] == 'top_right') : ?> selected="selected" <?php endif; ?> value="top_right">Top Right</option>
                                                <option <?php if ($bioproduct_products['new_position'] == 'bottom_left') : ?> selected="selected" <?php endif; ?> value="bottom_left">Bottom Left</option>
                                                <option <?php if ($bioproduct_products['new_position'] == 'bottom_right') : ?> selected="selected" <?php endif; ?> value="bottom_right">Bottom Right</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-days">
                                            <span data-toggle="tooltip" title="Number of days from the date "Date Available" to today date for a product.">
                                                Period of holding "New" label:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" name="bioproduct_products[days]" value="<?php echo $bioproduct_products['days']; ?>" placeholder="Period of holding 'New' label:" id="input-days" class="form-control width_auto" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-new_label_bg">
                                            <span data-toggle="tooltip" title="Set background color of 'New' label.">
                                                Color of "New" label:
                                            </span>
                                        </label>
                                        <div class="col-sm-8">
                                            <input class="form-control width_auto" id="bioproduct_products_new_label_bg" style="background-color:<?php echo $bioproduct_products['new_label_bg']; ?>;color:white" type="text" name="bioproduct_products[new_label_bg]" value="<?php echo $bioproduct_products['new_label_bg']; ?>" placeholder="Color of 'New' label:" id="input-new_label_bg" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Set display or not 'QUICK VIEW' function on products in sliders.">Show "QUICK VIEW" function:</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_products["quick_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[quick_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[quick_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_products["quick_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[quick_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[quick_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Set display or not 'Discount' label.">Show "Discount" label:</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_products["discount_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[discount_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[discount_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_products["discount_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[discount_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[discount_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">
                                            <span data-toggle="tooltip" title="Set display or not countdown of Special Offer in product sliders.">Show countdown of Special Offer:</span>
                                        </label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <?php if ($bioproduct_products["countdown_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[countdown_status]" value="1" checked="checked" />
                                                <?php echo $text_yes; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[countdown_status]" value="1" />
                                                <?php echo $text_yes; ?>
                                                <?php } ?>
                                            </label>
                                            <label class="radio-inline">
                                                <?php if (!$bioproduct_products["countdown_status"]) { ?>
                                                <input type="radio" name="bioproduct_products[countdown_status]" value="0" checked="checked" />
                                                <?php echo $text_no; ?>
                                                <?php } else { ?>
                                                <input type="radio" name="bioproduct_products[countdown_status]" value="0" />
                                                <?php echo $text_no; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!------------------------------------end tab Products sliders, products listings-->

                        <!-------------------------------------tab flexslider-->
                        <div class="tab-pane" id="tab-flexslider">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">
                                    <span data-toggle="tooltip" title="Enable/disable previous/next navigation">Prev/next buttons</span>
                                </label>
                                <div class="col-sm-8">
                                    <label class="radio-inline">
                                        <?php if ($bioproduct_flexslider["flexslider_nav"]) { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_nav]" value="1" checked="checked" />
                                        <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_nav]" value="1" />
                                        <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$bioproduct_flexslider["flexslider_nav"]) { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_nav]" value="0" checked="checked" />
                                        <?php echo $text_no; ?>
                                        <?php } else { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_nav]" value="0" />
                                        <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">
                                    <span data-toggle="tooltip" title="Enable/disable navigation for paging control of each slide">Control navigation</span>
                                </label>
                                <div class="col-sm-8">
                                    <label class="radio-inline">
                                        <?php if ($bioproduct_flexslider["flexslider_control"]) { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_control]" value="1" checked="checked" />
                                        <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_control]" value="1" />
                                        <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$bioproduct_flexslider["flexslider_control"]) { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_control]" value="0" checked="checked" />
                                        <?php echo $text_no; ?>
                                        <?php } else { ?>
                                        <input type="radio" name="bioproduct_flexslider[flexslider_control]" value="0" />
                                        <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="input-flexslider_animation">
                                    <span data-toggle="tooltip" title="Select your animation type, 'fade' or 'slide'.">
                                    Animation type:
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <select name="bioproduct_flexslider[flexslider_animation]" id="input-flexslider_animation" class="form-control">
                                        <option <?php if ($bioproduct_flexslider['flexslider_animation'] == 'slide') : ?> selected="selected" <?php endif; ?> value="slide">Slide</option>
                                        <option <?php if ($bioproduct_flexslider['flexslider_animation'] == 'fade') : ?> selected="selected" <?php endif; ?> value="fade">Fade</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="input-flexslider_direction">
                                    <span data-toggle="tooltip" title="Select the sliding direction, 'horizontal' or 'vertical' (if you've selected before animation type - slide).">
                                    Direction type:
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <select name="bioproduct_flexslider[flexslider_direction]" id="input-flexslider_direction" class="form-control">
                                        <option <?php if ($bioproduct_flexslider['flexslider_direction'] == 'horizontal') : ?> selected="selected" <?php endif; ?> value="horizontal">Horizontal</option>
                                        <option <?php if ($bioproduct_flexslider['flexslider_direction'] == 'vertical') : ?> selected="selected" <?php endif; ?> value="vertical">Vertical</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="input-flexslider_slideshowspeed">
                                    <span data-toggle="tooltip" title="Set the speed of the slideshow cycling, in milliseconds.">
                                        Slideshow Speed:
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" name="bioproduct_flexslider[flexslider_slideshowspeed]" value="<?php echo $bioproduct_flexslider['flexslider_slideshowspeed']; ?>" placeholder="Slideshow Speed:" id="input-flexslider_slideshowspeed" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="input-flexslider_animationspeed">
                                    <span data-toggle="tooltip" title="Set the speed of animations, in milliseconds.">
                                        Animation Speed:
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" name="bioproduct_flexslider[flexslider_animationspeed]" value="<?php echo $bioproduct_flexslider['flexslider_animationspeed']; ?>" placeholder="Animation Speed:" id="input-flexslider_animationspeed" class="form-control" />
                                </div>
                            </div>

                        </div>
                        <!-------------------------------------end tab flexslider-->



                    </div>
                    <input type="hidden" name="buttonForm" value="" />
                </form>

            </div>
        </div>

    </div>






</div>


<script type="text/javascript"><!--
jQuery(document).ready(function(){
    jQuery("#bioproduct_products_sale_label_bg").ColorPicker({
        color: jQuery('#bioproduct_products_sale_label_bg').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_products_sale_label_bg').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_products_sale_label_bg').val('#' + hex);
        }
    });
    jQuery("#bioproduct_products_new_label_bg").ColorPicker({
        color: jQuery('#bioproduct_products_new_label_bg').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_products_new_label_bg').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_products_new_label_bg').val('#' + hex);
        }
    });
    jQuery("#bioproduct_theme_general_themecolor").ColorPicker({
         color: jQuery('#bioproduct_theme_general_themecolor').val(),
         onShow: function (colpkr) {
         jQuery(colpkr).fadeIn(500);
         return false;
         },
         onHide: function (colpkr) {
         jQuery(colpkr).fadeOut(500);
         return false;
         },
         onChange: function (hsb, hex, rgb) {
         jQuery('#bioproduct_theme_general_themecolor').css('backgroundColor', '#' + hex);
         jQuery('#bioproduct_theme_general_themecolor').val('#' + hex);
         }
    });
    jQuery("#bioproduct_colors_general_themehover").ColorPicker({
        color: jQuery('#bioproduct_colors_general_themehover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_general_themehover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_general_themehover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_general_input").ColorPicker({
        color: jQuery('#bioproduct_colors_general_input').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_general_input').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_general_input').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_general_text").ColorPicker({
        color: jQuery('#bioproduct_colors_general_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_general_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_general_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_general_link").ColorPicker({
        color: jQuery('#bioproduct_colors_general_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_general_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_general_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_general_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_general_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_general_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_general_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_general_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_general_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_general_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_general_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_captions_text").ColorPicker({
        color: jQuery('#bioproduct_colors_captions_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_captions_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_captions_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_topline_text").ColorPicker({
        color: jQuery('#bioproduct_colors_topline_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_topline_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_topline_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_topline_link").ColorPicker({
        color: jQuery('#bioproduct_colors_topline_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_topline_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_topline_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_topline_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_topline_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_topline_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_topline_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_topline_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_topline_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_topline_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_topline_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_topline_phonecolor").ColorPicker({
        color: jQuery('#bioproduct_colors_topline_phonecolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_topline_phonecolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_topline_phonecolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_dd_ink").ColorPicker({
        color: jQuery('#bioproduct_colors_dd_ink').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_dd_ink').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_dd_ink').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_dd_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_dd_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_dd_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_dd_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_dd_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_dd_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_dd_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_dd_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_dd_border").ColorPicker({
        color: jQuery('#bioproduct_colors_dd_border').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_dd_border').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_dd_border').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_headernav_text").ColorPicker({
        color: jQuery('#bioproduct_colors_headernav_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_headernav_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_headernav_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_headernav_link").ColorPicker({
        color: jQuery('#bioproduct_colors_headernav_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_headernav_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_headernav_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_headernav_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_headernav_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_headernav_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_headernav_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_header_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_header_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_header_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_header_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_headernav_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_headernav_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_headernav_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_headernav_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_content_text").ColorPicker({
        color: jQuery('#bioproduct_colors_content_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_content_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_content_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_content_link").ColorPicker({
        color: jQuery('#bioproduct_colors_content_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_content_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_content_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_content_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_content_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_content_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_content_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_content_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_content_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_content_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_content_bgcolor').val('#' + hex);
        }
    });


    jQuery("#bioproduct_colors_footerinfo_text").ColorPicker({
        color: jQuery('#bioproduct_colors_footerinfo_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerinfo_link").ColorPicker({
        color: jQuery('#bioproduct_colors_footerinfo_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerinfo_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_footerinfo_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerinfo_captions").ColorPicker({
        color: jQuery('#bioproduct_colors_footerinfo_captions').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_captions').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_captions').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerinfo_bold").ColorPicker({
        color: jQuery('#bioproduct_colors_footerinfo_bold').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_bold').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_bold').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerinfo_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_footerinfo_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerinfo_linecolor").ColorPicker({
        color: jQuery('#bioproduct_colors_content_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerinfo_linecolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerinfo_linecolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footer_text").ColorPicker({
        color: jQuery('#bioproduct_colors_footer_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footer_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footer_text').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footer_link").ColorPicker({
        color: jQuery('#bioproduct_colors_footer_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footer_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footer_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footer_link_hover").ColorPicker({
        color: jQuery('#bioproduct_colors_footer_link_hover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footer_link_hover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footer_link_hover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footer_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_footer_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footer_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footer_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerpopup_text").ColorPicker({
        color: jQuery('#bioproduct_colors_footerpopup_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerpopup_text').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerpopup_text').val('#' + hex);
        }
    });


    jQuery("#bioproduct_colors_footerpopup_captions").ColorPicker({
        color: jQuery('#bioproduct_colors_footerpopup_captions').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerpopup_captions').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerpopup_captions').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerpopup_link").ColorPicker({
        color: jQuery('#bioproduct_colors_footerpopup_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerpopup_link').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerpopup_link').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerpopup_linkhover").ColorPicker({
        color: jQuery('#bioproduct_colors_footerpopup_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerpopup_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerpopup_linkhover').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_footerpopup_bgcolor").ColorPicker({
        color: jQuery('#bioproduct_colors_footerpopup_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_footerpopup_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_footerpopup_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_price_regular").ColorPicker({
        color: jQuery('#bioproduct_colors_price_regular').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_price_regular').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_price_regular').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_price_new").ColorPicker({
        color: jQuery('#bioproduct_colors_price_new').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_price_new').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_price_new').val('#' + hex);
        }
    });
    jQuery("#bioproduct_colors_price_old").ColorPicker({
        color: jQuery('#bioproduct_colors_price_old').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_price_old').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_price_old').val('#' + hex);
        }
    });

    jQuery(function(){
        fontSelect=jQuery("#bioproduct_colors_price_font");
        fontUpdate=function(){
            curFont=jQuery("#bioproduct_colors_price_font").val();
            jQuery("#bioproduct_colors_price_font_preview").css({ fontFamily: curFont });
            if (curFont != '-') {
                jQuery("<link />",{href:"//fonts.googleapis.com/css?family="+curFont,rel:"stylesheet",type:"text/css"}).appendTo("head");
            }
        }
        fontSelect.change(function(){
            fontUpdate();
        }).keyup(function(){
                    fontUpdate();
                }).keydown(function(){
                    fontUpdate();
                });
        jQuery("#bioproduct_colors_price_font").trigger("change");
        fontUpdate();
    });

    jQuery("#bioproduct_colors_captions_font").val(jQuery("#bioproduct_colors_captions_font").data("active")).attr('selected', true);
    jQuery("#bioproduct_colors_price_font").val(jQuery("#bioproduct_colors_price_font").data("active")).attr('selected', true);

    jQuery(function(){
        fontSelect=jQuery("#bioproduct_colors_captions_font");
        fontUpdate_captions=function(){
            curFont=jQuery("#bioproduct_colors_captions_font").val();
            jQuery("#bioproduct_colors_captions_font_preview").css({ fontFamily: curFont });
            if (curFont != '-') {
                jQuery("<link />",{href:"//fonts.googleapis.com/css?family="+curFont,rel:"stylesheet",type:"text/css"}).appendTo("head");
            }

        }
        fontSelect.change(function(){
            fontUpdate_captions();
        }).keyup(function(){
                    fontUpdate_captions();
                }).keydown(function(){
                    fontUpdate_captions();
                });
        jQuery("#bioproduct_colors_captions_font").trigger("change");
        fontUpdate_captions();
    });

    jQuery("#bioproduct_colors_product_border").ColorPicker({
        color: jQuery('#bioproduct_colors_product_border').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bioproduct_colors_product_border').css('backgroundColor', '#' + hex);
            jQuery('#bioproduct_colors_product_border').val('#' + hex);
        }
    });


});
function buttonApply() {document.settingsform.buttonForm.value='apply';$('#form-buyshop').submit();}

<?php foreach ($languages as $language) : ?>
    $('#input-description-contactpopup<?php echo $language['language_id']; ?>').summernote({height: 300});
    $('#input-description-customblock<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php endforeach; ?>
//--></script>

<?php echo $footer; ?>