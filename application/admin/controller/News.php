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
    public $file_table =  'peerless_news_file';
    //任务列表
    public function index(){
        $this->title = '资讯管理';
        $this->assign('title', $this->title);
        $get = $this->request->get();
        $db = Db::name($this->table)->where(['is_deleted' => '0']);
        $result = parent::_list($db,true,false);
        $sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        foreach($result['list'] AS $key => $val){
            $result['list'][$key]['sort_name'] = $sort[$val['sort_id']];
            $result['list'][$key]['author_name'] = '管理员';
        }
        return $this->fetch('./view/news/news.index.html', $result);
    }
    //任务编辑
    public function edit(){
        $this->title = '添加资讯';
        $this->assign('title', $this->title);
        $sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        $this->assign('sort', $sort);
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
    //添加资讯form过滤
    public function _form_filter(&$data)
    {
        if ($this->request->isPost()) {
            unset($data['file_1']);
            unset($data['file_2']);
            unset($data['file_3']);
            $data['created_at'] = date('Y-m-d H:i:s');
        }else if(isset($data['id'])){            
            $image = Db::table($this->file_table)->where('fid',$data['id'])->column('file');
            $col =array('file_1','file_2','file_3');
            foreach($col AS $key =>$val){
                $data[$val] = isset($image[$key]) ? $image[$key] : '';
            }
        }else{
            $col =array('file_1','file_2','file_3');
            foreach($col AS $key =>$val){
                $data[$val] =  '';
            }
        }
    }
    //添加资讯成功回调方法
    public function _form_result($id){
        if ($this->request->isPost()) {
            $post = $this->request->post();
            if(isset($post['id']) && $post['id'] > 0){
                $id = $post['id'];
            }
            $col = array('file_1','file_2','file_3');
            $data = array();
            foreach($col AS $val){
                if($post[$val]){
                    $data[] = ['fid'=>$id,'file'=>$post[$val]];
                }
            }
            if(!empty($data)){
                Db::table($this->file_table)->where('fid',$id)->delete(); 
                $ref = Db::name($this->file_table)->insertAll($data);
                if($ref < 1){
                    $this->error('存储图片失败, 请稍候再试!');
                }
            }
        }
    }
}