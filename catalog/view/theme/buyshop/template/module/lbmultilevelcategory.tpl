<?php if ($categories) :?>
<div class="block_listing block_listing_category">
    <div class="block block-layered-nav">
        <div class="block-title"><strong><span><?php echo $heading_title; ?></span></strong></div>
        <div class="block-content">
            <div id="category_menu">
                <ul id="collapsed-menu">
                    <?php
              $nav_0 = 1;
              $nav_1 = 1;
              $nav_2 = 1;

              ?>
                    <!--level0-->
                    <?php foreach ($categories as $category) : ?>
                    <li class="level0 nav-<?php echo $nav_0; ?> <?php echo($nav_0 == 1 ? 'first' : ''); ?> <?php echo ($category['children'] ? 'parent' : 'child'); ?>">
                        <label class="tree-toggler nav-header closed">
                            <!--category icon-->
                            <?php
                            global $loader, $registry;

                            $loader->model('custom/general');
                            $model = $registry->get('model_custom_general');

                            $category_id = $model->getCurrentMenuCategory($category["href"]);
                            $category_icon = $model->getCategoryOption($category_id, 'icon');

                            if (isset($category_icon) && $category_icon != '') :
                                echo '<img class="category_icon" src="image/catalog/'.$category_icon.'" alt="" />';
                            endif;

                            ?>
                            <!--end category icon-->

                            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

                            <?php if ($category['children']) : ?><span class="collapse_button">+</span><?php endif; ?>
                        </label>
                        <?php if ($category['children']) : ?>
                        <ul class="nav nav-list tree">
                            <!--level1-->
                            <?php foreach ($category['children'] as $child) : ?>
                            <li class="level1 nav-<?php echo $nav_0; ?>-<?php echo $nav_1; ?> <?php echo($nav_1 == 1 ? 'first' : ''); ?> <?php echo ($child['sister_id'] ? 'parent' : 'child'); ?> <?php echo ($child['category_id'] == $child_id ? 'active7' : ''); ?>">
                                <label class="tree-toggler nav-header closed">
                                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                    <?php if($child['sister_id']) : ?><span class="collapse_button">+</span><?php endif; ?>
                                </label>

                                <?php if($child['sister_id']): ?>
                                <ul class="nav nav-list tree">
                                    <!--level2-->
                                    <?php foreach($child['sister_id'] as $sisters) : ?>
                                    <li class="level2 nav-<?php echo $nav_0; ?>-<?php echo $nav_1; ?>-<?php echo $nav_2; ?> <?php echo($nav_2 == 1 ? 'first' : ''); ?>">
                                        <label class="tree-toggler nav-header closed"><a href="<?php echo $sisters['href']; ?>"><?php echo $sisters['name']; ?></a></label>
                                    </li>
                                    <?php $nav_2 ++; ?>
                                    <?php endforeach; ?>
                                    <!--//level2-->
                                </ul>
                                <?php endif; ?>
                            </li>
                            <?php $nav_1 ++; ?>
                            <?php endforeach; ?>
                            <!--//level1-->

                        </ul>
                        <?php endif; ?>
                    </li>
                    <?php $nav_0 ++; ?>
                    <?php endforeach; ?>
                    <!--//level0-->
                </ul>

            </div>

        </div>
    </div>
</div>
<?php endif; ?>
