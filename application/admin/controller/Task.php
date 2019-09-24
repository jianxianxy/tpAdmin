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
class Task extends BasicAdmin
{
    public $table = 'peerless_task';
    public $sort_table = 'peerless_sort';
    public $tpl_table = 'peerless_tpl';
    public $type = [1=>'单选',2=>'多选',3=>'整数'];
    //任务列表
    public function index(){
        $this->title = '任务管理';
        $this->assign('title', $this->title);
        $get = $this->request->get();
        $db = Db::name($this->table)->where(['is_deleted' => '0']);
        $result = parent::_list($db,true,false);        
        $sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        foreach($result['list'] AS $key => $val){
            $result['list'][$key]['sort_name'] = $sort[$val['sort_id']];
        }
        return $this->fetch('./view/task/task.index.html', $result);
    }
    //任务编辑
    public function edit()
    {
        $sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        $this->assign('sort', $sort);
        $tpl = Db::table('peerless_tpl')->column('name','id');
        $this->assign('tpl', $tpl);
        return $this->_form($this->table, './view/task/task.form.html');
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
    
    //任务模板列表
    public function tpl(){
        $this->title = '任务模板管理';
        $get = $this->request->get();
        $db = Db::name($this->tpl_table);
        $result = parent::_list($db,true,false);
        $this->assign('title', $this->title);
        $this->assign('type',$this->type);
        return $this->fetch('./view/task/task.tpl.html', $result);
    }
    //任务模板编辑
    public function tpledit()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            $tabcol['type'] = intval($post['type']);
            if($post['type'] != 3){
                $data = array();
                foreach($post['key'] AS $key => $val){
                    $data[$val] = $post['val'][$key];
                }
                $tabcol['option'] = json_encode($data);
            }else{
                $tabcol['option'] = '';
            }            
            $tabcol['id'] = isset($post['id']) ? $post['id'] : 0;            
            $tabcol['name'] = trim($post['name']);            
            $tabcol['style'] = intval($post['style']);
            $db = Db::name($this->tpl_table);
            $result = DataService::save($db, $tabcol,'id');
            if ($result !== false) {
                $this->success('恭喜, 数据保存成功!', '');
            }
            $this->error('数据保存失败, 请稍候再试!');
        }else{
            $result = array('option'=>[1=>'是'],'type'=>1);
            if($this->request->get('id')){
                $result = Db::table('peerless_tpl')->where('id',$this->request->get('id'))->find();
                $result['option'] = json_decode($result['option'],true);
            }
            $this->assign('type',$this->type);            
            return $this->fetch('./view/task/task.tplform.html', ['vo'=>$result]);
        }        
    }
    //删除
    public function del(){
        $post = $this->request->post();
        $id = $post['id'];
        $result = Db::table($this->table)->where('id',$id)->delete();
        if ($result > 0) {
            $this->success('Good, 删除成功!', '');
        }
        $this->error('What？ 删除失败');
    }
}