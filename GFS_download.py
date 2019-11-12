import wget
import datetime
import pandas as pd
import os

forcast_time = datetime.datetime(2018, 11, 22, 18, 00) #start forcast time
forcast_hours = 12  ##forcast future hours
start_time = forcast_time - datetime.timedelta(days=1) #spin up time

ana_time = pd.date_range(start=start_time, freq="6H", end=forcast_time)
month = ana_time.strftime("%Y%m")
day = ana_time.strftime("%Y%m%d")
filename = ana_time.strftime("gfsanl_4_%Y%m%d_%H00_000.grb2")
if not os.path.exists(forcast_time.strftime("%Y%d%m%H")):
    os.mkdir(forcast_time.strftime("%Y%d%m%H"))
for i in range(len(ana_time)):
    url = "https://nomads.ncdc.noaa.gov/data/gfsanl/"+ month[i]+"/"+day[i]+"/"+filename[i]
    out_path = os.path.join(forcast_time.strftime("%Y%d%m%H"), filename[i]) 
    wget.download(url=url, out=out_path)

for ihour in range(6, forcast_hours+1, 6):
    url = "https://nomads.ncdc.noaa.gov/data/gfs4/"+ month[-1] +"/"+day[-1]+\
    "/"+ forcast_time.strftime("gfs_4_%Y%m%d_%H00_{:03d}.grb2".format(ihour)) ##forcast 6h
    out_path = os.path.join(forcast_time.strftime("%Y%d%m%H"), \
    forcast_time.strftime("gfs_4_%Y%m%d_%H00_{:03d}.grb2".format(ihour))) 
    wget.download(url=url, out=out_path)