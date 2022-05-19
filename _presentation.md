# 1
Farkas Martin - OpenCBDC Teljesítménytestelés
# 2 
Feladat: Az OpenCBDC renszer(Project Hamilton -- MIT MediaLab) valóságbeli adatokon alapuló teljesítménytesztelése
Motiváció: A project Hamilton kiváló eredményeinek (1.7M tx/s) reprodukálása, kapcsolódó adatok gyűtése, valamint az OpenCBDC rendszer megismerése és fejlesztési lehetőségek feltárása
# 3
Mi az OpenCBDC?
Fejlesztője: MIT Digital Currency Initiative & Boston FED
Project Hamilton többéves DJBP fejlestési projekt keretein belül kerül kiadásra 2022 Feb 3
Egy Retail DJBP prototyípus, amely ígéretes thruoghput teljesítményt mutat, de még jelentős limitációkkal rendelkezik, például a programozhatóság(local validation <-> Access to global state) és az auditálhatóság(Too strong privacy) teljes hiánya
# 4 
OpenCBDC teknikai megoldások
Tx validation parallelization with stateless local validation
UHS Data structure
# 5
Atomizer and 2PC arhitektúra
https://dci.mit.edu/opencbdc ábrák
Gyorsan elmondani hogyan megy végig a tranzakció a 2PC arhitektúrán
# 6
Valós idejű tranzakcióeloszlás egy országos méretű fizetési rendszerben
Kevés publikusan elérhető adat
Google Scholar + SciHub
Felkeresett szervek: MNB, OTP
Egyelőre nincs kollaboráció ezen a téren
# 7 
Tranzakciók végrehajtása JMeter-ben
JMeter screenshot
Hogyan érjük el a klienst? Dockeren kereszül
# 8
Saját Sampler
Feltételezés: A bottleneck a kliensalkalmazás OS-en keresztüli meghívása
Lehetséges megoldás: Saját Jmeter Sampler írása, ami a kliens-t JNI-n keresztül hívja meg
Eredmény: vegyes, talán nem ez a bottleneck
# 9
Futtatás BME Cloudban
Egy mondat a hálózat kialakításáról: Nem volt az MIT által előkészítve az alkalmazás
Eredmény: TBA
# 10
Hova tovább?
Az OpenCBDC egy ígéretes DJBP megoldásnak ígérkezik, érdemes a jelenleg fent álló limitációk mentén elindítani a kutatást, például a programozhatóság és az auditálhatóság mentén
# 11 Köszönöm a figyelmet!
