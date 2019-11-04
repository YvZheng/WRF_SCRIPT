#/bin/bash 
WRF_DIR="/nuist/p/work/weiming/weiming_zhengyu/script_wrf/test/WRF" #should be abs path
WPS_DIR="/nuist/p/work/weiming/weiming_zhengyu/script_wrf/test/WPS" #should be abs path
cd $WPS_DIR
rm ./met_em.d*.nc
rm ./GRIBFILE*
rm ./FILE:*
rm ./geo_em.d*.nc 
cd $WRF_DIR
rm ./met_em.d*.nc
rm ./rsl.*
