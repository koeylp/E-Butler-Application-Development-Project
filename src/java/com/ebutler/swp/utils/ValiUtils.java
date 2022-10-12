/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.utils;

/**
 *
 * @author Admin
 */
public class ValiUtils {
    private static final String PHONE_PATTERN = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$";
    private static final String USERNAME_PATTERN = "^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$";
    private static final String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
    private static final String STRING_PATTERN = "[a-zA-Z ]+";
    
    public static boolean isPhone(String phone) {
        return phone.trim().matches(PHONE_PATTERN);
    }
    
    public static boolean isValidUsername(String parameter) {
        return !parameter.matches(USERNAME_PATTERN);
    }
    
    public static boolean isValidPassword(String parameter) {
        return parameter.matches(PASSWORD_PATTERN);
    }
    
    public static boolean isValidString(String parameter) {
        return parameter.matches(STRING_PATTERN);
    }
    
    public static boolean isValidLength(String parameter, int min, int max) {
        return (parameter.length() >= min && parameter.length() <= max);
    }
}
