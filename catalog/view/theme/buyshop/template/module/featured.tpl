<?php
global $config;
$theme_options = $config->get('bioproduct_general');
$theme_products = $config->get('bioproduct_products');

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

if (empty($this->request->get['route']) || $this->request->get['route'] = 'common/home'){

    if (isset($theme_options["sidebar"]) && $theme_options["sidebar"] == 1){
        if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_cosmetic'){
            $class = 'span9';
        } else {
            if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_lifestore'){
                $class = 'span9';
            } else {
                $class = 'span9';
            }
        }

    } else {
        if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_cosmetic'){
            $class = 'span9';
        } else {
            $class = 'span12';
        }


    }

    if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_creative'){
        $class = 'span9';
    }


} else {
    $class = '';
}

?>

<div id="module_featured<?php echo $module; ?>" class="main_slider <?php echo $class; ?> carousel_slider featured_slider">
<h3 class="main_slider_title featured_title"><?php echo $heading_title; ?></h3>
    <div class="row product_outer carousel_items">

    <?php
    $category1 = 0;
$category2 = 0;
$category3 = 0;

        $span_numbers = 3;
        $preview_size = 'normal';
        $product_image_size = 'big';
        $columns_count = 12;
        $slider = 2;


        $small = 0;
        include('catalog/view/theme/theme_slider_model.php');
    ?>
    </div>
</div>