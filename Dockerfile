FROM benchao/arpt:v2.0.6



CMD wget https://github.com/666wcy/final_bot/raw/main/start.sh -O start.sh && chmod 0777 start.sh && bash start.sh