<?php
class ControllerModuleSpecial extends Controller {
	public function index($setting) {
		$this->load->language('module/special');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProductSpecials($filter_data);

		if ($results) {
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
                $image2x = $this->model_tool_image->resize($result['image'], $setting['width']*2, $setting['height']*2);
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                $image2x = $this->model_tool_image->resize('placeholder.png', $setting['width']*2, $setting['height']*2);
            }

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) { 
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
            /*--------------------------- theme new------------------------------------------ */
            if ((float)$result['special']) {
                $discount = round((($result['price'] - $result['special'])/$result['price'])*100, 0);
            } else {
                $discount = false;
            }
            if ($this->config->get('config_tax')) {
                $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
            } else {
                $tax = false;
            }
            $results_images = $this->model_catalog_product->getProductImages($result['product_id']);
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

            $additional_images = $this->model_catalog_product->getProductImages($result['product_id']);
            $data['additional_images'] = $additional_images;

            /*special end date output*/
            $query_date = $this->db->query("SELECT date_end FROM ".DB_PREFIX."product_special WHERE product_id='".(int)$result['product_id']."'");
            if ($query_date->rows) {
                $special_end_date = $query_date->row["date_end"];
            } else {
                $special_end_date = false;
            }
            /*special end date output*/

            $data['quick_view'] = $this->language->get('quick_view');
            $data['countdown'] = $this->language->get('countdown');
            $data['ex_tax'] = $this->language->get('ex_tax');
            $data['price_in_reward_points'] = $this->language->get('price_in_reward_points');
            /* vars from admin panel labels settings */
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['new_label'] = $this->language->get('new_label');
            $data['sale_label'] = $this->language->get('sale_label');

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

            /*//--------------------------- theme new------------------------------------------ */
            $data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
                /* theme new  */
                'popup'   	 => $popup,
                'thumb2x'   	 => $image2x,
                'popup2x'   	 => $popup2x,
                'additional_images' => $additional_images,
                'date_added'   	 => $result['date_added'],
                'date_available'   	 => $result['date_available'],
                'date_end'   	 => $special_end_date,
                'discount'      => $discount,
                'stock_status'      => $result['stock_status'],
                'manufacturer'      => $result['manufacturer'],
                'minimum'      => $result['minimum'],
                'quantity'      => $result['quantity'],
                'reward'      => $result['reward'],
                'points'      => $result['points'],
                'tax_class_id'      => $result['tax_class_id'],
                'status'      => $result['status'],
                'name_short'   => strlen($result['name']) > 50 ? utf8_substr(strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')), 0, 50) . '..' : $result['name'],
                /* //theme new  */
				'name'    	 => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'   	 => $price,
				'special' 	 => $special,
				'tax'         => $tax,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/special.tpl', $data);
			}else {
                return $this->load->view('default/template/module/special.tpl', $data);
            }
		}
	}
}