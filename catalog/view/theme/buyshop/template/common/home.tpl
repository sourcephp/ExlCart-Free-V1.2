<?php
global $config;
$theme_options = $config->get('bioproduct_general');
$theme_additional = $config->get('bioproduct_additional');
$theme_products = $config->get('bioproduct_products');
$theme_colors = $config->get('bioproduct_colors');
$theme_skin = $config->get('bioproduct_theme');

?>
<?php $class = ''; ?>
<?php echo $header; ?>
<?php echo $content_top; ?>
    <section id="content">
        <h1 style="display: none;"><?php echo $heading_title; ?></h1>
        <h2 style="display: none;">main page</h2>

        <div class="container top">
            <div class="row">

<?php
if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_lifestore'):
if (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) :
     echo $column_left;
endif;
endif;
?>

                <div class="<?php echo ((empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable') && (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_lifestore') ? 'span9' : 'span12'); ?>" id="column_right">
                    <div class="row7">
                        <?php if (isset($isotope)) {echo $isotope;} ?>
                        <div class="row">
                            <?php echo $column_right; ?>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <?php echo $content_bottom; ?>
    </section>
<?php echo $footer; ?>