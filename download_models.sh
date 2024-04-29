for t in hi en+hi en ta
do 
    wget https://github.com/AI4Bharat/Indic-TTS/releases/download/v1-checkpoints-release/"$t".zip
    unzip "$t".zip -d inference/checkpoints
    rm "$t".zip
done

mkdir inference/models
mkdir inference/models/v1
mkdir inference/output_audios

cp -r inference/checkpoints/* inference/models/v1