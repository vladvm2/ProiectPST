package com.syqu.shop.service.impl;

// Pachetul în care se află clasa

import com.syqu.shop.service.UserService;
import com.syqu.shop.domain.User;
import com.syqu.shop.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;



@Service
// Anotație Spring care indică faptul că această clasă este un serviciu (o componentă de business logic)

public class UserServiceImpl implements UserService {
    // Declarația clasei care implementează interfața UserService

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    // Logger SLF4J pentru înregistrarea mesajelor

    // Injectarea dependențelor necesare folosind constructorul
    private final UserRepository userRepository;
    private final UserDetailsService userDetailsService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final AuthenticationManager authenticationManager;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder, UserDetailsService userDetailsService, AuthenticationManager authenticationManager) {
        // Constructorul clasei pentru injectarea dependențelor
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.userDetailsService = userDetailsService;
        this.authenticationManager = authenticationManager;
    }

    @Override
    public void save(User user) {
        // Metoda pentru salvarea unui utilizator
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        // Codificarea parolei utilizatorului înainte de salvare
        userRepository.save(user);
        // Salvarea utilizatorului în baza de date
    }

    @Override
    public void login(String username, String password) {
        // Metoda pentru autentificarea unui utilizator
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        // Încărcarea detaliilor utilizatorului după numele de utilizator
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
        // Crearea unui token de autentificare
        authenticationManager.authenticate(token);
        // Autentificarea utilizatorului

        if (token.isAuthenticated()) {
            // Verificarea dacă autentificarea a fost realizată cu succes
            SecurityContextHolder.getContext().setAuthentication(token);
            // Stabilirea contextului de securitate cu tokenul autentificat
            logger.debug(String.format("User %s logged in successfully!", username));
            // Înregistrarea unui mesaj de succes
        } else {
            logger.error(String.format("Error with %s authentication!", username));
            // Înregistrarea unui mesaj de eroare în caz de eșec
        }
    }

    @Override
    public User findByUsername(String username) {
        // Metoda pentru găsirea unui utilizator după numele de utilizator
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        // Metoda pentru găsirea unui utilizator după adresa de email
        return userRepository.findByEmail(email);
    }

    @Override
    public User findById(long id) {
        // Metoda pentru găsirea unui utilizator după ID
        return userRepository.findById(id);
    }
}
