<?php  
class ControllerModuleUpsells extends Controller {
    public function index() {
        $this->load->language('module/upsells');

      	$data['heading_title'] = $this->language->get('heading_title');
        $data['empty_products'] = $this->language->get('empty_products');
        $data['tab_also_bought_title'] = $this->language->get('tab_also_bought_title');

        $this->load->model('catalog/product_also_bought');

        $data['text_no_product_also_bought'] = $this->language->get('text_no_product_also_bought');
        $data['products_also_bought'] = array();
        $products_also_bought_result = $this->model_catalog_product_also_bought->getProductAlsoBought((int)$this->request->get['product_id'], 10);

        foreach ($products_also_bought_result as $result) {
            if ($result['image']) {
                $image = $result['image'];
            } else {
                $image = 'no_image.jpg';
            }
            $data['products_also_bought'][] = array(
                'product_id'    => $result['product_id'],
                'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),

                'name'    		=> $result['name'],
                'thumb'   		=> $this->model_tool_image->resize($image, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height')),
                'thumb2x'   	=> $this->model_tool_image->resize($image, $this->config->get('config_image_product_width')*2, $this->config->get('config_image_product_height')*2)
            );

        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/upsells.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/upsells.tpl', $data);
        } else {
            return $this->load->view('default/template/module/html.tpl', $data);
        }
	}
}