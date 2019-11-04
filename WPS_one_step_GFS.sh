#!/bin/sh
# useage ./run.sh "PATH/*.grb2"
WRF_DIR="/nuist/p/work/weiming/weiming_zhengyu/work/wrf_job/WRF01/WRF" #should be abs path 
WPS_DIR="/nuist/p/work/weiming/weiming_zhengyu/work/wrf_job/WRF01/WPS" #should be abs path
DATA="/nuist/p/work/weiming/weiming_zhengyu/download/GFS/20181128/*.grb2" #should be abs path
if [ ! -n $WRF_DIR ];then
   echo "WRF dir is not exist!!!"
   exit 1
fi
if [ ! -n $WPS_DIR ];then
   echo "WPS dir is not exist!!!"
   exit 1
fi
cd $WPS_DIR
echo "now dir is : " `pwd`
echo "met data list : $1"
./geogrid.exe
ln -sf ./ungrib/Variable_Tables/Vtable.GFS ./Vtable
./link_grib.csh $DATA
./ungrib.exe
./metgrid.exe
ln -sf `pwd`/met_em.d*.nc $WRF_DIR


