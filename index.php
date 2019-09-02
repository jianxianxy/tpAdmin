<?php

// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

/* SESSION会话名称 */
session_name('s' . substr(md5(__FILE__), 0, 8));

/* 定义应用目录 */
define('APP_PATH', __DIR__ . '/application/');

/* 定义Runtime运行目录 */
define('RUNTIME_PATH', __DIR__ . '/runtime/');

/* 加载框架引导文件 */
require __DIR__ . '/thinkphp/start.php';
