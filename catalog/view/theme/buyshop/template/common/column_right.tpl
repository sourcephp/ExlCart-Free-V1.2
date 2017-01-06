<?php if ($modules) {
global $config, $loader, $registry;
$loader->model('custom/general');
$model = $registry->get('model_custom_general');
$layout_id = $model->getCurrentLayout();
?>
<div id="column-right" class="<?php echo ($layout_id == 1 || $layout_id == 2 ? '' : 'col-sm-3 hidden-xs'); ?>">
        <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
</div>
<?php } ?>
