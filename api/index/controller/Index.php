<?php
namespace app\index\controller;

use think\Db;
use think\Controller;

/**
 * 网站入口控制器
 */
class Index extends Controller
{
    public function index(){       
        $category = $_GET['category'] ?? 1;
        $catDesc = array(1=>'财经',2=>'财经',3=>'预测',4=>'名人'); 
        //$sort = Db::table('peerless_sort')->where('is_deleted',0)->column('name','id');
        $article = [
            [
                'id' => 3,
                'rank' => 1,
                'author' => '雷洛',
                'category' => $catDesc[$category],
                'time' => '2019.8.28',
                'image' => ['images/cbd.jpg'],
                'content' => '伴随着设备的轰隆声，一张张白纸“换装”成为人民币。8月26日，距离新版人民币面世还有4天，石家庄印钞有限公司车间内的工作人员们有序忙碌着。
                    根据央行公告，此次“上新”的人民币包括50元、20元、10元、1元纸币及1元、5角、1角硬币，是2019年版第五套人民币，自8月30日起发行。
                    人民币印制过程向来因保密等级高而具有神秘色彩，也引发坊间猜测不断：一张白纸如何变成“国家名片”？普通人能买到印钞纸吗？印钞车间对温度湿度有何要求？
                    在新版人民币即将发行之际，新京报记者前往中国印钞造币总公司下属石家庄印钞有限公司探访了人民币印制过程。'
            ],
            [
                'id' => 6,
                'rank' => 11,
                'author' => '麒麟',
                'category' => $catDesc[$category],
                'time' => '2019.8.28',
                'image' => ['images/muwu.jpg','images/shuijiao.jpg','images/muwu.jpg'],
                'content' => '印钞的第一道工序是胶印，这道工序中主要完成钞票正背面底纹图案的印刷。通过鲜亮、精美的底纹图案，赋予钞票特定的色彩美感。工人在检查胶印后的整版钞票。
                    第二道工序是凹印，真钞所特有的凹凸感即来自于这种印刷方式。上述负责人称，凹印是印钞生产体系中的核心工序。
                    凹印图纹具有明显的立体感、层次感和凹凸手感，防伪性能突出。钞票中的主席人像、行名、国徽、背面主景图案、行长之章、年号等重要图案均采用凹印。'
            ],
            [
                'id' => 9,
                'rank' => 1,
                'author' => '旋舞',
                'category' => $catDesc[$category],
                'time' => '2019.8.28',
                'image' => ['images/cbd.jpg'],
                'content' => '据了解，光彩光变防伪技术曾在第五套人民币2015年版100元券上应用，该版百元钞票还因此获称土豪金钞票。上述负责人称，光彩光变面额数字位于票面正面中部，改变钞票观察角度，面额数字颜色由金色变为绿色，并可见一条亮光带上下滚动。
                    第四道工序是正背面涂布。这也是新增的正背面保护涂层的印刷，提高了钞票流通过程中的抗脏污性能，可有效改善钞票整洁度。'
            ],
            [
                'id' => 12,
                'rank' => 1,
                'author' => '旋舞',
                'category' => $catDesc[$category],
                'time' => '2019.8.28',
                'image' => [],
                'content' => '据了解，光彩光变防伪技术曾在第五套人民币2015年版100元券上应用，该版百元钞票还因此获称土豪金钞票。上述负责人称，光彩光变面额数字位于票面正面中部，改变钞票观察角度，面额数字颜色由金色变为绿色，并可见一条亮光带上下滚动。
                    第四道工序是正背面涂布。这也是新增的正背面保护涂层的印刷，提高了钞票流通过程中的抗脏污性能，可有效改善钞票整洁度。'
            ],
        ];
        $ar1 = $article[rand(0,3)];
        $ar2 = $article[rand(0,3)];
        $ar3 = $article[rand(0,3)];
        $backData = [$ar1,$ar2,$ar3];
        
        $callbackName = isset($_GET["callback"]) ? $_GET["callback"] : '';  
        $json_data = json_encode(array('code'=>0,'data'=>$backData));
        echo $callbackName."(" . $json_data . ")";  
        exit;
    }
}

