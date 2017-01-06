<?php
$text_items_full = explode(" ",$text_items);;
$text_items_number = $text_items_full[0];
?>

<div id="cart" class="btn-group btn-block">
    <button class="dropdown-toggle heading" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>">
      <span class="btn">
          <i class="icon-cart icon-medstore-cart icon-large"></i>
      </span>
      <span class="badge" id="cart-total">
          <?php echo $text_items_number; ?>
      </span>
  </button>

  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
      <li>
          <div class="added_items"><?php echo (count($products) <= 3 ? '' : 'Last 3 added item(s) from '.count($products)) ; ?></div>
      </li>
    <li>
      <table class="table table-striped">
         <?php
         $i = 0;
         $products1 = array_reverse($products);
         ?>
        <?php foreach ($products1 as $product) : ?>
          <?php $i ++; ?>
          <?php if ($i<4): ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>

          <td class="text-center"><button type="button" onclick="cart_theme.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn-xs remove_button"><i class="icon-trash-3"></i></button></td>

        </tr>
          <?php endif; ?>
        <?php endforeach; ?>

        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger">
              <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn-xs">
                  <i class="icon-trash-3"></i>
              </button>
          </td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>

        <p class="text-right wrapper">
          <div class="cart-close"><i class="fa fa-times-circle"></i></div>

          <a href="<?php echo $cart; ?>" class="button">
                <?php echo $text_cart; ?>
            </a>
            <a href="<?php echo $checkout; ?>" class="button">
                <?php echo $text_checkout; ?>
            </a>
        </p>
      </div>
    </li>
    <?php } else { ?>
    <li class="empty_cart">
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
