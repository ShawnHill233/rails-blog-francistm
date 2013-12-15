# Francis' Blog

[![Build Status](https://travis-ci.org/francistm/rails-blog.png?branch=master)](https://travis-ci.org/francistm/rails-blog)

## 简介
构架于 Ruby on Rail 3.2，数据库部分采用MySQL。（尚未重构完成)  
文件上传部分基于[七牛云存储](http://www.qiniu.com/)服务，请前往其网站申请账号。

由于对RoR不是很了解，所以没有支持主题功能，修改样式需完全重构视图文件和CSS样式表。

## 开发
1. 创建`config/database.yml`，内容请参考`config/database-travis.yml`文件
2. 创建`config/initializers/qiniu-rs.rb`文件，内容参考：
  `Qiniu::RS.establish_connection! access_key: "Your AK", secret_key: "Your SK"`
3. 数据库结构迁移`rake db:schema:load`
4. 使用`rails c`创建第一个可登陆后台的用户即可

## 测试
使用`Rspec 2.14`，配合`Factory Girl`与`Faker`完成。

测试方法：

1. 运行`rake db:test:prepare`初始化测试数据库结构
2. 终端运行 `rspec ./spec`

## 部署
已嵌入`capistrano`自动化部署工具，先配置服务器上的`puma`服务，可以参考[此资料](http://blog.andolasoft.com/2013/06/how-to-configure-rails-application-with-puma-and-ngnix-on-centos.html)。

`Puma`的配置文件在`config/puma.rb`中，可根据自己的效果进行修改。

1. 修改`config/deploy/production.rb`文件，配置自己的服务器地址
2. 运行`cap production deploy`即可

> 注：需要将`config/database.yml`与`config/initializers/qiniu-rs.rb`文件放置在`<project_path>/shared/`文件夹中，以避免敏感配置文件出现在版本库中。

## 预览
可以访问 <http://blog.francistm.com> 预览前台效果。