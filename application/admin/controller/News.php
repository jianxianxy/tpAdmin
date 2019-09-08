<?php

namespace app\admin\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 系统用户管理控制器
 * Class Task
 * @author <jianxianxy@qq.com>
 */
class News extends BasicAdmin
{
    public $table = 'PeerlessNews';
    public $sort_table = 'PeerlessNewsSort';
    //任务列表
    public function index(){
        $this->title = '资讯管理';
        $get = $this->request->get();
        $db = Db::name($this->table)->where(['is_deleted' => '0']);
        $result = parent::_list($db,true,false);
        $this->assign('title', $this->title);
        return $this->fetch('./view/news/news.index.html', $result);
    }
    //任务编辑
    public function edit()
    {
        $this->title = '添加资讯';
        $this->assign('title', $this->title);
        return $this->_form($this->table, './view/news/news.form.html');
    }
    public function status(){
        $post = $this->request->post();
        $tabcol['id'] = $post['id'];
        $tabcol['status'] = $post['value'];
        $db = Db::name($this->table);
        $result = DataService::save($db, $tabcol,'id');
        if ($result !== false) {
            $this->success('恭喜, 上线成功!', '');
        }
        $this->error('失败, 请稍候再试!');
    }
    //任务分类列表
    public function sort(){
        $this->title = '任务分类管理';
        $get = $this->request->get();
        $db = Db::name($this->sort_table)->where(['is_deleted' => '0']);
        $result = parent::_list($db,true,false);
        $this->assign('title', $this->title);
        $sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        $this->assign('sort', $sort);
        return $this->fetch('./view/task/task.sort.html', $result);
    }
    //任务分类编辑
    public function sortedit()
    {
        $sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        $this->assign('sort', $sort);
        return $this->_form($this->sort_table, './view/task/task.sortform.html');
    }    
}