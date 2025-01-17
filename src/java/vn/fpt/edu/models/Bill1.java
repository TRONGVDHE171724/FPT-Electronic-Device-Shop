/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author admin
 */
public class Bill1 {
    private int Bill_id;
    private double Total_price;
    private String Date;
    private int User_id;
    private String Address;
    private String Status;
    private String User_name;
    private String Province, District, Country;
    public Bill1() {
    }

    public Bill1(int Bill_id, double Total_price, String Date, String Address, String Status, String User_name) {
        this.Bill_id = Bill_id;
        this.Total_price = Total_price;
        this.Date = Date;
        this.Address = Address;
        this.Status = Status;
        this.User_name = User_name;
    }

    public Bill1(int Bill_id, double Total_price, String Date, String Address, String Status, String User_name, String Province, String District, String Country) {
        this.Bill_id = Bill_id;
        this.Total_price = Total_price;
        this.Date = Date;
        this.Address = Address;
        this.Status = Status;
        this.User_name = User_name;
        this.Province = Province;
        this.District = District;
        this.Country = Country;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String Province) {
        this.Province = Province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    

    public int getBill_id() {
        return Bill_id;
    }

    public void setBill_id(int Bill_id) {
        this.Bill_id = Bill_id;
    }

    public double getTotal_price() {
        return Total_price;
    }

    public void setTotal_price(double Total_price) {
        this.Total_price = Total_price;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public int getUser_id() {
        return User_id;
    }

    public void setUser_id(int User_id) {
        this.User_id = User_id;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getUser_name() {
        return User_name;
    }

    public void setUser_name(String User_name) {
        this.User_name = User_name;
    }
    
    
}
