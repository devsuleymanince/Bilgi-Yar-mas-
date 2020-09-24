import 'package:bilgi_yarismasi/main.dart';
import 'Soru.dart';





class TestVeri{

  int _soruIndex = 0; // başındaki alt çizgi kapsüllemeye yarar

  int _skor = 0;

  bool soruBitti = false;

  BilgiTesti bilgiTesti = BilgiTesti();

  List<Soru> _soruBankasi=[
    Soru(soruMetni: 'Ahtapotların 3 tane kalbi vardır.', soruYaniti: true),
    Soru(soruMetni: 'İran''ın yüz ölçümü Türkiye''nin yüz ölçümünden büyüktür.', soruYaniti: true),
    Soru(soruMetni: 'Barcelona, İspanya''nın başkentidir.', soruYaniti: false),
    Soru(soruMetni: 'Avrupa''nın en kalabalık şehri İstanbul''dur.', soruYaniti: true),
    Soru(soruMetni: 'Isı termometre ile ölçülür', soruYaniti: false),
    Soru(soruMetni: 'Ankara bir dönem Selçuklu Devleti''nin başkentiydi', soruYaniti: false),
    Soru(soruMetni: 'Aynı anda nefes alman ve yutkunman mümkün değildir.', soruYaniti: true)
  ];



  String getSoruMetni (){
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti (){
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru(){
    if(_soruIndex +1 < _soruBankasi.length){ // soruIndex 0'dan başladığı için 1 ekledim çünkü length 1'den başlar saymaya
      _soruIndex++;
    }else{
      soruBitti = true;
    }
  }

  int getSkor(){
    return _skor;
  }

  void setSkor(){
    _skor++;
  }

}
