/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dto;

/**
 *
 * @author thekh
 */
public class ShipperDTO {
    private String username;
    private String password;
    private String name;
    private int status;
    private double wallet;

    public ShipperDTO() {
        this.username = "";
        this.password = "";
        this.name = "";
        this.status = 0;
        this.wallet = 0;
    }

    public ShipperDTO(String username, String password, String name, int status, double wallet) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.status = status;
        this.wallet = wallet;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getWallet() {
        return wallet;
    }

    public void setWallet(double wallet) {
        this.wallet = wallet;
    }

   
    
}
