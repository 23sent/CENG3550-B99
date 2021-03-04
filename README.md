# ERC20 TOKEN -B99- for CENG3550
Utku Sağocak

## Arayüz
    Nereden başlayacağıma karar veremediğim için ERC20 arayüzünü openzeppelinin reposundan aldım. 
    Arayüzü temel alarak, gerekli methodları yazdım ve test ettim.

### totalSupply()
    Toplam arzı -tüm değerlerin toplamını- döndüren fonksiyon. Bu örnekte toplam arzı değiştirebilen bir faktör olmadığından daima sabit.

### balanceOf()
    Adresi girile kişinin sahib olduğu değerleri/bakiyeyi döndürüyor.

### transfer() - transferForm()
    Bir hesaptan diğerine değer transferi yapmanızı sağlıyor. Temelde yaptığı vericiden azalttığı kadar alıcıdan arttırmak. Fakat bundan önce işlem yapılabilecek en yüksek limitleri kontrol ediyor.

### approve() - allowance()
    Allowance, bir hesaptaki değerler ile, başka bir hesaptan yapılabilecek işlemlerin boyutunu tutuyor/döndürüyor. Bu durumda hesabın sahibi ya da ancak sahibin izin verdiği kişiler izin verildiği miktarda işlem yapabiliyor.
    Bu yetkiler ancak hesabın sahibi tarafından approve fonksiyonu ile ayarlanabiliyor.

## Extra - isIntProper (uint value)
    Standart IRC20 Token'larının birebir bir kopyası olmasını istemediğimden, ama büyük değişiklikler yapıcak kadar bilgi sahibi olmadığımdan B99'ı 9'un katı dışındaki sayılarla işlem yapmayacak şekilde değiştirmek için çok basit bir fonksiyon yazıp, setter'larda değerleri kontrol ettim.

## Ne öğrendiğimi düşünüyorum?
    Solidity nedir, temel düzeyde nasıl kullanılır. ERC20 nedir, temel düzeyde ERC20 standarlarında bir contrat nasıl yazılır.

## Neleri henüz öğrenemedim?
    Blockchain, transaction, coin, token nedir?