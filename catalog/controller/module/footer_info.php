<?php  
class ControllerModuleFooterInfo extends Controller {
    public function index($setting) {
        $this->load->language('module/footer_info');

        //$data['heading_title'] = html_entity_decode($setting['module_description']['heading'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

        $data['title_facebook'] = html_entity_decode($this->language->get('title_facebook'), ENT_QUOTES, 'UTF-8');
        $data['title_twitter'] = html_entity_decode($this->language->get('title_twitter'), ENT_QUOTES, 'UTF-8');


        if (isset($setting['module_description'][$this->config->get('config_language_id')]['description_about'])) {
            $data['description_about'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description_about'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['description_about'] = '';
        }
        if (isset($setting['module_description'][$this->config->get('config_language_id')]['description_contact'])) {
            $data['description_contact'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description_contact'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['description_contact'] = '';
        }

        if (isset($setting['module_description'][$this->config->get('config_language_id')]['heading_about'])) {
            $data['heading_about'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['heading_about'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['heading_about'] = '';
        }
        if (isset($setting['module_description'][$this->config->get('config_language_id')]['heading_contact'])) {
            $data['heading_contact'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['heading_contact'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['heading_contact'] = '';
        }



        if (isset($setting['module_description'][$this->config->get('config_language_id')]['heading_facebook'])) {
            $data['heading_facebook'] = $setting['module_description'][$this->config->get('config_language_id')]['heading_facebook'];
        } else {
            $data['heading_facebook'] = '';
        }

        if (isset($setting['module_description'][$this->config->get('config_language_id')]['heading_twitter'])) {
            $data['heading_twitter'] = $setting['module_description'][$this->config->get('config_language_id')]['heading_twitter'];
        } else {
            $data['heading_twitter'] = '';
        }






		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/footer_info.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/footer_info.tpl', $data);
		} else {
            return $this->load->view('default/template/module/html.tpl', $data);
        }

	}
}