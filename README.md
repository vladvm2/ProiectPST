# Magazin Online Electronice
Descriere Proiect

Proiectul "Magazin Online Electronice" este o aplicație web pentru un magazin virtual ce se concentrează pe vânzarea de produse electronice. Aplicația oferă funcționalități de bază pentru administrarea produselor, utilizatorilor și categoriilor, precum și o interfață simplă pentru vizualizarea și achiziționarea produselor de către clienți.
Instalare și Rulare în Modul Development
Cerințe Preliminare

    Java JDK 17 sau mai nou
    Maven (pentru build și gestionare dependențe)
    MySQL Server (pentru baza de date)

    Rularea aplicației:

    ```sh
    mvn spring-boot:run
    ```
Implementarea CRUD pentru Gestionarea Produselor

Modulul CRUD (Create, Read, Update, Delete) este implementat în proiect pentru gestionarea produselor. Acesta permite administrarea completă a produselor din magazin, oferind următoarele funcționalități:

    Create (Creare): Posibilitatea de a adăuga produse noi în magazin. Aceasta se realizează prin interfața de administrare accesibilă utilizatorilor cu rolul de admin.
    Read (Citire): Vizualizarea produselor existente, atât în interfața de administrare, cât și în cea destinată clienților.
    Update (Actualizare): Modificarea detaliilor unui produs (nume, descriere, preț, etc.). Această funcție este accesibilă din panoul de administrare.
    Delete (Ștergere): Eliminarea produselor din magazin, funcționalitate disponibilă administratorilor.

Toate aceste operații sunt gestionate prin ProductController, care manipulează datele cu ajutorul ProductService și interacționează cu baza de date prin ProductRepository. Interfața grafică este realizată cu Thymeleaf, permițând interacțiuni intuitive cu utilizatorul.
