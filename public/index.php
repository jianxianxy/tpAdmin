<?php
header("Access-Control-Allow-Origin: *");
//对外服务
/* SESSION会话名称 */
session_name('s' . substr(md5(__FILE__), 0, 8));
define('API_ROOT',dirname(dirname(__FILE__)));
/* 定义应用目录 */
define('APP_PATH', API_ROOT. '/api/');

/* 定义Runtime运行目录 */
define('RUNTIME_PATH', API_ROOT . '/runtime/');

/* 加载框架引导文件 */
require API_ROOT . '/thinkphp/start.php';
