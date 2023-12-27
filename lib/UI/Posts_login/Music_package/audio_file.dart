/*import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AudioFile extends StatefulWidget {
  final  AudioPlayer advancedPlayer;
  final String audioPath;
  const AudioFile({Key? key, required AudioPlayer this.advancedPlayer, required this.audioPath}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
 Duration _duration = new Duration();
 Duration _position = new Duration();
 bool isPlaying= false;
 bool isPaused= false;
 bool isRepeat= false;
 Color color=Colors.black;
 List<IconData> _icons =[
   Icons.play_circle_fill,
   Icons.pause_circle_filled,
 ];
@override
void initState(){
  super.initState();
  this.widget.advancedPlayer.onDurationChanged.listen((d){ setState(() {
    _duration=d;
  });});
  this.widget.advancedPlayer.onPositionChanged.listen((p){setState(() {
    _position=p;
  });});
  this.widget.advancedPlayer.setSourceUrl(this.widget.audioPath);
  this.widget.advancedPlayer.onPlayerComplete.listen((event) {
    setState(() {
    _position = Duration(seconds: 0);
    if(isRepeat==true){
      isPlaying=true;
    }else{
    isPlaying=false;
    isRepeat=false;
    }
  });
  });
}
Widget btnStart(){
  return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying==false?Icon(_icons[0],size: 50,):Icon(_icons[1],size: 50,),
    onPressed: (){
        if(isPlaying=false){
    this.widget.advancedPlayer.play(this.widget.audioPath as Source);
    setState(() {
      isPlaying=true;
    });
        }
        else if (isPlaying==true){
          setState(() {
            isPlaying=false;
            this.widget.advancedPlayer.play(this.widget.audioPath as Source);
          });
        }
  },);
}
Widget slider(){
  return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value){
    setState(() {
      changeToSecond(value.toInt());
      value = value;
    });
  });
}
void changeToSecond(int second){
  Duration newDuration = Duration(seconds: second);
  this.widget.advancedPlayer.seek(newDuration);
}
Widget btnFast(){
  return
      IconButton(onPressed: (){
        this.widget.advancedPlayer!.setPlaybackRate(1.5);
      }, icon: ImageIcon(
        AssetImage('img/forward.png'),
        size: 15,
        color: Colors.black,
      )
      );
}
 Widget btnSlow(){
   return
     IconButton(onPressed: (){
       this.widget.advancedPlayer!.setPlaybackRate(0.5);
     }, icon: ImageIcon(
       AssetImage('img/backword.png'),
       size: 15,
       color: Colors.black,
     ));
 }
Widget btnLoop(){
  return IconButton(onPressed: (){},
      icon: ImageIcon(
          AssetImage('img/loop.png'),
          size: 15,
        color:Colors.black
      )
  );
}
 Widget btnRepeat(){
   return IconButton(onPressed: (){
     if(isRepeat==false){
       this.widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
       setState(() {
         isRepeat=true;
        color=Colors.blue;
       });
     }else if(isRepeat==true){
       this.widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
       setState(() {
         isPlaying=false;
         color=Colors.black;
       });
     }
   },
       icon: ImageIcon(
           AssetImage('img/repeat.png'),
           size: 15,
           color:color,
       )
   );
 }
 Widget loadAsset(){
   return Container(
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         btnRepeat(),
         btnSlow(),
         btnStart(),
         btnFast(),
         btnLoop(),
       ],
     ),
   );
 }
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_position.toString().split(".")[0],style: TextStyle(fontSize: 16),),
              Text(_duration.toString().split(".")[0],style: TextStyle(fontSize: 16),),
            ],
          ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}*/
