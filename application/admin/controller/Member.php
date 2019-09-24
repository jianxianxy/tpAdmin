<?php

namespace app\admin\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 系统用户管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Member extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'peerless_member';

    /**
     * 用户列表
     */
    public function index()
    {
        $this->title = '用户管理';
        $this->assign('title', $this->title);
        $get = $this->request->get();
        $db = Db::name($this->table)->where(['is_deleted' => '0']);
        foreach (['username', 'phone', 'mail'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode('-', str_replace(' ', '', $get['date']));
            $db->whereBetween('login_at', ["{$start} 00:00:00", "{$end} 23:59:59"]);
        }
        $result = parent::_list($db,true,false);
        return $this->fetch('./view/member/member.index.html', $result);
    }

    /**
     * 用户编辑
     */
    public function view()
    {
        return $this->_form($this->table, './view/member/member.form.html');
    }

    /**
     * 表单数据默认处理
     * @param array $data
     */
    public function _form_filter(&$data)
    {
       
    }

    /**
     * 用户禁用
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("用户禁用成功！", '');
        }
        $this->error("用户禁用失败，请稍候再试！");
    }

    /**
     * 用户启用
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("用户启用成功！", '');
        }
        $this->error("用户启用失败，请稍候再试！");
    }

}
