# Flutter ile Web Scrapping

Merhaba, Web sitelerinden veri çekme yöntemini (web scrapping ) nasıl kullanacağımızı adım adım anlatacağım. Açıklama kısmındaki görseller, kaynak koddaki kodlar ile farklılık gösterebilir(README dosyasını daha sonra hazırladım çünkü).Ama çalışma mantığı aynıdır ve benzerdir.

*Adım 1 :*  ### Model yazma
Öncelikle uygulamamızda gerekli olan model özelliklerini belirlememiz gerekiyor. Biz uygulamamızda kulanıcılara ingilizce ve o kelimelerin türkçe karşılıklarını sunacağımızı belirttiğimiz için aşağıdaki görseldeki gibi bir model yazdık.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/299f6f13-adef-4193-8f94-a0a53a33ce08)

 	Görsel 1.1  Web sitesinden veri çekerken kullandığımız web word modeli 


*Adım 2 :*  ### Web sitesi belirleme ve web sitesinin yapısına bakma

İngilizce -türkçe kelimeler sunan belirlediğimiz bir web sitesinin sayfa yapısına bakıyoruz. İlgili kelime alanını imleç ile belirleyip f12 veya sağ klik yapıp incele diyoruz.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/1114fc3b-3a18-412c-b25e-f0bc363d5b36)
 	Görsel 1.2   Web sitesindeki ilgili alan için html yapısını bulma

*Adım 3 :* ### Html yapısını inceleme
Site yapımcısı aşağıdaki görseldede göreceğiniz üzere ingilizce kelimeleri ve karşılıklarını ul – li  liste şeklinde yazmış. Biz bu yapının dışındaki div’i bulup  onun içinde yazan class’ı buluyoruz. Bu class’ı bulmamızın nedeni sayfada başka ul-li yapısı varsa karışmaması için istediğimiz veriyi çekmemize yarayacak. Yapıyı inceleyip anladığımıza göre şimdi service kısmını yazıp veri çekme işlemlerine başlayabiliriz.

 ![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/01b1f689-d7d2-4446-8b50-db5f4c93ea7f)

 	Görsel 1.3   Web sitesindeki ilgili alan için html yapısını bulma

*Adım 4 :* ### Kullanacağımız paketleri belirleme
Kullandığımız teknolojiler ve yapılar : http ve html paketi. Http paketi, http istekleri yapmak html paketi ise html belgelerini analiz etmek ve verileri istediğimiz şekilde çekmek için kullandık. Bu paketleri projeye eklemek için, pub.dev sitesine gidip paketlerin güncel versiyonlarını pubspec.yaml dosyasızın altındaki dependencies altına ekleyebilirsiniz. Veya terminali açıp  ‘ flutter pub add http’ gibi add den sonra eklemek istediğiniz paketi yazıp ekleme yapabilirsiniz. 

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/e4c5959f-5dbd-4ea0-b5fe-230f5d3961a2)

	      Görsel 1.4   Pubspec.yaml dosyasına ilgili paketleri ekleme


*Adım 5 :* ### Service Kodunu yazma

İlk 4 satırda göreceğiniz üzere eklediğimiz paketler ve kullanacağımız modeli import ediyoruz. 
getWebsiteData adlı fonksiyonumuzu yazıyoruz ve bu servisi kullanacağımız sayfada FutureBuilder widgetını kullanacağımız için Future nesnesi içine alıyoruz ve onun içine de List<Word> yazarak bir kelime listesi döneceğimizi belirtiyoruz.
http istekleri genellikle zaman alabildiği için async -await yapısını kullandık. Hata yönetimi olarakta try-catch yapısını kullandık.
Daha sonra http.get isteği yapıyoruz ve gelen yanıtı response adlı bir değişkene atıyoruz.Gelen mesaj 200 adlı statusCode döndüyse işlemlere devam ediyoruz , dönmediyse hata mesajı ile kullanıcıyı bilgilendiriyoruz.
Çekeceğimiz verileri bir listeye eklemek için words adlı bir liste oluşturuyoruz.
Parser paketi ile belgeyi ayrıştırıyoruz ve document adlı değişkene atıyoruz.
Sonra document.querySelector kullanarak çekmek istediğimiz elementi belirtiriyoruz. Adım-3te belirttiğim üzere yapının class’ını ayırt edici özellik olsun diye bulmuştuk. Daha sonra yapının içindeki kelimelerin elementini belirtiyoruz.(li)
Kelimeleri trim() gibi fonksiyonlar yardımı ile istenilen kelimelerin başındaki ve sonundaki boşluklar temizlenir. Bu işlem kullanılan html yapısına göre değişir ama benzerdir.	

 ![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/e2ec7640-bc59-4458-bc91-fff2b4f8a718)

	Görsel 1.5   Toefl kelimeleri çekmek için yazdığımız servis sınıfı örneği
 
*Adım 6 :* ### Kullanılacak arayüzü tasarlama

Servis kodunda future fonksiyonu kullandığımız için bize bir future nesnesi döndürecek.Bu yüzden FutureBuilder widgetını kullandık. Bu widget iki parameter ister. Future ve builder. Future nesnesinde service class ında oluşturduğumuz fonksiyonu yazdık. Builder parametresi widget oluşturmada işe yarar ve. context ve snapshot gibi widget yönetiminde kullanılan parametreleri alır. Kullanıcılara çoklu kart şeklinde göstermek için widget olarakta Gridview widgetını kullandık. 


![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/fe5a5575-3db9-46fe-aa97-de391aeeceb5)

 	Görsel 1.6    Toefl Sayfası arayüz oluşturma
