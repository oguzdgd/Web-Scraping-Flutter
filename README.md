# Flutter ile Web Scrapping 

##### You can find the English version of this article below

Merhaba, Web sitelerinden veri çekme yöntemini (web scrapping ) nasıl kullanacağımızı adım adım anlatacağım. Açıklama kısmındaki görseller, kaynak koddaki kodlar ile farklılık gösterebilir(README dosyasını daha sonra hazırladım çünkü).Ama çalışma mantığı aynıdır ve benzerdir.

### Adım 1 : Model yazma

Öncelikle uygulamamızda gerekli olan model özelliklerini belirlememiz gerekiyor. Biz uygulamamızda kulanıcılara ingilizce ve o kelimelerin türkçe karşılıklarını sunacağımızı belirttiğimiz için aşağıdaki görseldeki gibi bir model yazdık.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/299f6f13-adef-4193-8f94-a0a53a33ce08)

 	Görsel 1.1  Web sitesinden veri çekerken kullandığımız web word modeli 


### Adım 2 : Web sitesi belirleme ve web sitesinin yapısına bakma

İngilizce -türkçe kelimeler sunan belirlediğimiz bir web sitesinin sayfa yapısına bakıyoruz. İlgili kelime alanını imleç ile belirleyip f12 veya sağ klik yapıp incele diyoruz.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/1114fc3b-3a18-412c-b25e-f0bc363d5b36)

 	Görsel 1.2   Web sitesindeki ilgili alan için html yapısını bulma

### Adım 3 : Html yapısını inceleme

Site yapımcısı aşağıdaki görseldede göreceğiniz üzere ingilizce kelimeleri ve karşılıklarını ul – li  liste şeklinde yazmış. Biz bu yapının dışındaki div’i bulup  onun içinde yazan class’ı buluyoruz. Bu class’ı bulmamızın nedeni sayfada başka ul-li yapısı varsa karışmaması için istediğimiz veriyi çekmemize yarayacak. Yapıyı inceleyip anladığımıza göre şimdi service kısmını yazıp veri çekme işlemlerine başlayabiliriz.

 ![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/01b1f689-d7d2-4446-8b50-db5f4c93ea7f)

 	Görsel 1.3   Web sitesindeki ilgili alan için html yapısını bulma

### Adım 4 : Kullanacağımız paketleri belirleme

Kullandığımız teknolojiler ve yapılar : http ve html paketi. Http paketi, http istekleri yapmak html paketi ise html belgelerini analiz etmek ve verileri istediğimiz şekilde çekmek için kullandık. Bu paketleri projeye eklemek için, pub.dev sitesine gidip paketlerin güncel versiyonlarını pubspec.yaml dosyasızın altındaki dependencies altına ekleyebilirsiniz. Veya terminali açıp  ‘ flutter pub add http’ gibi add den sonra eklemek istediğiniz paketi yazıp ekleme yapabilirsiniz. 

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/e4c5959f-5dbd-4ea0-b5fe-230f5d3961a2)

	      Görsel 1.4   Pubspec.yaml dosyasına ilgili paketleri ekleme


### Adım 5 : Service Kodunu yazma

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
 
### Adım 6 : Kullanılacak arayüzü tasarlama

Servis kodunda future fonksiyonu kullandığımız için bize bir future nesnesi döndürecek.Bu yüzden FutureBuilder widgetını kullandık. Bu widget iki parametre ister. Future ve builder. Future nesnesinde service class'ında oluşturduğumuz fonksiyonu yazdık. Builder parametresi widget oluşturmada işe yarar ve. context ve snapshot gibi widget yönetiminde kullanılan parametreleri alır. Kullanıcılara çoklu kart şeklinde göstermek için widget olarakta Gridview widgetını kullandık. 


![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/fe5a5575-3db9-46fe-aa97-de391aeeceb5)

 	Görsel 1.6    Toefl Sayfası arayüz oluşturma


# English

# Web Scraping with Flutter
Hello, I will explain step by step how to use web scraping to fetch data from websites. Please note that the images in the description may differ from the source code in the README file (I prepared it later). However, the working logic is the same and similar.

### Step 1: Writing the Model
First, we need to define the necessary model features for our application. In our application, as indicated, we wrote a model that provides users with English words and their Turkish counterparts.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/299f6f13-adef-4193-8f94-a0a53a33ce08)

 	Görsel 1.1  Web sitesinden veri çekerken kullandığımız web word modeli 

### Step 2: Determining the Website and Examining the Website's Structure
We are examining the page structure of a chosen website where we provide English-Turkish word pairs. We use F12 or right-click and inspect to identify the relevant word area.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/1114fc3b-3a18-412c-b25e-f0bc363d5b36)

 	Görsel 1.2   Web sitesindeki ilgili alan için html yapısını bulma


### Step 3: Examining the HTML Structure
As seen in the image below, the site creator has written English words and their counterparts in an ul-li list structure. We find the div outside of this structure and determine the class inside it. We find this class to ensure that if there are other ul-li structures on the page, they do not interfere with fetching the desired data.

 ![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/01b1f689-d7d2-4446-8b50-db5f4c93ea7f)

 	Görsel 1.3   Web sitesindeki ilgili alan için html yapısını bulma


### Step 4: Determining the Packages to Use
The technologies and structures we used: http and html packages. We used the http package for making HTTP requests and the html package for analyzing HTML documents and fetching data as desired. To add these packages to the project, you can go to the pub.dev website, find the latest versions of the packages, and add them under dependencies in the pubspec.yaml file. Alternatively, you can open the terminal and add the desired package after 'flutter pub add [package name]'.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/e4c5959f-5dbd-4ea0-b5fe-230f5d3961a2)

	      Görsel 1.4   Pubspec.yaml dosyasına ilgili paketleri ekleme

### Step 5: Writing the Service Code
In the first four lines, we import the added packages and the model we will use. We write our getWebsiteData function, which will be used in the service, within a FutureBuilder widget since we will use it on the page, specifying that it will return a list of words inside a Future object. We used the async-await structure since http requests can take time. We used the try-catch structure for error handling. Then, we make an http.get request and assign the response to a variable called 'response'. If the returned status code is 200, we continue with the process; otherwise, we inform the user with an error message. We create a list called 'words' to add the data we will fetch. We parse the document using the parser package and assign it to a variable called 'document'. Then, using document.querySelector, we specify the element we want to fetch, which, as mentioned in Step 3, is determined by the class of the structure. We then specify the element of the words inside that structure (li). We clean the words using functions like trim() to remove leading and trailing spaces. This process may vary depending on the HTML structure used but is similar.

 ![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/e2ec7640-bc59-4458-bc91-fff2b4f8a718)

	Görsel 1.5   Toefl kelimeleri çekmek için yazdığımız servis sınıfı örneği

### Step 6: Designing the Interface to be Used
Since we used the future function in the service code, it will return a future object. Therefore, we used the FutureBuilder widget. This widget requires two parameters: Future and builder. In the Future object, we wrote the function created in the service class. The builder parameter is useful in widget creation and takes parameters such as context and snapshot used in widget management. To display to users in a multi-card format, we used the GridView widget.

![image](https://github.com/oguzdgd/Web-Scraping-Flutter/assets/109076888/fe5a5575-3db9-46fe-aa97-de391aeeceb5)

 	Görsel 1.6    Toefl Sayfası arayüz oluşturma
