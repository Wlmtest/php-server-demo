#i!/bin/bash

DIR=$(pwd)

echo "这是一个部署demo"

docker-compose up --build -d

if [ ! -d "projects/paydemo" ]; then
    echo "拉取phpdemo"
    mkdir -p projects/paydemo
    cd projects/paydemo
    git clone git@github.com:Wlmtest/phpdemo.git
    pwd
    cd phpdemo/upacp_demo_b2b
    mkdir resources && chmod -R 777 resources
    mkdir logs && chmod -R 777 logs
fi

echo "更新phpdemo"

cd $DIR/projects/paydemo

git pull origin
