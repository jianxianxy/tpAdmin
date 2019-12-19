<?php
namespace app\admin\controller;

use controller\BasicAdmin;
use think\Db;

class Points extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'peerless_point_log';

    /**
     * 日志列表
     * @return array|string
     */
    public function index()
    {
        $this->title = '积分日志';
        $this->assign('title', $this->title);
        $get = $this->request->get();
        $db = Db::name($this->table)->order('id desc');
        if(isset($get['user_id']) && $get['user_id'] > 0){
            $db->where(['user_id' => $get['user_id']]);
        }
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode('-', str_replace(' ', '', $get['date']));
            $db->whereBetween('create_at', ["{$start} 00:00:00", "{$end} 23:59:59"]);
        }
        $result = parent::_list($db,true,false);
        return $this->fetch('./view/member/points.index.html', $result);
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {

    }
}
