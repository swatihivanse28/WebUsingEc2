#!/bin/bash
cd /home/ec2-user/Web-Application-Deploy
nohup python3 templates/index.html > app.log 2>&1 &
