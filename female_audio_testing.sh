hindi='भुवाली की इस छोटी-सी कॉटेज में लेटा-लेटा मैं सामने के पहाड़ देखता हूँ. पानी-भरे, सूखे-सूखे बादलों के घेरे देखता हूँ. बिना आँखों के झटक-झटक जाती धुंध के निष्फल प्रयास देखता हूँ और फिर लेटे-लेटे अपने तन का पतझार देखता हूँ. सामने पहाड़ के रूखे हरियाले में रामगढ़ जाती हुई पगडंडी मेरी बाँह पर उभरी लंबी नस की तरह चमकती है. पहाड़ी हवाएँ मेरी उखड़ी-उखड़ी साँस की तरह कभी तेज़, कभी हौले, इस खिड़की से टकराती हैं; पलंग पर बिछी चद्दर और ऊपर पड़े कंबल से लिपटी मेरी देह चूने की-सी कच्ची तह की तरह घुल-घुल जाती है. '

english='Dr Tomas Streyer looked around the control room at his team of scientists and engineers. He was excited and frightened but he tried to seem calm. In a few minutes, they might start to discover something amazing: how the universe began. He looked out of the window at the beautiful blue summer sky and tried to breathe slowly.'Ready,' he said. He pressed the first button and the complicated computers and machines came to life. 'Set,' he said. He pressed the second button and switched on the large particle accelerator that lay under the towns and fields of Switzerland.'

tamil='நள்ளிரவு அழைப்பு ஒன்றின்போதுதான் க்ளூசின் மொழி தனக்குப் புரிவதைக் குமராசுரன் உணர்ந்தான். அலுவலக அச்சம் மிகுந்திருந்த அன்று சீக்கிரம் உண்டுவிட்டுப் படுக்கையறைக் கதவைத் தாழிட்டுப் படுத்துக்கொண்டான். உறக்கத்திற்கு அடரிருள் அவனுக்கு வேண்டும். வீதி விளக்கு வெளிச்சம் உள்ளே நுழையக்கூடாது என்று சாளரங்களுக்குத் திரையிட்டு வைத்திருந்தான். அதுநாள் வரை இல்லாத அளவு இருள் பயமூட்டியது.'

hinglish='Hello mera naam ram hai. Mai fifth class mein padhta hun.'

text='Hi'

for lang in hi en+hi en ta; do
    if [ "$lang" == "hi" ]; then text="$hindi"
    elif [ "$lang" == "en+hi" ]; then text="$hinglish"
    elif [ "$lang" == "en" ]; then text="$english"
    elif [ "$lang" == "ta" ]; then text="$tamil"
    fi
    python3 -m TTS.bin.synthesize --text "$text" \
    --model_path checkpoints/"$lang"/fastpitch/best_model.pth \
    --config_path checkpoints/"$lang"/fastpitch/config.json \
    --vocoder_path checkpoints/"$lang"/hifigan/best_model.pth \
    --vocoder_config_path checkpoints/"$lang"/hifigan/config.json \
    --speaker_idx female \
    --out_path "./inference/output_audios/${lang}_male.wav"
done