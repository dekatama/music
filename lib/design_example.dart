import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads_service.dart';

class DesignExample extends StatefulWidget {
  @override
  _DesignExampleState createState() => _DesignExampleState();
}

class _DesignExampleState extends State<DesignExample> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  final SwiperController swiperController = SwiperController();

  bool isLoaded;

  double screenWidth = 0;
  double screenHeight = 0;
  Color highlightColor = Color(0xff35738a);
  List<Audio> audioList = [
    Audio('assets/Band.mp3',
        metas: Metas(
            title: 'Karena Wanita Ingin Dimengerti',
            artist: 'Ada Band',
            image:
                MetasImage.asset('assets/Karena Wanita Ingin Dimengerti.jpg'))),
    Audio('assets/Dealova.mp3',
        metas: Metas(
            title: 'Dealova',
            artist: 'Once',
            image: MetasImage.asset('assets/dealova.jpg'))),
    Audio('assets/pupus.mp3',
        metas: Metas(
            title: 'Pupus',
            artist: 'Dewa 19',
            image: MetasImage.asset('assets/Pupus.jpg'))),
    Audio('assets/Dewa19.mp3',
        metas: Metas(
            title: 'Cinta Kan Membawamu',
            artist: 'Dewa 19',
            image: MetasImage.asset('assets/Cinta Kan Membawamu.jpg'))),
    Audio('assets/Rumah.mp3',
        metas: Metas(
            title: 'Rumah Kita',
            artist: 'God Bless',
            image: MetasImage.asset('assets/Rumah Kita.jpg'))),
    Audio('assets/Sempurna.mp3',
        metas: Metas(
            title: 'Sempurna',
            artist: 'Andra N The Backbone',
            image: MetasImage.asset('assets/Sempurna.jpg'))),
    Audio('assets/Sepanjang.mp3',
        metas: Metas(
            title: 'Sepanjang Jalan Kenangan',
            artist: 'Sepanjang Jalan Kenangan',
            image: MetasImage.asset('assets/Sepanjang Jalan Kenangan.jpg'))),
    Audio('assets/Sheila.mp3',
        metas: Metas(
            title: 'Sebuah Kisah Klasik',
            artist: 'Sheila On 7',
            image: MetasImage.asset('assets/Sebuah Kisah Klasik.jpg'))),
    Audio('assets/ST12.mp3',
        metas: Metas(
            title: 'Saat Terakhir',
            artist: 'ST 12',
            image: MetasImage.asset('assets/Saat Terakhir.jpg'))),
    Audio('assets/wali.mp3',
        metas: Metas(
            title: 'Yank',
            artist: 'Wali',
            image: MetasImage.asset('assets/Yank.jpg'))),
    Audio('assets/Bon.mp3',
        metas: Metas(
            title: 'Its My Life',
            artist: 'Bon Jovi',
            image: MetasImage.asset('assets/Its My Life.jpg'))),
    Audio('assets/Buried.mp3',
        metas: Metas(
            title: 'Buried Alive',
            artist: 'Avenged Sevenfold',
            image: MetasImage.asset('assets/Buried Alive.jpg'))),
    Audio('assets/Eric.mp3',
        metas: Metas(
            title: 'Wonderful Tonight',
            artist: 'Eric Clapton',
            image: MetasImage.asset('assets/Wonderful Tonight.jpg'))),
    Audio('assets/InsyaAllah.mp3',
        metas: Metas(
            title: 'Insya Allah',
            artist: 'Maher Zain',
            image: MetasImage.asset('assets/InsyaAllah.jpg'))),
    Audio('assets/Lily.mp3',
        metas: Metas(
            title: 'Lily',
            artist: 'Alan Walker',
            image: MetasImage.asset('assets/Lily.jpg'))),
    Audio('assets/Heart.mp3',
        metas: Metas(
            title: 'My Heart Will Go On',
            artist: 'OST Titanic',
            image: MetasImage.asset('assets/My Heart Will Go On.jpg'))),
    Audio('assets/Numb.mp3',
        metas: Metas(
            title: 'Numb',
            artist: 'Linkin Park',
            image: MetasImage.asset('assets/Numb.jpg'))),
    Audio('assets/Queen.mp3',
        metas: Metas(
            title: 'Bohemian Rhapsody',
            artist: 'Queen',
            image: MetasImage.asset('assets/Bohemian Rhapsody.jpg'))),
    Audio('assets/Sadness.mp3',
        metas: Metas(
            title: 'Sadness and Sorrow',
            artist: 'Ost Naruto',
            image: MetasImage.asset('assets/Sadness and Sorrow.jpg'))),
    Audio('assets/We.mp3',
        metas: Metas(
            title: 'We Are the Champions',
            artist: 'Queen',
            image: MetasImage.asset('assets/We Are the Champions.jpg'))),
    Audio('assets/Sweet Child.mp3',
        metas: Metas(
            title: 'Sweet Child O Mine',
            artist: 'GNR',
            image: MetasImage.asset('assets/Sweet Child.jpg'))),
    Audio('assets/Hotel California.mp3',
        metas: Metas(
            title: 'Hotel California',
            artist: 'Eagles',
            image: MetasImage.asset('assets/Hotel California.jpg'))),
    Audio('assets/Pandemi.mp3',
        metas: Metas(
            title: 'Pandemi',
            artist: 'Pandemi',
            image: MetasImage.asset('assets/pandemi.jpg'))),
  ];

  @override
  void initState() {
    super.initState();
    setupPlayList();
  }

  void setupPlayList() async {
    await audioPlayer.open(Playlist(audios: audioList),
        autoStart: false, loopMode: LoopMode.playlist);
  }

  Widget ads(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      height: 50,
      child: AdWidget(
        ad: AdManager.createBannerAd()..load(),
      ),
    );
  }

  Widget swiper(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.50,
      child: Swiper(
        controller: swiperController,
        itemCount: audioList.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              audioList[index].metas.image.path,
              fit: BoxFit.cover,
            ),
          );
        },
        onIndexChanged: (newIndex) {
          audioPlayer.playlistPlayAtIndex(newIndex);
        },
        viewportFraction: 0.80,
        scale: 0.9,
      ),
    );
  }

  Widget titleText(RealtimePlayingInfos realtimePlayingInfos) {
    return Text(
      realtimePlayingInfos.current.audio.audio.metas.title,
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget artistText(RealtimePlayingInfos realtimePlayingInfos) {
    return Text(
      realtimePlayingInfos.current.audio.audio.metas.artist,
      style: TextStyle(fontSize: 20, color: Colors.green[600]),
    );
  }

  Widget slider(RealtimePlayingInfos realtimePlayingInfos) {
    return SliderTheme(
        data: SliderThemeData(
            thumbColor: highlightColor,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 1),
            activeTrackColor: highlightColor,
            inactiveTrackColor: Colors.grey[800],
            overlayColor: Colors.transparent),
        child: Slider.adaptive(
            value: realtimePlayingInfos.currentPosition.inSeconds.toDouble(),
            min: 0,
            max: realtimePlayingInfos.duration.inSeconds.toDouble(),
            onChanged: (value) {
              audioPlayer.seek(Duration(seconds: value.toInt()));
            }));
  }

  Widget playBar(RealtimePlayingInfos realtimePlayingInfos) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transformString(realtimePlayingInfos.currentPosition.inSeconds),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous_rounded),
                onPressed: () => swiperController.previous(),
                iconSize: screenHeight * 0.06,
                color: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Container(
                decoration: BoxDecoration(
                    color: highlightColor, shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(realtimePlayingInfos.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded),
                  onPressed: () => audioPlayer.playOrPause(),
                  iconSize: screenHeight * 0.06,
                  color: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
              IconButton(
                icon: Icon(Icons.skip_next_rounded),
                onPressed: () => swiperController.next(),
                iconSize: screenHeight * 0.06,
                color: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
          Text(
            transformString(realtimePlayingInfos.duration.inSeconds),
            style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    );
  }

  String transformString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
    swiperController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff16161e),
      body: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
        if (realtimePlayingInfos != null) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              ads(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.05),
              swiper(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.05),
              titleText(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.01),
              artistText(
                realtimePlayingInfos,
              ),
              SizedBox(height: screenHeight * 0.03),
              slider(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.03),
              playBar(realtimePlayingInfos),
            ],
          );
        } else {
          return Column();
        }
      }),
    );
  }
}
