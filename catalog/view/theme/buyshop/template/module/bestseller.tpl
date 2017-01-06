<?php
global $config;
$theme_options = $config->get('bioproduct_general');
$theme_products = $config->get('bioproduct_products');

if (isset($theme_products["slider_mode"]) && $theme_products["slider_mode"] == 'simple'):

if (isset($theme_options["sidebar"]) && $theme_options["sidebar"] == 1) {
$class = 'span9';
} else {
$class = 'span12';
}

?>
<div class="<?php echo $class; ?> carousel_slider slider_bestseller">
        <h3 class="main_slider_title bestseller_title">
            <span class="pulse-button">!</span>
            <?php echo $heading_title; ?>
        </h3>
        <div class="carousel es-carousel-wrapper style0">
            <div class="es-carousel">
                <div class="row">
                    <div class="product_outer carousel_items">

<?php endif; ?>

                        <?php
                        if (!isset($theme_products["rollover_effect"]) || $theme_products["rollover_effect"] == 1) {
                        $image_rotate = 1;
                        }  else {
                        $image_rotate = $theme_products["rollover_effect"];
                        }

                        if (!isset($theme_products["product_catalog_mode"])) {
                        $product_catalog_mode = 'disable';
                        } else {
                        $product_catalog_mode = $theme_products["product_catalog_mode"];
                        }

                        if (isset($theme_products["quick_status"])) {
                        $quick_status = $theme_products["quick_status"];
                        }

                        $category1 = 1;
                        $category2 = 0;
                        $category3 = 0;


                        $slider = 1;
                        include('catalog/view/theme/theme_slider_model.php');
                        ?>

                        <?php if (isset($theme_products["slider_mode"]) && $theme_products["slider_mode"] == 'simple'): ?>
                    </div>

                </div>
            </div>
        </div>

    </div>
<?php endif; ?>

