
<div class="carousel8 es-carousel-wrapper8 style0">
    <div class="es-carousel8">
        <div class="row">
        <div class="product_outer8 carousel_items8">

<?php
global $config, $loader, $registry;
$loader->model('catalog/product');
$model = $registry->get('model_catalog_product');

$theme_options = $config->get('bioproduct_general');
$image_rotate = 1;
if (!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) {
    $product_block_width = 2;
} else {
    $product_block_width = 3;
}

    if (!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) {
        $columns_count = 6;
    } else {
        $columns_count = 4;
    }


$col_count = 1;
if (!isset($theme_products["product_catalog_mode"]))  {$theme_products["product_catalog_mode"] == 'enable';}

foreach ($products as $k => $product) {
    /* --------------output for NEW label---------------- */
    $product_output = $model->getProduct($product['product_id']);

    $date_available = $product_output["date_available"];

    if (isset($new) && $new !== 'disable') {

        $day_number_to_range = date( "Y-m-d" ,  strtotime("-$days day")  );

        if ($date_available >= $day_number_to_range) {
            $sticker_new = '<span class="label_new label_new_'.($newposition !== '' ?  $newposition : 'top_left').'">NEW</span>';
        } else {
            $sticker_new = '';
        }
    } else {
        $sticker_new = '';
    }
    /* --------------end output for NEW label---------------- */


    /* --------------output for SALE label---------------- */
    if (isset($sale) &&  $sale !== 'disable') {
        if ($product['special']) {
            $sticker_sale = '<span class="label_sale label_sale_'.($saleposition !== '' ?  $saleposition : 'top_right').'">SALE</span>';
        } else {
            $sticker_sale = '';
        }
    } else {
        $sticker_sale = '';
    }
    /* --------------end output for SALE label---------------- */
    $results_images = $model->getProductImages($product['product_id']);

    if ($results_images) {

        $first = true;
        foreach ($results_images as $results_image) {
            if ( $first ) {
                    $loader->model('tool/image');
                    $model_image = $registry->get('model_tool_image');
                    $popup = $model_image->resize($results_image['image'], $config->get('config_image_product_width'), $config->get('config_image_product_height'));
                    $popup2x = $model_image->resize($results_image['image'], $config->get('config_image_product_width')*2, $config->get('config_image_product_height')*2);
                $first = false;
            }
        }
    } else {
        $popup = false;
        $popup2x = false;

    }

    $name_short = strlen($product['name']) > 50 ? utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 50) . '..' : $product['name'];

    $main = $model_image->resize($product_output['image'], $config->get('config_image_product_width'), $config->get('config_image_product_height'));
    $main2x = $model_image->resize($product_output['image'], $config->get('config_image_product_width')*2, $config->get('config_image_product_height')*2);

    ?>

    <div class="span<?php echo $product_block_width; ?> product <?php echo ((!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) ? 'small' : 'big'); ?> carousel_item count_<?php echo $col_count; ?>">
<?php if (isset($theme_options["layout_skin"])) : ?>
<?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            <div class="border_product">
<?php endif; ?>
<?php endif; ?>
        <!-- LABELS -->
        <?php echo $sticker_sale.$sticker_new; ?>
        <?php
        if ($theme_products["product_catalog_mode"] !== 'enable' ) :
            if ($product['special']) {
                if (isset($theme_products["discount_status"])&& $theme_products["discount_status"] !== 'disable' && $product['price']) {
                    $discount = round(((preg_replace('/[^\d.]/','',$product['price']) - preg_replace('/[^\d.]/','',$product['special']))/preg_replace('/[^\d.]/','',$product['price']))*100, 0);
                    echo '<div class="sale_discount img-rounded">-'.$discount.'%</div>';
                }
            }
        endif;
        ?>
        <!-- //LABELS -->
        <div class="product-image-wrapper onhover animate scale">
            <a href="<?php echo $product['href']; ?>">
                    <?php if ($product['thumb']) { ?>
                        <img class="product-retina" data-image2x="<?php echo $main2x; ?>" src="<?php echo $main; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    <?php } else { ?>
                        <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    <?php } ?>
                </a>
        </div>

        <?php
        if (empty($theme_products["product_listing"]) || $theme_products["product_listing"] !== 'simple' ){
        ?>
                <div class="wrapper-hover">
                    <div class="product-name">
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </div>

                    <?php if ($theme_products["product_catalog_mode"] !== 'enable' ) : ?>
                    <div class="wrapper">
                        <div class="product-tocart">
                            <a onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="icon-basket"></i></a>
                        </div>

                        <?php if ($product['price']) { ?>
                             <div class="product-price">
                                    <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                        <div class="product-price-regular">
                                            <span class="new"><?php echo $product['special']; ?></span>
                                            <span class="old"><?php echo $product['price']; ?></span>
                                        </div>
                                 <?php } ?>
                             </div>
                         <?php } ?>

                    </div>
                    <?php endif;    ?>


                </div>
        <?php

            }
        ?>


    <?php if (isset($theme_options["layout_skin"])) : ?>
        <?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            </div>
<?php endif; ?>
    <?php endif; ?>


</div>

<!--previews-->

    <div class="preview <?php echo ((!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) ? 'small' : 'big'); ?> hidden-tablet hidden-phone">
        <?php if (!isset($theme_products["rollover_effect"]) || $theme_products["rollover_effect"] !== 'none') : ?>
        <?php if (isset($theme_options["layout_skin"])) : ?>
            <?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            <div class="border_preview">
<?php endif; ?>
            <?php endif; ?>

        <div class="wrapper">
                 <?php
                 echo $sticker_sale.$sticker_new;
                 if ($theme_products["product_catalog_mode"] !== 'enable' ) :
                     if ($product['special']) {
                         if (isset($theme_products["discount_status"])&& $theme_products["discount_status"] !== 'disable' && $product['price']) {
                             echo '<div class="sale_discount img-rounded">-'.$discount.'%</div>';
                         }
                     }
                 endif;
                 ?>
            <!--small images-->
    <?php if (!isset($theme_products["rollover_effect"]) || $theme_products["rollover_effect"] == 'advanced') : ?>
        <?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] == 'skin_creative') : ?>
                <?php if ($results_images && count($results_images) > 1) : ?>
                <div class="col-1">
                    <?php $quantity = 0;
                        foreach($results_images as $additional_image){
                        $quantity ++;
                        if ($quantity < 4){
                                $small_img_rel = $model_image->resize($additional_image['image'], $config->get('config_image_product_width'), $config->get('config_image_product_height'));
                                $small_img = $model_image->resize($additional_image['image'], 71, 65);
                                $small_img2x = $model_image->resize($additional_image['image'], 142, 130);
                            ?>
                            <a data-rel="<?php echo $small_img_rel; ?>" class="image">
                                <img class="product-retina thumb" data-image2x="<?php echo $small_img2x; ?>" src="<?php echo $small_img; ?>" alt="<?php echo $product['name']; ?>" />
                            </a>
                            <?php
                        }
                    }
                    ?>
                </div>
                <?php endif; ?>
            <?php endif; ?>
            <?php endif; ?>
            <!--end small images-->
            <div class="col-2">
                     <div class="big_image">
                         <a href="<?php echo $product['href']; ?>">
                             <?php if ($popup) { ?>
                                <img class="product-retina" data-image2x="<?php echo $popup2x; ?>" src="<?php echo $popup; ?>" alt="<?php echo $product['name']; ?>" />
                             <?php
                                } else { ?>
                                     <img class="product-retina" data-image2x="<?php echo $popup2x; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                             <?php } ?>
                         </a>
                     </div>
                        <div class="wrapper-hover">
                         <div class="product-name">
                             <a href="<?php echo $product['href']; ?>"><?php echo $name_short; ?></a>
                         </div>
                        <?php if (empty($theme_products["product_catalog_mode"]) || $theme_products["product_catalog_mode"] !== 'enable' ) :  ?>
                            <div class="wrapper">
                                <div class="product-tocart">
                                    <a><i onclick="cart.add('<?php echo $product['product_id']; ?>');" class="icon-basket"></i></a>
                                </div>
                                <div class="product-price">
                                    <?php if ($product['price']) { ?>
                                    <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                        <?php } else { ?>
                                        <div class="product-price-regular">
                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                            <span class="old"><?php echo $product['price']; ?></span>
                                        </div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>

                            </div>

                            <div class="product-link">
                                <div class="wishlist_link">
                                    <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="icon-plus"></i><?php echo $button_wishlist; ?></a>
                                </div>
                                <div class="compare_link">
                                    <a onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="icon-chart-bar"></i><?php echo $button_compare; ?></a>
                                </div>
                            </div>
                        <?php endif; ?>


                        <?php if (($product['rating'])) { ?>
                         <div class="rating">
                             <?php
                             if ($product['rating'] > 0) {
                                 echo '<strong>';
                                 for ($i = 1; $i <= $product['rating']; $i++) {
                                     echo '<a><i class="icon-star"></i></a>';
                                 }
                                 echo '</strong>';
                                 $k =  5 - $product['rating'];
                                 for ($j = 1; $j <= $k; $j ++) {
                                     echo '<a><i class="icon-star"></i></a>';
                                 }
                             } else {
                                 for ($i = 1; $i <= 5; $i++) {
                                     echo '<a><i class="icon-star"></i></a>';
                                 }
                             }
                             ?>

                         </div>
                         <?php } ?>


                     </div>


                 </div>




             </div>
<?php if (isset($theme_options["layout_skin"])) : ?>
<?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            </div>
<?php endif; ?>
<?php endif; ?>
        <?php endif; ?>

    </div>


<!--end previews-->

<?php } ?>
        </div>

        </div>
    </div>
</div>
