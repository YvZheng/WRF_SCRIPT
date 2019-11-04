#!/bin/sh
# run.sh /nuist/scratch/test

ORIGIN_WPS="/nuist/p/work/weiming/weiming_zhengyu/WPS"
ORIGIN_WRF="/nuist/p/work/weiming/weiming_zhengyu/WRFV3"
if [ ! -n "$1" ];then
   echo "PATH Doesn't exist, don't run this shell, please input link path!!!"
   exit 1
fi

if [ ! -d $1 ];then
    mkdir $1
fi
mkdir "$1/WRF"
mkdir "$1/WPS"
WPS_PATH="$1/WPS"
WRF_PATH="$1/WRF"
echo "new link for WPS's path : $WPS_PATH"
echo "new link for WRF's path : $WRF_PATH"
echo "origin run WRF's path : $ORIGIN_WRF/run"
if [ -d $WRF_PATH ];then
    ln -sf $ORIGIN_WRF/run/*.exe $ORIGIN_WRF/run/*.TBL $ORIGIN_WRF/run/*.formatted\
    $ORIGIN_WRF/run/RRTM* $ORIGIN_WRF/run/ETA* $ORIGIN_WRF/run/*.tbl $ORIGIN_WRF/run/CAM* $ORIGIN_WRF/run/README* $WRF_PATH
    cp $ORIGIN_WRF/run/namelist.input $WRF_PATH
    echo "Congratulations, finish WRF!"
fi

if [ -d $WPS_PATH ];then
    ln -sf $ORIGIN_WPS/*.exe $ORIGIN_WPS/util/ $ORIGIN_WPS/ungrib/ $ORIGIN_WPS/metgrid/ $ORIGIN_WPS/geogrid/ $ORIGIN_WPS/README $WPS_PATH 
    ln -sf $ORIGIN_WPS/link_grib.csh  $ORIGIN_WPS/arch/ $ORIGIN_WPS/clean  $ORIGIN_WPS/configure $ORIGIN_WPS/compile $WPS_PATH
    cp $ORIGIN_WPS/namelist.wps $WPS_PATH
    echo "Congratulations, finish WPS!" 
fi





