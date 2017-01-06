<?php
if (count($currencies) > 1) :
global $config;
$theme_options = $config->get('bioproduct_general');
?>

<?php if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_medstore') { ?>
<div class="fadelink fadelink-currency">
<a><i class="icon icon-medstore-dollars"></i>
    <?php foreach ($currencies as $currency) : if ($currency['code'] == $code) :  echo $currency['title']; endif;  endforeach; ?>
    <span class="caret"></span></a>

    <div class="ul_wrapper">
        <div class="ul_substitute">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <?php foreach ($currencies as $currency) : ?>
                <?php if ($currency['symbol_left']) { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_left']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } else { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_right']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } ?>
                <?php endforeach; ?>
                <input type="hidden" name="code" value="" />
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            </form>

        </div>

    </div>
</div>
<?php } else { ?>

<span class="link_label label_currency"><?php echo $text_currency; ?>:</span>
<div class="fadelink currency_block">
    <?php foreach ($currencies as $currency) : ?>
        <?php if ($currency['code'] == $code) : ?>
            <a><?php echo $currency['title']; ?></a>
        <?php endif;  ?>
    <?php endforeach; ?>
    <div class="ul_wrapper">
        <div class="ul_substitute">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
                <?php foreach ($currencies as $currency) : ?>
                <?php if ($currency['symbol_left']) { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_left']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } else { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_right']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } ?>
                <?php endforeach; ?>
                <input type="hidden" name="code" value="" />
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            </form>
        </div>

    </div>

</div>

<?php }  ?>
<?php endif; ?>





