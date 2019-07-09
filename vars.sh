#!/bin/bash

# CRON time to run session-start
STARTCRON="0 21 * * *" # 9 PM 
# CRON time to run session-end 
STOPCRON="0 23 * * *"  # 11 PM
# CRON time to send notification to players
NOTIFY_TIME="55 20 * * 2"      # 6:45 TUESDAY
NOTIFY_MESSAGE="Server coming online in 5 minutes!"
# CONSTANTS
S3BUCKET="minecraft-server-cg"
# LOCATION of various things on disk
APPDIR=/opt/mc
LOGDIR=/var/log/mc
LOGFILE=$LOGDIR/opt.log
BACKUP_NAME="worlddata.zip"
# Whether to start on a timer or just at boot
# If autostart is true, server will run indefinitely.
# Else server will run on cron timer
AUTOSTART="true"
# Name for server session
SERVER_SESSION_NAME="mc"
# APT dependencies
DEPENDENCIES="openjdk-8-jre curl unzip awscli tmux cron zip"
# Route53 hosted zone
ROUTE53_ZONE="Z14O8UHZP5Z5N4"
ROUTE53_DOMAIN="boyztown.net"
# Enabled Plugins.  If the plugin is in this list, it should have a JAR available in s3://$S3BUCKET/plugins/
# It should also have a config folder in plugins/
ENABLED_PLUGINS=""
