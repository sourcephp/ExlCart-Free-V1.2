<?php if ($modules) {
global $config, $loader, $registry;
$loader->model('custom/general');
$model = $registry->get('model_custom_general');
$layout_id = $model->getCurrentLayout();
?>
<div class="<?php echo ($layout_id == 2 ? 'span2' : 'span3'); ?>" id="column_left">
        <?php foreach ($modules as $module) { ?>
            <?php echo $module; ?>
        <?php } ?>
    </div>
<?php } ?>
