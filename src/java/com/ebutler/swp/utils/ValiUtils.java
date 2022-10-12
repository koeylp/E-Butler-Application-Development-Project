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
    private static final String USERNAME_PATTERN = "\\S";
    
    public static boolean isPhone(String phone) {
        return phone.trim().matches(PHONE_PATTERN);
    }
    
    public static boolean isNonWhiteSpaceString(String parameter) {
        return parameter.matches(USERNAME_PATTERN);
    }
    
    public static boolean isValidLength(String parameter, int min, int max) {
        return (parameter.trim().length() >= min && parameter.trim().length() <= max);
    }
}
