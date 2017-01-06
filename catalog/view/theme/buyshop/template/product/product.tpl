<?php
global $config, $loader, $registry;

$theme_products = $config->get('bioproduct_products');

$loader->model('custom/general');
$model_product = $registry->get('model_custom_general');

$youtube = $model_product->getProductCustom($product_id, 'youtube');
$custom_title = $model_product->getProductCustom($product_id, 'custom_title');
$description_custom = $model_product->getProductCustom($product_id, 'custom_description');



/* output for labels */
if (isset($theme_products["sale_status"])) {$sale = $theme_products["sale_status"];}  else {$sale = '';}
if (isset($theme_products["new_status"])) {$new = $theme_products["new_status"];}  else {$new = '';}

if (isset($theme_products["sale_position"])) {$saleposition = $theme_products["sale_position"];}  else {$saleposition = '';}
if (isset($theme_products["new_position"])) {$newposition = $theme_products["new_position"];}  else {$newposition = '';}

if (isset($theme_products["newlabel_period"])) {
$days = $theme_products["newlabel_period"];
} else {
$days = 10;
}
/* end output for labels */

$lang = $config->get('config_language_id');


if ($lang == 'ar'&& $theme_products["cloudzoom_mode"] == 'right') {
    $theme_products["cloudzoom_mode"] = 'left';
}



if (!isset($theme_products["rollover_effect"])) {
    $image_rotate = 1;
}  else {
    $image_rotate = $theme_products["rollover_effect"];
}

?>


<?php echo $header; ?>

<!--BREADCRUMBS BOX-->
    <div class="wrapper_w">
        <ul class="breadcrumb breadcrumb-product-page">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
                    <span class="breadcrumb_title" itemprop="title"><?php echo $breadcrumb['text']; ?></span>
                </a>
            </li>
            <?php } ?>
        </ul>
    </div>
<!--END BREADCRUMBS BOX-->

<?php echo $content_top; ?>

<div class="row">



    <div id="content8" class="product-box">
      <div class="row8">

      <?php echo $column_left; ?>

      <?php if ($thumb || $images || (isset($youtube) && $youtube != '')) : ?>
          <div class="<?php echo (($images || (isset($youtube) && $youtube != '')) ? 'span5' : 'span4'); ?>">
              <div class="product-img-box noselect">
                  <div class="<?php echo ($images || (isset($youtube) && $youtube != '') ? 'row' : 'row-no-add-images'); ?>">
                      <!--additional images-->
                      <?php if ($images  || (isset($youtube) && $youtube != '')) : ?>
                      <div class="span1">
                          <?php if ($images) { ?>
                          <div class="product-more-views">
                              <ul class="jcarousel jcarousel-skin-previews">
                                  <?php if ($theme_products["product_zoom_mode"] !== 'fancybox') : ?>
                                  <li>
                                      <?php if ($thumb) { ?>
                                      <img class="cloudzoom-gallery" src="<?php echo $thumb; ?>" data-cloudzoom="useZoom: '#CloudZoom', image:'<?php echo $thumb; ?>', zoomImage: '<?php echo $popup; ?>' " title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                      <?php } ?>
                                  </li>
                                  <?php endif; ?>
                                  <?php foreach ($images as $image) { ?>
                                  <li>
                                      <?php if ($theme_products["product_zoom_mode"] !== 'fancybox') { ?>
                                      <img class="cloudzoom-gallery" src="<?php echo $image['thumb']; ?>" data-cloudzoom = "useZoom: '#CloudZoom', image: '<?php echo $image['thumb']; ?>', zoomImage: '<?php echo $image['popup']; ?>' " title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                      <?php } else { ?>
                                      <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="fancybox" rel="group">
                                          <img class="cloudzoom-gallery" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                      </a>
                                      <?php } ?>

                                  </li>
                                  <?php } ?>

                                  <!--youtube video-->
                                  <?php if (isset($youtube) && $youtube != '') : ?>
                                  <li>
                                      <a class="video various fancybox.iframe" href="<?php echo $youtube; ?>"><i class="icon-link"></i></a>
                                  </li>
                                  <?php endif; ?>
                                  <!--youtube video-->

                              </ul>
                          </div>
                          <?php } else { ?>
                          <div class="jcarousel-item">
                              <div class="youtube_empty">
                                  <a class="video various fancybox.iframe" href="<?php echo $youtube; ?>"><i class="icon-link"></i></a>
                              </div>
                          </div>
                          <?php } ?>
                      </div>
                      <?php endif; ?>
                      <!-- end additional images-->

                      <?php if ($thumb) { ?>
                      <div class="<?php echo ($images || (isset($youtube) && $youtube != '') ? 'span4' : 'no-add-images'); ?>">
                          <div class="product-image">
                              <?php if ($theme_products["product_zoom_mode"] !== 'fancybox') { ?>
                                <img class = "cloudzoom" id="CloudZoom" itemprop="image" src="<?php echo $thumb; ?>" data-cloudzoom = "zoomImage: '<?php echo $popup; ?>'" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                              <?php } else { ?>
                                  <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="universal fancybox" rel="group">
                                      <img class="cloudzoom" itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                                  </a>
                              <?php } ?>
                          </div>
                          </div>
                          <?php }  ?>
              </div>
            </div>
          </div>
      <?php endif; ?>

      <!--right block-->
      <?php if ($images || (isset($youtube) && $youtube != '')) { ?>
          <?php if ($column_left) { ?>
            <?php $class_product = 'span5'; ?>
          <?php } else { ?>
            <?php $class_product = 'span7'; ?>
          <?php }  ?>
      <?php } else { ?>
        <?php $class_product = 'span8'; ?>
      <?php } ?>

      <div class="<?php echo $class_product; ?>">
          <div class="product-info product-shop">
              <!--custom block-->
              <div class="product_custom">
                  <?php echo $column_right; ?>
              </div>
              <!--end custom block-->
              <div class="product_info_left">

              <div>
              <h1><?php echo $heading_title; ?></h1>
              <ul class="list-unstyled">
                  <?php if ($manufacturer) { ?>
                  <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                  <?php } ?>
                  <li><?php echo $text_model; ?> <?php echo $model; ?></li>
                  <?php if ($reward) { ?>
                  <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
                  <?php } ?>
                  <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
              </ul>
              <?php if (!isset($theme_products["product_catalog_mode"]) || $theme_products["product_catalog_mode"] != 'enable') : ?>
              <?php if ($price) { ?>
              <div itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer" class="price-box">
                  <?php if (!$special) { ?>
                  <span itemprop="price"><?php echo $price; ?></span>
                  <?php } else { ?>
                   <span class="old-price">
                                 <span class="price"><?php echo $price; ?></span>
                              </span>
                              <span class="special-price">
                                  <span itemprop="price" class="price"><?php echo $special; ?></span>
                              </span>
                  <?php } ?>
                  <?php if ($tax) { ?>
                  <div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
                  <?php } ?>
                  <?php if ($points) { ?>
                  <div class="price_points"><?php echo $text_points; ?> <?php echo $points; ?></div>
                  <?php } ?>
                  <?php if ($discounts) { ?>
                  <div class="price_discounts">
                      <hr>
                      <?php foreach ($discounts as $discount) { ?>
                      <div>- <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></div>
                      <?php } ?>
                  </div>

                  <?php } ?>
              </div>
              <?php } ?>
              <?php endif; ?>
              <div id="product">
                  <?php if ($options) { ?>
                  <hr>
                  <h3><?php echo $text_option; ?></h3>
                  <?php foreach ($options as $option) { ?>
                  <?php if ($option['type'] == 'select') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                      <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                          <option value=""><?php echo $text_select; ?></option>
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                              <?php if ($option_value['price']) { ?>
                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                              <?php } ?>
                          </option>
                          <?php } ?>
                      </select>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'radio') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label"><?php echo $option['name']; ?></label>
                      <div id="input-option<?php echo $option['product_option_id']; ?>">
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <div class="radio">
                              <label>
                                  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                  <?php echo $option_value['name']; ?>
                                  <?php if ($option_value['price']) { ?>
                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                  <?php } ?>
                              </label>
                          </div>
                          <?php } ?>
                      </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'checkbox') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label"><?php echo $option['name']; ?></label>
                      <div id="input-option<?php echo $option['product_option_id']; ?>">
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <div class="checkbox">
                              <label>
                                  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                  <?php echo $option_value['name']; ?>
                                  <?php if ($option_value['price']) { ?>
                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                  <?php } ?>
                              </label>
                          </div>
                          <?php } ?>
                      </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'image') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label"><?php echo $option['name']; ?></label>
                      <div class="option-image" id="input-option<?php echo $option['product_option_id']; ?>">
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <div class="radio label_wrapper">
                              <label>
                                  <input class="label_image" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                  <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                  <span class="image_option_name"><?php echo $option_value['name']; ?></span>
                                  <?php if ($option_value['price']) { ?>
                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                  <?php } ?>
                              </label>
                          </div>
                          <?php } ?>
                      </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'text') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'textarea') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                      <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'file') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label"><?php echo $option['name']; ?></label>
                      <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="button btn-cart" style="width: 100%;">
                          <?php echo $button_upload; ?>
                      </button>
                      <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'date') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                      <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'datetime') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                      <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'time') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                      <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                      <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                  </div>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($recurrings) { ?>
                  <hr>
                  <h3><?php echo $text_payment_recurring ?></h3>
                  <div class="form-group required">
                      <select name="recurring_id" class="form-control">
                          <option value=""><?php echo $text_select; ?></option>
                          <?php foreach ($recurrings as $recurring) { ?>
                          <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                          <?php } ?>
                      </select>
                      <div class="help-block" id="recurring-description"></div>
                  </div>
                  <?php } ?>

                  <?php if (!isset($theme_products["product_catalog_mode"]) || $theme_products["product_catalog_mode"] != 'enable') : ?>
                  <div class="form-group cart add-to-cart">
                      <div class="qty">
                          <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                          <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                      </div>
                      <button type="button" id="button-cart" class="button btn-cart">
                          <i class="icon-cart"></i><?php echo $button_cart; ?>
                      </button>
                  </div>
                  <?php if ($minimum > 1) { ?>
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                  <?php } ?>
                  <?php endif; ?>
              </div>


              <div class="add-to-links">
                  <ul>
                      <li>
                          <a data-toggle="tooltip" class="small_icon_color" title="<?php echo $button_wishlist; ?>" onclick="wishlist_theme.add('<?php echo $product_id; ?>');">
                              <i class="icon-heart"></i>
                          </a>
                          <a data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist_theme.add('<?php echo $product_id; ?>');">
                              <?php echo $button_wishlist; ?>
                          </a>
                      </li>
                      <li>
                          <a data-toggle="tooltip" class="small_icon_color" title="<?php echo $button_compare; ?>" onclick="compare_theme.add('<?php echo $product_id; ?>');">
                              <i class="icon-popup"></i>
                          </a>
                          <a data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare_theme.add('<?php echo $product_id; ?>');">
                              <?php echo $button_compare; ?>
                          </a>
                      </li>
                  </ul>


              </div>

              <?php if ($review_status) { ?>
              <div class="rating">
                  <p>
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($rating < $i) { ?>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                      <?php } else { ?>
                      <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                      <?php } ?>
                      <?php } ?>
                      <span class="subs_wrapper">
                      <a class="rating_subs_first" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a>
                      <span class="rating_subs_first">/</span>
                      <a class="rating_subs_first" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                      </span>
                  </p>
                  <hr>

                  <!-- AddThis Button BEGIN -->
                  <div class="addthis_toolbox addthis_default_style">
                      <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                      <a class="addthis_button_tweet"></a>
                      <a class="addthis_button_pinterest_pinit"></a>
                      <a class="addthis_counter addthis_pill_style"></a>
                  </div>
                  <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                  <!-- AddThis Button END -->
              </div>
              <?php } ?>
              </div>

              </div>
          </div>
      </div>
      <!--right block-->





      </div>




    </div>

</div>

<!--bottom tabs-->
<div class="row tabs_wrapper">
    <div class="span12">
        <ul class="nav nav-tabs contentTab">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
            <?php if ($tags) { ?>
            <li><a href="#tab-tags" data-toggle="tab">
                    <?php
                      if (isset($theme_products[$lang]["tabblock_title"]) && $theme_products[$lang]["tabblock_title"] !== '') {
                      echo $theme_products[$lang]["tabblock_title"];
                      } else {echo 'Tags';}
                    ?>
                </a></li>
            <?php } ?>

            <?php if (isset($description_custom) && $description_custom !== '') : ?>
            <li>
                <a href="#tab-custom" data-toggle="tab">
                    <?php echo ($custom_title !== '' ? $custom_title : 'Custom block'); ?>
                </a>
            </li>
            <?php endif; ?>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
                <table class="table table-bordered">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <thead>
                    <tr>
                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <tr>
                        <td><?php echo $attribute['name']; ?></td>
                        <td><?php echo $attribute['text']; ?></td>
                    </tr>
                    <?php } ?>
                    </tbody>
                    <?php } ?>
                </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane fluid_boxes" id="tab-review">
                <form class="form-horizontal">
                    <div id="review"></div>
                    <h2><?php echo $text_write; ?></h2>
                    <?php if ($review_guest) { ?>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                            <input type="text" name="name" value="" id="input-name" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                            <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                            <div class="help-block"><?php echo $text_note; ?></div>
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label"><?php echo $entry_rating; ?></label>
                            &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                            <input type="radio" name="rating" value="1" />
                            &nbsp;
                            <input type="radio" name="rating" value="2" />
                            &nbsp;
                            <input type="radio" name="rating" value="3" />
                            &nbsp;
                            <input type="radio" name="rating" value="4" />
                            &nbsp;
                            <input type="radio" name="rating" value="5" />
                            &nbsp;<?php echo $entry_good; ?></div>
                    </div>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                            <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                    </div>
                    <div class="buttons">
                        <div class="pull-right">
                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                        </div>
                    </div>
                    <?php } else { ?>
                    <?php echo $text_login; ?>
                    <?php } ?>
                </form>
            </div>
            <?php } ?>
            <?php if ($tags) { ?>
            <div class="tab-pane" id="tab-tags">
                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                <?php } ?>
                <?php } ?>
            </div>
            <?php } ?>
            <?php if (isset($description_custom) && $description_custom !== '') : ?>
            <div class="tab-pane" id="tab-custom"><?php echo $description_custom; ?></div>
            <?php endif; ?>
        </div>

    </div>
</div>
<!--end bottom tabs-->

<?php echo $content_bottom; ?>


<?php if ($products) : ?>
<h3><?php echo $text_related; ?></h3>
<?php include('catalog/view/theme/related.php'); ?>
<?php endif; ?>




<!--fancybox-->
<?php if ($theme_products["product_zoom_mode"] == 'fancybox') : ?>
<script type="text/javascript"><!--
$(".fancybox").fancybox();
//--></script>
<?php endif; ?>

<script type="text/javascript">
    $(".various").fancybox({
        maxWidth	: 800,
        maxHeight	: 600,
        fitToView	: false,
        width		: '70%',
        height		: '70%',
        autoSize	: false,
        closeClick	: false,
        openEffect	: 'none',
        closeEffect	: 'none'
    });

</script>

<!--end fancybox-->

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                var str=json['total'];
                var myArray = str.split(' ');
                var new_str = myArray[0];

                $('#header #cart-total').html(new_str);
                $('#spy #cart-total').html(new_str);


                $('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script> 
<?php echo $footer; ?>