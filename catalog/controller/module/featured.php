<?php
class ControllerModuleFeatured extends Controller {
    public function index($setting) {
        $this->load->language('module/featured');
        /*theme new*/
        static $module = 0;
        /*//theme new*/

        $data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$products = array_slice($setting['product'], 0, (int)$setting['limit']);

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
                    $image2x = $this->model_tool_image->resize($product_info['image'], $setting['width']*2, $setting['height']*2);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                    $image2x = $this->model_tool_image->resize('placeholder.png', $setting['width']*2, $setting['height']*2);
                }

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
                /*--------------------------- theme new------------------------------------------ */

                if ((float)$product_info['special']) {
                    $discount = round((($product_info['price'] - $product_info['special'])/$product_info['price'])*100, 0);
                } else {
                    $discount = false;
                }
                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
                } else {
                    $tax = false;
                }
                $results_images = $this->model_catalog_product->getProductImages($product_info['product_id']);
                if ($results_images) {
                    $first = true;
                    foreach ($results_images as $results_image) {
                        if ( $first ) {
                            $popup = $this->model_tool_image->resize($results_image['image'], $setting['width'], $setting['height']);
                            $popup2x = $this->model_tool_image->resize($results_image['image'], $setting['width']*2, $setting['height']*2);
                            $first = false;
                        }
                    }
                } else {
                    $popup = false;
                    $popup2x = false;
                }

                $data['additional_images'] = array();

                $additional_images = $this->model_catalog_product->getProductImages($product_info['product_id']);
                $data['additional_images'] = $additional_images;

                /*special end date output*/
                $query_date = $this->db->query("SELECT date_end FROM ".DB_PREFIX."product_special WHERE product_id='".(int)$product_info['product_id']."'");
                if ($query_date->rows) {
                    $special_end_date = $query_date->row["date_end"];
                } else {
                    $special_end_date = false;
                }
                /*special end date output*/

                /* vars from admin panel labels settings */
                $data['button_compare'] = $this->language->get('button_compare');
                $data['button_wishlist'] = $this->language->get('button_wishlist');
                $data['quick_view'] = $this->language->get('quick_view');
                $data['new_label'] = $this->language->get('new_label');
                $data['sale_label'] = $this->language->get('sale_label');
                $data['countdown'] = $this->language->get('countdown');
                $data['ex_tax'] = $this->language->get('ex_tax');
                $data['price_in_reward_points'] = $this->language->get('price_in_reward_points');
                $this->config->get('bioproduct_products');
                $data['bioproduct_products_settings'] = $this->config->get('bioproduct_products');

                if (isset($data['bioproduct_products_settings']['new_status'])) {
                    $data['new_status'] = $data['bioproduct_products_settings']['new_status'];
                } else {
                    $data['new_status'] = '';
                }
                if (isset($data['bioproduct_products_settings']['new_position'])) {
                    $data['new_position'] = $data['bioproduct_products_settings']['new_position'];
                } else {
                    $data['new_position'] = '';
                }
                if (isset($data['bioproduct_products_settings']['sale_status'])) {
                    $data['sale_status'] = $data['bioproduct_products_settings']['sale_status'];
                } else {
                    $data['sale_status'] = '';
                }
                if (isset($data['bioproduct_products_settings']['sale_position'])) {
                    $data['sale_position'] = $data['bioproduct_products_settings']['sale_position'];
                } else {
                    $data['sale_position'] = '';
                }
                if (isset($data['bioproduct_products_settings']['newlabel_period'])) {
                    $data['newlabel_period'] = $data['bioproduct_products_settings']['newlabel_period'];
                } else {
                    $data['newlabel_period'] = '';
                }
                $data['module'] = $module++;

                /*--------------------------- //theme new------------------------------------------ */

                $data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,

                    /* theme new  */
                    'popup'   	 => $popup,
                'thumb2x'   	 => $image2x,
                'popup2x'   	 => $popup2x,
                    'additional_images' => $additional_images,
                    'date_added'   	 => $product_info['date_added'],
                    'date_available'   	 => $product_info['date_available'],
                    'discount'      => $discount,
                    'name_short'   => strlen($product_info['name']) > 50 ? utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, 50) . '..' : $product_info['name'],

                    'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',

                    'stock_status'      => $product_info['stock_status'],
                    'manufacturer'      => $product_info['manufacturer'],
                    'minimum'      => $product_info['minimum'],
                    'quantity'      => $product_info['quantity'],
                    'reward'      => $product_info['reward'],
                    'points'      => $product_info['points'],
                    'tax_class_id'      => $product_info['tax_class_id'],
                    'status'      => $product_info['status'],
                    'tax'         => $tax,
                    'date_end'   	 => $special_end_date,
                    /* //theme new  */
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
                return $this->load->view('default/template/module/featured.tpl', $data);
            }
		}
	}
}