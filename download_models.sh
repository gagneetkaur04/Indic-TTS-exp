for t in hi en+hi en ta
do 
    wget https://github.com/AI4Bharat/Indic-TTS/releases/download/v1-checkpoints-release/"$t".zip
    unzip "$t".zip -d inference/checkpoints
    rm "$t".zip
done

cp -r inference/checkpoints/* models/v1