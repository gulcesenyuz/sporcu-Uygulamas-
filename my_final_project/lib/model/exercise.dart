import 'package:flutter/material.dart';

class Exercise {
  String title;
  String description;
  String localVideo;
  String information;
  Exercise(
      {@required this.title,
      @required this.description,
      @required this.localVideo,
      @required this.information});
}

List<Exercise> exerciseList = [
  Exercise(
      title: 'Barfiks',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/barfiks.mp4',
      information:
          'Güç – kuvvet, esneklik ve dayanıklılığın kendini gösterdiği harekettir. '
          'Genel itibariyle yüksek bir noktaya asılan bar ve ya çubuğa asılarak vücudu kollarla yukarı doğru çekme hareketidir.'
          'Barfiks zor bir hareket olup, kas gelişimi ve kondisyon için oldukça yararlıdır.'
          'Özellikle sırt, kol ve omuzları çalıştırır. '
          'Kas ve kuvvet getirisi de oldukça fazladır. '
          'Bunun yanında özellikle gelişme çağındaki çocuklarda boy uzaması içinde tavsiye edilen ve yapılan bir harekettir.'),
  Exercise(
      title: 'Avusturalya Barfiksi',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/avusturalya_barfiks.mp4',
      information:
          'Avustralya barfiksi nispeten benzer ve insanlar tarafından standart veya çene yukarı çekme olarak bilinen bir egzersizdir.'
          'Standart barfikslerin başka bir alternatifidir, ancak Avustralya barfiksi yukarıyı gerçekleştirirken çok basit  ve etkilidir.'
          'Kendinizi çubuğun altına (yatay pozisyon) koyun, böylece orta sırt kaslarına doğru olmayan bir açıdan vurulmasını sağlayın.'
          'Avustralya barfiksi, egzersiz sırasında dengeyi öğrenmek için veya geleneksel stiller ile kasları inşa etmeye, çekmeye ve gücü geliştirmeye çalışırken kolayca kullanılabilir.'),
  Exercise(
    title: 'Leg Raises',
    description: 'Detaylı Anlatım İçin Tıklayın.',
    localVideo: 'videos/knee_leg.mp4',
    information:
        'Alt karın kaslarını güçlendiren, sırt üstü yatarak, bacaklarınızı aynı anda havaya kaldırarak uygulanan temel bir '
        'karın egzersizidir. Tüm bacak kaldırma egzersizleri, sabit eklem hareketleri içerdikleri için leg raise hareketi de,'
        'hem karın hem de kalça bölgenizin esnekliğini artırır. genellikle alt karın kasları için daha yüksek gözükse de tüm'
        'çekirdek kasların çalışmasını sağlamaktadır. Herhangi bir özel ekipmana ihtiyaç olmadan yapılabilirdir.',
  ),
  Exercise(
      title: 'Mekik',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/mekik.mp4',
      information:
          'Mekik bireylerin karın kaslarını sıkılaştırmak ve güçlendirmek için yaptıkları beden hareketidir.'
          'Bir çok kişi mekik hareketini karın bölgesindeki yağların eritileceğini düşünerek yapar.'
          'Bu hareketi özellikle bayanlar bel bölgesinde oluşan simitleri yok etmek ve düz bir karına sahip olabilmek'
          'için, erkekler ise göbeksiz ve tabiri caizse baklava dilimli bir vücuda kavuşabilmek için yaparlar.'
          'Yukarıda tanımını yaptığımız üzere mekik hareketinin asıl amacı karın kaslarını sıkılaştırmak ve güçlendirmektir.'),
  Exercise(
      title: 'Muscle Up',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/muscle_up.mp4',
      information:
          'Muscle-up, üst vücut kuvveti, toplam vücut koordinasyonu ve orta hat stabilitesi gerektiren gelişmiş bir vücut'
          'ağırlığı hareketidir. Birçok fitness hocası ve rekabetçi fitness sporcusu, rekabetçi'
          'Fonksiyonel Fitness Egzersizlerinde, yarışmalarda performansı artırmak için kas geliştirme ve varyasyonlarında'
          'ustalaşmaya çalışır.Bu, radyal bir yukarı çekmenin ardından bir dalmanın bir kombinasyon rutinidir.'),
  Exercise(
      title: 'Şınav',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/sinav.mp4',
      information:
          'Yüzüstü pozisyondan başlayan yaygın bir jimnastik egzersizidir. Kolları kullanarak vücudu yükseltip alçaltarak;'
          'göğüs kaslarını, trisepsleri ve ön deltoidleri çalıştırır. Şınav, sivil atletik eğitimde veya beden eğitiminde'
          've genellikle askeri beden eğitiminde kullanılan temel bir egzersizdir. Şınav öncelikle göğüs, kol ve omuz'
          'kaslarını hedeflerken, diğer kaslardan gereken destek, egzersize entegre edilen daha geniş bir kas yelpazesi ile sonuçlanır.'),
  Exercise(
      title: 'Omuz Şınavı',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/omuz_sinavi.mp4',
      information:
          'Omuz şınavı, omuzlarda ve trisepslerde gücü ve dengeyi artıran şınavın bir varyasyonudur.'
          'Egzersizi daha dik bir pozisyonda yapmak göğüsten çok omuzları hedef alacaktır.'
          'Omuz bıçaklarınızın serbestçe hareket etmesine izin vererek, kürek kemiğinizi sabit tutan ve yukarı doğru'
          'dönmesine yardımcı olan hayati bir kas olan serratus anterioru güçlendirir. Güçlü bir serratus anterior,'
          'başınızın üzerine bastığınızda omuz sıkışmasını azaltır.'),
  Exercise(
      title: 'Squat',
      description: 'Detaylı Anlatım İçin Tıklayın.',
      localVideo: 'videos/squat.mp4',
      information:
          'Gerçekleştiren kişinin ayakta durma pozisyonundayken kalçalarını alçaltması, sonrasında ise tekrar'
          'başlangıç pozisyonuna dönmesini içeren bir egzersizdir. Egzersizin çömelme kısmında, kalça ve diz eklemleri fleksiyona,'
          'ayak bileği eklemleri ise dorsifleksiyon uğrar, başlangıca dönülürken ise kalça ve diz eklemleri ekstense olur, ayak'
          'bileği eklemi de plantarfleksiyona uğrar.Squat, alt vücut kaslarının gücünü ve boyutunu arttırmanın yanı sıra,'
          'core kaslarını geliştirmek için de önemli bir egzersiz olarak kabul edilir.')
];
