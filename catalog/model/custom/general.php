<?php
class ModelCustomGeneral extends Model {
    public function getCurrentLayout() {
        if (isset($this->request->get['route'])) {
            $route = (string)$this->request->get['route'];
        } else {
            $route = 'common/home';
        }
        $layout_id = 0;
        if ($route == 'product/category' && isset($this->request->get['path'])) {
            $path = explode('_', (string)$this->request->get['path']);
            $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
        }
        if ($route == 'product/product' && isset($this->request->get['product_id'])) {
            $layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
        }
        if ($route == 'information/information' && isset($this->request->get['information_id'])) {
            $layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
        }
        if (!$layout_id) {
            $layout_id = $this->model_design_layout->getLayout($route);
        }
        if (!$layout_id) {
            $layout_id = $this->config->get('config_layout_id');
        }
        return $layout_id;
	}

    public function getCurrentMenuCategory($category_href) {
        if (isset($category_href)) {
            $parts = explode('=', (string)$category_href);
        } else {
            $parts = array();
        }

        $category_id = end($parts);
        if (is_numeric($category_id)) {
            $category_id = $category_id;
        } else {
            $parts = explode('/', (string)$category_id);
            $query = $this->db->query("SELECT query as query FROM ".DB_PREFIX."url_alias WHERE keyword='".end($parts)."'");
            $parts = explode('=', (string)$query->row['query']);
            $category_id = end($parts);
        }

        return $category_id;
    }


    public function getCategoryOption($category_id, $option) {
        $column_exists_option = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category LIKE '".$option."' ");
        if ($column_exists_option->num_rows) {
            $query = $this->db->query("SELECT DISTINCT `".$option."` FROM " . DB_PREFIX . "category c WHERE c.category_id = '" . (int)$category_id . "' ");
            if ($query->rows) {
                $category_option = $query->row["$option"];
            } else {
                $category_option = '';
            }
        } else {
            $category_option = '';
        }
        return $category_option;

    }




    public function getCssClass($column_left,$column_right,$category_page = '') {
        if ($column_left && $column_right) {
            if ($category_page == 1) {
                $class = 'span6';
            } else {
                $class = 'col-sm-6';
            }
        } elseif ($column_left || $column_right) {
            if ($category_page == 1) {
                $class = 'span9';
            } else {
                $class = 'col-sm-9';
            }
        } else {
            if ($category_page == 1) {
                $class = 'span12';
            } else {
                $class = 'col-sm-12';
            }
        }
        return $class;
    }

    public function getProductCustom($product_id, $option) {
        $column_exists_option = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description LIKE '".$option."' ");

        if ($column_exists_option->num_rows) {
            $query = $this->db->query("SELECT DISTINCT `".$option."` FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ");
            if ($query->rows) {
                $custom1 = $query->row[$option];
                if ($option == 'custom_description'){
                    $custom = html_entity_decode($custom1, ENT_QUOTES, 'UTF-8');
                } else {
                    $custom = $custom1;
                }

            } else {
                $custom = '';
            }

        } else {
            $custom = '';
        }
        return $custom;
    }

    public function getProductIds($category_id) {
        $query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_to_category ptc WHERE ptc.category_id = '" . (int)$category_id . "' ");
        if ($query->rows) {
            return $query->rows;
        } else {
            return false;

        }

    }


}