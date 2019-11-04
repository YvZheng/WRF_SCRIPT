# WRF运行的主要流程
## WRF_link.sh
创建WRF和WPS的主程序的快捷方式，方便同时提交多个WRF任务

使用说明：

需要修改ORIGIN_WPS变量，修改为WPS主程序文件夹的路径

需要修改ORIGIN_WRF变量，修改为WRF主程序文件夹的路径

运行`sh WRF_link.sh LINK_PATH`，可以在LINK_PATH目录下创建WRF和WPS的快捷方式，可创建多个快捷方式方便运行多个wrf

## 修改namelist.wps
具体怎么修改省略，请参考WRF官网，#http://www2.mmm.ucar.edu/wrf/OnLineTutorial/index.php

## WPS_one_step_GFS.sh
一键WPS预处理GFS数据

使用说明：

需要修改WPS_DIR变量，该文件夹可以说WRF_link.sh创建的WRF文件夹，也可以是WPS源程序的文件夹

需要修改WRF_DIR变量， 该文件夹可以是WRF_link.sh创建的WRF文件夹，也可以是$WRF_PATH/test/em_real的文件夹

需要修改DATA变量，该文件夹是对应nanmelist.wps的日期的GFS数据

运行`sh WPS_one_step_GFS.sh`可以完成WPS的预处理

## 修改namelist.input
具体修改请参考WRF官网#http://www2.mmm.ucar.edu/wrf/OnLineTutorial/index.php

## 运行./real.exe
生成wrf.exe运行所需要的数据

##（可选, WRF-CHEM）加入排放源数据
将生成的排放源数据拷贝或链接到当前文件夹

## 提交submit.job的任务脚本 （如果使用nuist hpc）
运行 `qsub submit.job`

## clean_data.sh

使用说明：

需要修改WPS_DIR变量，该文件夹可以说WRF_link.sh创建的WRF文件夹，也可以是WPS源程序的文件夹

需要修改WRF_DIR变量， 该文件夹可以是WRF_link.sh创建的WRF文件夹，也可以是$WRF_PATH/test/em_real的文件夹

运行`sh clean_data.sh`可以清空wrf产生的文件
