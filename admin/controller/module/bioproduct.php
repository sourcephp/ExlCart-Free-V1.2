<?php
class ControllerModuleBioproduct extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/bioproduct');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('bioproduct', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

            if ($this->request->post['buttonForm'] == 'apply') {
                $this->response->redirect($this->url->link('module/bioproduct', 'token=' . $this->session->data['token'], 'SSL'));
            } else {
                $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            }

		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        $data['success'] = $this->language->get('text_success');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['entry_status'] = $this->language->get('entry_status');

		$data['help_code'] = $this->language->get('help_code');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/bioproduct', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/bioproduct', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        /*variables for theme */
        $data['bproduct'] = $this->url->link('catalog/bproduct', 'token=' . $this->session->data['token'], 'SSL');
        $data['bcategory'] = $this->url->link('catalog/bcategory', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['bioproduct_general'])) {
			$data['bioproduct_general'] = $this->request->post['bioproduct_general'];
		} else {
			$data['bioproduct_general'] = $this->config->get('bioproduct_general');
		}

        if (isset($this->request->post['bioproduct_colors'])) {
            $data['bioproduct_colors'] = $this->request->post['bioproduct_colors'];
        } else {
            $data['bioproduct_colors'] = $this->config->get('bioproduct_colors');
        }
        if (isset($this->request->post['bioproduct_products'])) {
            $data['bioproduct_products'] = $this->request->post['bioproduct_products'];
        } else {
            $data['bioproduct_products'] = $this->config->get('bioproduct_products');
        }
        if (isset($this->request->post['bioproduct_flexslider'])) {
            $data['bioproduct_flexslider'] = $this->request->post['bioproduct_flexslider'];
        } else {
            $data['bioproduct_flexslider'] = $this->config->get('bioproduct_flexslider');
        }
        if (isset($this->request->post['bioproduct_additional'])) {
            $data['bioproduct_additional'] = $this->request->post['bioproduct_additional'];
        } else {
            $data['bioproduct_additional'] = $this->config->get('bioproduct_additional');
        }
        if (isset($this->request->post['bioproduct_theme'])) {
            $data['bioproduct_theme'] = $this->request->post['bioproduct_theme'];
        } else {
            $data['bioproduct_theme'] = $this->config->get('bioproduct_theme');
        }

        $this->load->model('tool/image');

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        if (isset($this->request->post['bioproduct_rightimg'])) {
            $data['bioproduct_rightimg'] = $this->request->post['bioproduct_rightimg'];
        } else {
            $data['bioproduct_rightimg'] = $this->config->get('bioproduct_rightimg');
        }
        if (isset($this->request->post['bioproduct_rightimg']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_rightimg'])) {
            $data['rightimg'] = $this->model_tool_image->resize($this->request->post['bioproduct_rightimg'], 100, 100);
        } elseif ($this->config->get('bioproduct_rightimg') && is_file(DIR_IMAGE . $this->config->get('bioproduct_rightimg'))) {
            $data['rightimg'] = $this->model_tool_image->resize($this->config->get('bioproduct_rightimg'), 100, 100);
        } else {
            $data['rightimg'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        if (isset($this->request->post['bioproduct_bgall'])) {
            $data['bioproduct_bgall'] = $this->request->post['bioproduct_bgall'];
        } else {
            $data['bioproduct_bgall'] = $this->config->get('bioproduct_bgall');
        }
        if (isset($this->request->post['bioproduct_bgall']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_bgall'])) {
            $data['bgall'] = $this->model_tool_image->resize($this->request->post['bioproduct_bgall'], 100, 100);
        } elseif ($this->config->get('bioproduct_bgall') && is_file(DIR_IMAGE . $this->config->get('bioproduct_bgall'))) {
            $data['bgall'] = $this->model_tool_image->resize($this->config->get('bioproduct_bgall'), 100, 100);
        } else {
            $data['bgall'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        if (isset($this->request->post['bioproduct_contactimg'])) {
            $data['bioproduct_contactimg'] = $this->request->post['bioproduct_contactimg'];
        } else {
            $data['bioproduct_contactimg'] = $this->config->get('bioproduct_contactimg');
        }
        if (isset($this->request->post['bioproduct_contactimg']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_contactimg'])) {
            $data['contactimg'] = $this->model_tool_image->resize($this->request->post['bioproduct_contactimg'], 100, 100);
        } elseif ($this->config->get('bioproduct_contactimg') && is_file(DIR_IMAGE . $this->config->get('bioproduct_contactimg'))) {
            $data['contactimg'] = $this->model_tool_image->resize($this->config->get('bioproduct_contactimg'), 100, 100);
        } else {
            $data['contactimg'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }



        if (isset($this->request->post['bioproduct_headerpattern'])) {
            $data['bioproduct_headerpattern'] = $this->request->post['bioproduct_headerpattern'];
        } else {
            $data['bioproduct_headerpattern'] = $this->config->get('bioproduct_headerpattern');
        }
        if (isset($this->request->post['bioproduct_headerpattern']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_headerpattern'])) {
            $data['headerpattern'] = $this->model_tool_image->resize($this->request->post['bioproduct_headerpattern'], 100, 100);
        } elseif ($this->config->get('bioproduct_headerpattern') && is_file(DIR_IMAGE . $this->config->get('bioproduct_headerpattern'))) {
            $data['headerpattern'] = $this->model_tool_image->resize($this->config->get('bioproduct_headerpattern'), 100, 100);
        } else {
            $data['headerpattern'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        if (isset($this->request->post['bioproduct_decoration'])) {
            $data['bioproduct_decoration'] = $this->request->post['bioproduct_decoration'];
        } else {
            $data['bioproduct_decoration'] = $this->config->get('bioproduct_decoration');
        }
        if (isset($this->request->post['bioproduct_decoration']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_decoration'])) {
            $data['decoration'] = $this->model_tool_image->resize($this->request->post['bioproduct_decoration'], 100, 100);
        } elseif ($this->config->get('bioproduct_decoration') && is_file(DIR_IMAGE . $this->config->get('bioproduct_decoration'))) {
            $data['decoration'] = $this->model_tool_image->resize($this->config->get('bioproduct_decoration'), 100, 100);
        } else {
            $data['decoration'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        if (isset($this->request->post['bioproduct_contentbg'])) {
            $data['bioproduct_contentbg'] = $this->request->post['bioproduct_contentbg'];
        } else {
            $data['bioproduct_contentbg'] = $this->config->get('bioproduct_contentbg');
        }
        if (isset($this->request->post['bioproduct_contentbg']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_contentbg'])) {
            $data['contentbg'] = $this->model_tool_image->resize($this->request->post['bioproduct_contentbg'], 100, 100);
        } elseif ($this->config->get('bioproduct_contentbg') && is_file(DIR_IMAGE . $this->config->get('bioproduct_contentbg'))) {
            $data['contentbg'] = $this->model_tool_image->resize($this->config->get('bioproduct_contentbg'), 100, 100);
        } else {
            $data['contentbg'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        if (isset($this->request->post['bioproduct_delimeter'])) {
            $data['bioproduct_delimeter'] = $this->request->post['bioproduct_delimeter'];
        } else {
            $data['bioproduct_delimeter'] = $this->config->get('bioproduct_delimeter');
        }
        if (isset($this->request->post['bioproduct_delimeter']) && is_file(DIR_IMAGE . $this->request->post['bioproduct_delimeter'])) {
            $data['delimeter'] = $this->model_tool_image->resize($this->request->post['bioproduct_delimeter'], 100, 100);
        } elseif ($this->config->get('bioproduct_delimeter') && is_file(DIR_IMAGE . $this->config->get('bioproduct_delimeter'))) {
            $data['delimeter'] = $this->model_tool_image->resize($this->config->get('bioproduct_delimeter'), 100, 100);
        } else {
            $data['delimeter'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        /* information pages */
        $this->load->model('catalog/information');

        //var_dump($this->model_catalog_information->getInformations());

        foreach ($this->model_catalog_information->getInformations() as $result) {
            $data['information_pages'][] = array(
                'title' => $result['title'],
                'information_id' => $result['information_id'],
                'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
            );
        }
        /* end information pages */


        $data['token'] = $this->session->data['token'];

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        /*end variables for theme */

        if (isset($this->request->post['bioproduct_status'])) {
			$data['bioproduct_status'] = $this->request->post['bioproduct_status'];
		} else {
			$data['bioproduct_status'] = $this->config->get('bioproduct_status');
		}

        $this->document->addScript($this->config->get('config_url').'catalog/view/bs-colorpicker/js/colorpicker.js');
        $this->document->addStyle($this->config->get('config_url').'catalog/view/bs-colorpicker/css/colorpicker.css');
        $this->document->addStyle($this->config->get('config_url').'view/stylesheet/bioproduct.css');
        //$data['config_url'] = $this->config->get('config_url');


        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/bioproduct.tpl', $data));
	}

    public function install(){
        $this->load->model('catalog/bproduct');
        $this->model_catalog_bproduct->addColumnsProducts();

        $this->load->model('catalog/bcategory');
        $this->model_catalog_bcategory->addColumnsCategories();


        $this->load->model('setting/setting');
        $this->session->data['success'] = $this->language->get('text_success');

    }

    protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/bioproduct')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}