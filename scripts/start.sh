#!/bin/bash
cd /home/ec2-user/WebUsingEc2
nohup python3 templates/index.html > app.log 2>&1 &
