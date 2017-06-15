#!/system/bin/sh
#Original author: Alcolawl
#Settings By: RogerF81
#Device: LG G4 (h815/h811)
#Codename: LoG
#SoC: Snapdragon 808
#Build Status: Stable
#Version: 2.1
#Last Updated: 06/03/2017
#Credits: @Alcolawl @soniCron @Asiier @Freak07 @Mostafa Wael @Senthil360 @TotallyAnxious @Eliminater74 @RenderBroken @ZeroInfinity @kyuubi10 @ivicask
sleep 60
echo "\m/"
echo "Let's go"
#Disable BCL
if [ -e "/sys/devices/soc/soc:qcom,bcl/mode" ]; then
echo Disabling BCL and Removing Perfd
	chmod 644 /sys/devices/soc/soc:qcom,bcl/mode
	echo -n disable > /sys/devices/soc/soc:qcom,bcl/mode
fi
if [ -e "/sys/devices/soc.0/qcom,bcl.67/mode" ]; then
	echo disable > /sys/devices/soc.0/qcom,bcl.67/mode
	echo -n disable > /sys/devices/soc.0/qcom,bcl.67/mode
fi
if [ -e "/data/system/perfd" ]; then
	stop perfd
fi
if [ -e "/data/system/perfd/default_values" ]; then
	rm /data/system/perfd/default_values
fi
chmod 644 /sys/devices/system/cpu/online
echo 0-5 > /sys/devices/system/cpu/online
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > //sys/devices/system/cpu/cpu4/online
echo 1 > //sys/devices/system/cpu/cpu5/online
chmod 444 /sys/devices/system/cpu/online
#LITTLE cluster
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1440000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#Tweak LITTLE cluster
echo 76 600000:40 672000:58 787200:82 960000:89 1248000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 356940 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 20000 460000:0 600000:60000 672000:100000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 400 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction

#big cluster
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
#Tweak big cluster
echo 76 633000:48 768000:57 1248000:74 1440000:86 1824000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 178470 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 10000 1440000:120000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 400 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/enable_prediction
echo Interactive governor tweaked
#Disable input boost
if [ -e "/sys/kernel/cpu_input_boost" ]; then
	chmod 644 /sys/kernel/cpu_input_boost/enable
	echo 0 > /sys/kernel/cpu_input_boost/enable
	chmod 644 /sys/kernel/cpu_input_boost/ib_duration_ms
	echo 0 > /sys/kernel/cpu_input_boost/ib_duration_ms
	chmod 644 /sys/kernel/cpu_input_boost/ib_freqs
	echo "0 0" > /sys/kernel/cpu_input_boost/ib_freqs
fi
if [ -e "/sys/module/cpu_boost" ]; then
	chmod 644 /sys/module/cpu_boost/parameters/input_boost_enabled
	echo 0 > /sys/module/cpu_boost/parameters/input_boost_enabled
	chmod 644 /sys/module/cpu_boost/parameters/input_boost_freq
	echo 0:0 1:0 2:0 3:0 > /sys/module/cpu_boost/parameters/input_boost_freq
	chmod 644 /sys/module/cpu_boost/parameters/boost_ms
	echo 0 > /sys/module/cpu_boost/parameters/boost_ms
	chmod 644 /sys/module/cpu_boost/parameters/input_boost_ms
	echo 0 > /sys/module/cpu_boost/parameters/input_boost_ms
fi
#Disable TouchBoost
echo Disabling TouchBoost
if [ -e "/sys/module/msm_performance/parameters/touchboost" ]; then
	chmod 644 /sys/module/msm_performance/parameters/touchboost
	echo 0 > /sys/module/msm_performance/parameters/touchboost
fi
#Further settings
echo Tweaking HMP Scheduler
chmod 644 /sys/module/workqueue/parameters/power_efficient
echo Y > /sys/module/workqueue/parameters/power_efficient 
echo 68 > /proc/sys/kernel/sched_upmigrate
echo 33 > /proc/sys/kernel/sched_downmigrate
echo 20 > /proc/sys/kernel/sched_small_wakee_task_load
#echo 25 > /proc/sys/kernel/sched_init_task_load
if [ -e "/proc/sys/kernel/sched_heavy_task" ]; then
    echo 79 > /proc/sys/kernel/sched_heavy_task
fi
if [ -e "/proc/sys/kernel/sched_enable_power_aware" ]; then
    echo 1 > /proc/sys/kernel/sched_enable_power_aware
fi
echo 1 > /proc/sys/kernel/sched_enable_thread_grouping
echo 30 > /proc/sys/kernel/sched_big_waker_task_load
#if [ -e "/proc/sys/kernel/sched_small_task" ]; then
#	echo 7 > /proc/sys/kernel/sched_small_task
echo 2 > /proc/sys/kernel/sched_window_stats_policy
echo 4 > /proc/sys/kernel/sched_ravg_hist_size
echo 9 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 3 > /proc/sys/kernel/sched_spill_nr_run
echo 74 > /proc/sys/kernel/sched_spill_load
echo 1 > /proc/sys/kernel/sched_enable_thread_grouping
echo 0 > /proc/sys/kernel/sched_restrict_cluster_spill
echo 110 > /proc/sys/kernel/sched_wakeup_load_threshold
echo 30 > /proc/sys/kernel/sched_rr_timeslice_ms
echo 950000 > /proc/sys/kernel/sched_rt_runtime_us
echo 1000000 > /proc/sys/kernel/sched_rt_period_us
if [ -e "/proc/sys/kernel/sched_migration_fixup" ]; then
	echo 1 > /proc/sys/kernel/sched_migration_fixup
fi
if [ -e "/proc/sys/kernel/sched_freq_dec_notify" ]; then
	echo 410000 > /proc/sys/kernel/sched_freq_dec_notify
fi
if [ -e "/proc/sys/kernel/sched_freq_inc_notify" ]; then
	echo 610000 > /proc/sys/kernel/sched_freq_inc_notify
fi
if [ -e "/proc/sys/kernel/sched_boost" ]; then
	echo 0 > /proc/sys/kernel/sched_boost
fi
#I/0 Tweaks
echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
echo "bfq" > /sys/block/mmcblk0/queue/scheduler
echo 16384 > /sys/block/mmcblk0/queue/iosched/back_seek_max
echo 1 > /sys/block/mmcblk0/queue/iosched/back_seek_penalty
echo 250 > /sys/block/mmcblk0/queue/iosched/fifo_expire_async
echo 120 > /sys/block/mmcblk0/queue/iosched/fifo_expire_sync
echo 1 > /sys/block/mmcblk0/queue/iosched/low_latency
echo 0 > /sys/block/mmcblk0/queue/iosched/max_budget
echo 4 > /sys/block/mmcblk0/queue/iosched/max_budget_async_rq
echo 0 > /sys/block/mmcblk0/queue/iosched/slice_idle
echo 40 > /sys/block/mmcblk0/queue/iosched/timeout_async
echo 120 > /sys/block/mmcblk0/queue/iosched/timeout_sync
echo 20 > /sys/block/mmcblk0/queue/iosched/wr_coeff
echo 7000 > /sys/block/mmcblk0/queue/iosched/wr_max_softrt_rate
echo 2250 > /sys/block/mmcblk0/queue/iosched/wr_max_time
echo 2000 > /sys/block/mmcblk0/queue/iosched/wr_min_idle_time
echo 500 > /sys/block/mmcblk0/queue/iosched/wr_min_inter_arr_async
echo 300 > /sys/block/mmcblk0/queue/iosched/wr_rt_max_time
echo 0 > /sys/block/mmcblk0/queue/add_random
echo 0 > /sys/block/mmcblk0/queue/iostats
echo 1 > /sys/block/mmcblk0/queue/nomerges
echo 0 > /sys/block/mmcblk0/queue/rotational
echo 1 > /sys/block/mmcblk1/queue/rq_affinity
echo 1024 > /sys/block/mmcblk1/bdi/read_ahead_kb
echo "bfq" > /sys/block/mmcblk1/queue/scheduler
echo 16384 > /sys/block/mmcblk1/queue/iosched/back_seek_max
echo 1 > /sys/block/mmcblk1/queue/iosched/back_seek_penalty
echo 250 > /sys/block/mmcblk1/queue/iosched/fifo_expire_async
echo 120 > /sys/block/mmcblk1/queue/iosched/fifo_expire_sync
echo 1 > /sys/block/mmcblk1/queue/iosched/low_latency
echo 0 > /sys/block/mmcblk1/queue/iosched/max_budget
echo 4 > /sys/block/mmcblk1/queue/iosched/max_budget_async_rq
echo 0 > /sys/block/mmcblk1/queue/iosched/slice_idle
echo 40 > /sys/block/mmcblk1/queue/iosched/timeout_async
echo 120 > /sys/block/mmcblk1/queue/iosched/timeout_sync
echo 20 > /sys/block/mmcblk1/queue/iosched/wr_coeff
echo 7000 > /sys/block/mmcblk1/queue/iosched/wr_max_softrt_rate
echo 2250 > /sys/block/mmcblk1/queue/iosched/wr_max_time
echo 2000 > /sys/block/mmcblk1/queue/iosched/wr_min_idle_time
echo 500 > /sys/block/mmcblk1/queue/iosched/wr_min_inter_arr_async
echo 300 > /sys/block/mmcblk1/queue/iosched/wr_rt_max_time
echo 0 > /sys/block/mmcblk1/queue/add_random
echo 0 > /sys/block/mmcblk1/queue/iostats
echo 1 > /sys/block/mmcblk1/queue/nomerges
echo 0 > /sys/block/mmcblk1/queue/rotational
echo 1 > /sys/block/mmcblk1/queue/rq_affinity
echo TCP tweaks
echo westwood > /proc/sys/net/ipv4/tcp_congestion_control
echo 2 > /proc/sys/net/ipv4/tcp_ecn
echo 1 > /proc/sys/net/ipv4/tcp_dsack
echo 0 > /proc/sys/net/ipv4/tcp_low_latency
echo 1 > /proc/sys/net/ipv4/tcp_timestamps
echo 1 > /proc/sys/net/ipv4/tcp_sack
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling
## Wakelocks
if [ -e "/sys/module/bcmdhd/parameters/wlrx_divide" ]; then
	echo 10 > /sys/module/bcmdhd/parameters/wlrx_divide
fi
if [ -e "/sys/module/bcmdhd/parameters/wlctrl_divide" ]; then
	echo 10 > /sys/module/bcmdhd/parameters/wlctrl_divide
fi
if [ -e "/sys/module/wakeup/parameters/enable_wlan_rx_wake_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_wlan_rx_wake_ws
fi
if [ -e "/sys/module/wakeup/parameters/enable_wlan_ctrl_wake_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_wlan_ctrl_wake_ws
fi
if [ -e "/sys/module/wakeup/parameters/enable_wlan_wake_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_wlan_wake_ws
fi
if [ -e "/sys/module/wakeup/parameters/enable_bluedroid_timer_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_bluedroid_timer_ws
fi
if [ -e "/sys/module/wakeup/parameters/enable_ipa_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_ipa_ws
fi
if [ -e "/sys/module/wakeup/parameters/enable_wlan_extscan_wl_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_wlan_extscan_wl_ws
fi
if [ -e "/sys/module/wakeup/parameters/enable_qcom_rx_wakelock_ws" ]; then
	echo N > /sys/module/wakeup/parameters/enable_qcom_rx_wakelock_ws
fi
## Thermal
if [ -e "/sys/module/msm_thermal" ]; then
	chmod 644 /sys/module/msm_thermal/parameters/temp_threshold
	echo 38 > /sys/module/msm_thermal/parameters/temp_threshold
	echo 1 > /sys/module/msm_thermal/core_control/enabled
	chmod 644 /sys/module/msm_thermal/parameters/enabled
	echo N > /sys/module/msm_thermal/parameters/enabled
fi
## zRam
if [ -e "/sys/block/zram0" ]; then
	swapoff /dev/block/zram0 > /dev/null 2>&1
	echo 1 > /sys/block/zram0/reset
	echo lz4 > /sys/block/zram0/comp_algorithm
	echo 0 > /sys/block/zram0/disksize
	echo 0 > /sys/block/zram0/queue/add_random 
	echo 0 > /sys/block/zram0/queue/iostats 
	echo 2 > /sys/block/zram0/queue/nomerges 
	echo 0 > /sys/block/zram0/queue/rotational 
	echo 1 > /sys/block/zram0/queue/rq_affinity
	echo 8 > /sys/block/zram0/max_comp_streams
	chmod 644 /sys/block/zram0/disksize
	echo 1073741824 > /sys/block/zram0/disksize
	mkswap /dev/block/zram0 > /dev/null 2>&1
	swapon /dev/block/zram0 > /dev/null 2>&1
fi
## Vibration
chmod 644 /sys/class/timed_output/vibrator/voltage_level
echo 710 > /sys/class/timed_output/vibrator/voltage_level
chmod 444 /sys/class/timed_output/vibrator/voltage_level
## FS
echo 10 > /proc/sys/fs/lease-break-time
echo 32768 > /proc/sys/fs/inotify/max_queued_events
echo 256 > /proc/sys/fs/inotify/max_user_instances
echo 16384 > /proc/sys/fs/inotify/max_user_watches
## VM
echo 500 > /proc/sys/vm/dirty_expire_centisecs
echo 3000 > /proc/sys/vm/dirty_writeback_centisecs
echo 0 > /proc/sys/vm/oom_kill_allocating_task
echo 0 > /proc/sys/vm/page-cluster
echo 60 > /proc/sys/vm/swappiness
echo 100 > /proc/sys/vm/vfs_cache_pressure
echo 20 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 4096 > /proc/sys/vm/min_free_kbytes
echo 128 > /proc/sys/kernel/random/read_wakeup_threshold
echo 896 > /proc/sys/kernel/random/write_wakeup_threshold
## Block rpmb
echo 0 > /sys/block/mmcblk0rpmb/queue/add_random
echo 0 > /sys/block/mmcblk0rpmb/queue/iostats
echo 1 > /sys/block/mmcblk0rpmb/queue/nomerges
echo 0 > /sys/block/mmcblk0rpmb/queue/rotational
echo 1 > /sys/block/mmcblk0rpmb/queue/rq_affinity
echo "bfq" > /sys/block/mmcblk0rpmb/queue/scheduler
echo 16384 > /sys/block/mmcblk0rpmb/queue/iosched/back_seek_max
echo 1 > /sys/block/mmcblk0rpmb/queue/iosched/back_seek_penalty
echo 250 > /sys/block/mmcblk0rpmb/queue/iosched/fifo_expire_async
echo 120 > /sys/block/mmcblk0rpmb/queue/iosched/fifo_expire_sync
echo 1 > /sys/block/mmcblk0rpmb/queue/iosched/low_latency
echo 0 > /sys/block/mmcblk0rpmb/queue/iosched/max_budget
echo 4 > /sys/block/mmcblk0rpmb/queue/iosched/max_budget_async_rq
echo 0 > /sys/block/mmcblk0rpmb/queue/iosched/slice_idle
echo 40 > /sys/block/mmcblk0rpmb/queue/iosched/timeout_async
echo 120 > /sys/block/mmcblk0rpmb/queue/iosched/timeout_sync
echo 20 > /sys/block/mmcblk0rpmb/queue/iosched/wr_coeff
echo 7000 > /sys/block/mmcblk0rpmb/queue/iosched/wr_max_softrt_rate
echo 2250 > /sys/block/mmcblk0rpmb/queue/iosched/wr_max_time
echo 2000 > /sys/block/mmcblk0rpmb/queue/iosched/wr_min_idle_time
echo 500 > /sys/block/mmcblk0rpmb/queue/iosched/wr_min_inter_arr_async
echo 300 > /sys/block/mmcblk0rpmb/queue/iosched/wr_rt_max_time
## Block loop
for i in /sys/block/loop*; do
   echo 0 > $i/queue/add_random
   echo 0 > $i/queue/iostats
   echo 1 > $i/queue/nomerges
   echo 0 > $i/queue/rotational
   echo 1 > $i/queue/rq_affinity
done
## Block ram
for j in /sys/block/ram*; do
   echo 0 > $j/queue/add_random
   echo 0 > $j/queue/iostats
   echo 1 > $j/queue/nomerges
   echo 0 > $j/queue/rotational
   echo 1 > $j/queue/rq_affinity
done
## Charging 
echo "0" > /sys/kernel/fast_charge/force_fast_charge 
## Filesystem
#busybox mount -o remount,noatime,barrier=0,nodiratime /sys
#busybox mount -o remount,noatime,noauto_da_alloc,nodiratime,barrier=0,nobh /system
#busybox mount -o remount,noatime,noauto_da_alloc,nosuid,nodev,nodiratime,barrier=0,nobh /data
#busybox mount -o remount,noatime,noauto_da_alloc,nosuid,nodev,nodiratime,barrier=0,nobh /cache
fstrim -v /data
fstrim -v /cache
fstrim -v /system
fstrim -v /preload
echo ----------------------------------------------------
echo Settings Successfully Applied. You may now tweak them further in EX Kernel Manager
echo ----------------------------------------------------

echo LoG is applied
