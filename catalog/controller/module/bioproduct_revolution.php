<?php  
class ControllerModuleBioproductRevolution extends Controller {
    public function index($setting) {

        if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
            $this->config->get('bioproduct_additional');
            $data['slider_width_settings'] = $this->config->get('bioproduct_additional');

            $data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
            $data['message'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bioproduct_revolution.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/bioproduct_revolution.tpl', $data);
            } else {
                return $this->load->view('default/template/module/html.tpl', $data);
            }
        }

    }
}