package com.ja.classgroupware.auth.domain;

public class LoginDTO {

   private String user_id;
   private String user_password;
   private boolean useCookie;
   private String user_name;
   private String user_role;

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getUser_password() {
      return user_password;
   }
   
   public void setUser_password(String user_password) {
      this.user_password = user_password;
   }

   public boolean isUseCookie() {
      return useCookie;
   }

   public void setUseCookie(boolean useCookie) {
      this.useCookie = useCookie;
   }
   
   
   public String getUser_name() {
      return user_name;
   }

   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }

   public String getUser_role() {
      return user_role;
   }

   public void setUser_role(String user_role) {
      this.user_role = user_role;
   }

   @Override
   public String toString() {
      return "LoginDTO [id=" + user_id + ", password=" + user_password + ", useCookie=" + useCookie + "]";
   }
}
